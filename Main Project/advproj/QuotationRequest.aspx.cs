using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace advproj
{
    public class PurchaseInfo
    {
        public int itemID { get; set; }
        public string itemName { get; set; }
        public int quantity { get; set; }
        public string reason { get; set; }
    }
    public static class PersistentInfo
    {
        public static int purchaseRequestID;
        public static int quotationID;
        public static DateTime purchaseRequestDate;
        public static string purchaseRequestType = "";
        public static List<PurchaseInfo> purchaseInfo = new List<PurchaseInfo>();

        public static void clearPurchaseInfoList()
        {
            purchaseInfo.Clear();
        }

    }
    public partial class QuotationRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Get the quotation ID
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdvProcurementProcessingConnectionString"].ConnectionString);
            conn.Open();
            string str = "SELECT TOP 1 QuotationID FROM QuotationMaster ORDER BY QuotationID DESC;";
            SqlCommand com = new SqlCommand(str, conn);            
            SqlDataReader sdr = com.ExecuteReader();
            if (sdr.Read())
            {
                PersistentInfo.quotationID = Convert.ToInt16(sdr.GetValue(0)) + 1;
            }
            else
                PersistentInfo.quotationID = 1;

            Quotation_IDTextBox.Text = PersistentInfo.quotationID.ToString();
            conn.Close();
            ValidPRIDLabel.Visible = false;
            //PersistentInfo.clearPurchaseInfoList();
            QuotationItemsGridView.RowEditing += new GridViewEditEventHandler(QuotationItemsGridView_RowEditing);
            QuotationItemsGridView.RowUpdating += new GridViewUpdateEventHandler(QuotationItemsGridView_RowUpdating);
            QuotationItemsGridView.RowCancelingEdit += new GridViewCancelEditEventHandler(QuotationItemsGridView_RowCancelingEdit);

        }

        protected void PR_IDTextBox_TextChanged(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdvProcurementProcessingConnectionString"].ConnectionString);
            conn.Open();
            string str = "";
            PersistentInfo.clearPurchaseInfoList();
            if (PR_IDTextBox.Text != "")
            {
                //Initialize the RequestType and PurchaseRequestDate
                PersistentInfo.purchaseRequestID = Convert.ToInt16(PR_IDTextBox.Text);
                str = "select RequestType,PurchaseRequestDate from PurchaseRequestMaster where PurchaseRequestID=" + PersistentInfo.purchaseRequestID + ";";
                SqlCommand com = new SqlCommand(str, conn);
                SqlDataReader sdr = com.ExecuteReader();
                string vendorType = "";
                if (sdr.Read())
                {
                    ValidPRIDLabel.Visible = false;
                    vendorType = sdr.GetValue(0).ToString();
                    PersistentInfo.purchaseRequestType = string.Copy(vendorType);
                    Vendor_TypeDropDown.SelectedValue = vendorType;
                    PersistentInfo.purchaseRequestDate = sdr.GetDateTime(1);
                }
                else
                {
                    ValidPRIDLabel.Visible = true;
                }
                sdr.Close();

                //Execute a query to fetch all the purchase request details from PurchaseRequestDetails Table and store them into PersistentInfo.purchaseInfo list
                str = "SELECT PurchaseRequestDetails.PurchaseRequestID,PurchaseRequestDetails.ItemID,ItemMaintenance.ItemName,PurchaseRequestDetails.Quantity,PurchaseRequestDetails.Reason FROM PurchaseRequestDetails INNER JOIN ItemMaintenance ON PurchaseRequestDetails.ItemID=ItemMaintenance.ItemID WHERE PurchaseRequestDetails.PurchaseRequestID=" + PersistentInfo.purchaseRequestID + ";";
                com.CommandText = str;
                sdr = com.ExecuteReader();

                while (sdr.Read())
                {
                    PurchaseInfo purchaseInfoItem = new PurchaseInfo();
                    purchaseInfoItem.itemID = Convert.ToInt16(sdr.GetValue(1));
                    purchaseInfoItem.itemName = sdr.GetValue(2).ToString();
                    purchaseInfoItem.quantity = Convert.ToInt16(sdr.GetValue(3));
                    purchaseInfoItem.reason = sdr.GetValue(4).ToString();
                    PersistentInfo.purchaseInfo.Add(purchaseInfoItem);
                }
                sdr.Close();
            }
            else
            {
                //ValidPRIDLabel.Visible = true;
            }
            conn.Close();
            fillGV();
        }

        protected void QuotationItemsGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            QuotationItemsGridView.EditIndex = e.NewEditIndex;
            BindData();
        }
        protected void QuotationItemsGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String txtQuantity = ((TextBox)QuotationItemsGridView.Rows[e.RowIndex].FindControl("txtQuantity")).Text;
            //String txtReason = ((TextBox)QuotationItemsGridView.Rows[e.RowIndex].FindControl("txtReason")).Text;

            DataTable dt = (DataTable)Session["QuotationItemsTable"];
            GridViewRow row = QuotationItemsGridView.Rows[e.RowIndex];

            dt.Rows[row.DataItemIndex]["Qty"] = txtQuantity;
            PersistentInfo.purchaseInfo[e.RowIndex].quantity = Convert.ToInt16(txtQuantity);
            //dt.Rows[row.DataItemIndex]["Reason"] = txtReason;
            //PersistentInfo.purchaseInfo[e.RowIndex].reason = txtReason;

            QuotationItemsGridView.EditIndex = -1;
            BindData();
        }

        protected void QuotationItemsGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            QuotationItemsGridView.EditIndex = -1;
            BindData();
        }

        private void BindData()
        {
            QuotationItemsGridView.DataSource = Session["QuotationItemsTable"];
            QuotationItemsGridView.DataBind();
        }

        void fillGV()
        {
            DataTable ItemDetailsTable = new DataTable("QuotationItemsTable");

            ItemDetailsTable.Columns.Add("ItemName");
            ItemDetailsTable.Columns.Add("Qty");
            ItemDetailsTable.Columns.Add("Reason");

            //Add items from Purchase Request to QuotationItemGridView
            int counterR = 0;

            for (int i = 0; i < PersistentInfo.purchaseInfo.Count; i++)
            {
                DataRow newRow = ItemDetailsTable.NewRow();
                ItemDetailsTable.Rows.Add(newRow);
                ItemDetailsTable.Rows[counterR]["ItemName"] = PersistentInfo.purchaseInfo[i].itemName;
                ItemDetailsTable.Rows[counterR]["Qty"] = PersistentInfo.purchaseInfo[i].quantity;
                ItemDetailsTable.Rows[counterR]["Reason"] = PersistentInfo.purchaseInfo[i].reason;
                counterR++;
            }
            Session["QuotationItemsTable"] = ItemDetailsTable;
            QuotationItemsGridView.DataSource = ItemDetailsTable;
            QuotationItemsGridView.DataBind();
            QuotationItemsGridView.Visible = true;
        }
        protected void Vendor_NameListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillGV();
            QuotationItemsGridView.Visible = true;
        }

        protected void RequestQuotationButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdvProcurementProcessingConnectionString"].ConnectionString);
            conn.Open();

            int noOfQuotations = Vendor_NameListBox.GetSelectedIndices().Length;

            int prid = Convert.ToInt16(PR_IDTextBox.Text);
            string vendorName = "";
            DateTime shippingdate = System.DateTime.Today;
            float totalAmount = 0;
            string quotationStatus = "Quotation Sent";
            string updatedby = "Nitant";
            DateTime updatedate = System.DateTime.Today;
            string createdby = "Nitant";
            DateTime createdate = System.DateTime.Today;
            string commandString = "";
            SqlCommand cmd = new SqlCommand(commandString, conn);
            float unitPrice = 0;
            string tnc = "Timely Delivery";

            //Outer Loop enters data into the Quotation Master table for each vendor
            for (int i = 0; i < noOfQuotations; i++)
            {
                vendorName = Vendor_NameListBox.Items[i].Value;
                commandString = "insert into QuotationMaster(PurchaseRequestID,RequestType,VendorName,PurchaseRequestDate,ShippingDate,TotalAmount,QuotationStatus,UpdatedBy,UpdateDate,CreatedBy,CreationDate) VALUES (";
                commandString += prid + ",'" + PersistentInfo.purchaseRequestType + "','" + vendorName + "','" + PersistentInfo.purchaseRequestDate + "','" + shippingdate + "'," + totalAmount + ",'" + quotationStatus + "','" + updatedby + "','" + updatedate + "','" + createdby + "','" + createdate + "');";
                cmd.CommandText = commandString;
                cmd.ExecuteNonQuery();

                //This inner loop enters data into the Quotation Details table for each Item for the current vendor
                for (int j = 0; j < PersistentInfo.purchaseInfo.Count; j++)
                {
                    commandString = "insert into QuotationDetals (QuotationID,ItemID,ItemName,UnitPrice,Quantity,TermsAndCondition) VALUES (";
                    commandString += PersistentInfo.quotationID + "," + PersistentInfo.purchaseInfo[j].itemID + ",'" + PersistentInfo.purchaseInfo[j].itemName + "'," + unitPrice + "," + PersistentInfo.purchaseInfo[j].quantity + ",'" + tnc + "');";
                    cmd.CommandText = commandString;
                    cmd.ExecuteNonQuery();
                }
                PersistentInfo.quotationID++;
            }
            conn.Close();
        }

        protected void Vendor_TypeDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
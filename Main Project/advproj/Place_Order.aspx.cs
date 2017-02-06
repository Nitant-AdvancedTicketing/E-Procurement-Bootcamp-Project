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
    public partial class Place_Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdvProcurementProcessingConnectionString"].ConnectionString);
            conn.Open();
            string str = "Select TOP 1 PurchaseOrderID FROM PurchaseOrderMaster ORDER BY PurchaseOrderID DESC";
            SqlCommand com = new SqlCommand(str, conn);
            // int count = Convert.ToInt16(com.ExecuteScalar()) + 1;
            SqlDataReader sdr = com.ExecuteReader();
            if (sdr.Read())
            {
                PersistentInfo.purchaseorderid = Convert.ToInt16(sdr.GetValue(0)) + 1;
            }
            else
                PersistentInfo.purchaseorderid = 1;

            PurchaseOrder_IDTextBox.Text = PersistentInfo.purchaseorderid.ToString();

            sdr.Close();
            conn.Close();

            PlaceOrderGridView.RowEditing += new GridViewEditEventHandler(PlaceOrderGridView_RowEditing);
            PlaceOrderGridView.RowUpdating += new GridViewUpdateEventHandler(PlaceOrderGridView_RowUpdating);
            PlaceOrderGridView.RowCancelingEdit += new GridViewCancelEditEventHandler(PlaceOrderGridView_RowCancelingEdit);

            fillGV();
        }
        public  class PurchaseOrderInfo
        {
            public int itemID { get; set; }
            public string itemName { get; set; }
            public int quantity { get; set; }
            public string reason { get; set; }

            public double unitprice { get; set; }
            public string termsandcondition { get; set; }
        }
        public static class PersistentInfo
        {
            public static int purchaseorderid;

            public static int quotationid;
           
            public static int vendorid;
            public static DateTime purchaseorderdate;
            public static DateTime shippingdate;
            public static double totalamount;
            public static string status;
            public static string purchaseorderby;
            public static string updatedby;
            public static DateTime updatedate;
            public static string purchaserequesttype;
            public static int purchaserequestid;
            public static List<PurchaseOrderInfo> purchaseInfo = new List<PurchaseOrderInfo>();

            public static void clearPurchaseOrderInfoList()
            {
                purchaseInfo.Clear();
            }

        }

        protected void Quotation_IDTextBox_TextChanged(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdvProcurementProcessingConnectionString"].ConnectionString);
            conn.Open();
            string str = "";
            PersistentInfo.clearPurchaseOrderInfoList();
            if (Quotation_IDTextBox.Text != "")
            {
                PersistentInfo.quotationid = Convert.ToInt16(Quotation_IDTextBox.Text);
                str = "select PurchaseRequestID,RequestType FROM QuotationMaster where QuotationID=" + PersistentInfo.quotationid;
                SqlCommand cmd = new SqlCommand(str, conn);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    ValidQuotationLabel.Visible = false;                                      
                    PersistentInfo.purchaserequestid = Convert.ToInt16(sdr.GetValue(0));
                    PersistentInfo.purchaserequesttype = sdr.GetValue(1).ToString();
                    Vendor_TypeDropDown.SelectedValue = PersistentInfo.purchaserequesttype;
                }
                else
                {
                    ValidQuotationLabel.Visible = true;
                }
                sdr.Close();
                //Fill Vendor Drop Down with Vendors in the Quotataion Master Table with current QuotationID
                str = "SELECT VendorMaintenance.VendorID,VendorMaintenance.VendorName,QuotationMaster.VendorName FROM VendorMaintenance INNER JOIN QuotationMaster ON VendorMaintenance.VendorName=QuotationMaster.VendorName where QuotationMaster.QuotationID=" + PersistentInfo.quotationid;
                cmd.CommandText = str;
                sdr = cmd.ExecuteReader();
                Vendor_NameDropDown.Items.Clear();
                while(sdr.Read())
                {
                    Vendor_NameDropDown.Items.Add(sdr.GetValue(1).ToString());
                }
                sdr.Close();


                str = "SELECT ItemID,ItemName,UnitPrice,Quantity,TermsAndCondition FROM QuotationDetals where QuotationID=" + PersistentInfo.quotationid;
                cmd.CommandText = str;
                sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    PurchaseOrderInfo purchaseorderitem = new PurchaseOrderInfo();
                    purchaseorderitem.itemID = Convert.ToInt16(sdr.GetValue(0).ToString());
                    purchaseorderitem.itemName = sdr.GetValue(1).ToString();
                    purchaseorderitem.unitprice = Convert.ToDouble(sdr.GetValue(2).ToString());
                    purchaseorderitem.quantity = Convert.ToInt16(sdr.GetValue(3).ToString());
                    purchaseorderitem.termsandcondition = sdr.GetValue(4).ToString();
                    PersistentInfo.purchaseInfo.Add(purchaseorderitem);
                }
                sdr.Close();               
            }
          
            conn.Close();
            fillGV();
        }

        protected void PlaceOrderGridView_RowEditing(object sender,GridViewEditEventArgs e)
        {
            PlaceOrderGridView.EditIndex = e.NewEditIndex;
            BindData();

        }
        protected void PlaceOrderGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String txtQuantity = ((TextBox)PlaceOrderGridView.Rows[e.RowIndex].FindControl("txtQuantity")).Text;
            String txtTermsAndCondition = ((TextBox)PlaceOrderGridView.Rows[e.RowIndex].FindControl("txtTermsAndCondition")).Text;

            DataTable dt = (DataTable)Session["PlaceOrderTable"];
            GridViewRow row = PlaceOrderGridView.Rows[e.RowIndex];

            dt.Rows[row.DataItemIndex]["Qty"] = txtQuantity;
            PersistentInfo.purchaseInfo[e.RowIndex].quantity = Convert.ToInt16(txtQuantity);
            dt.Rows[row.DataItemIndex]["TermsAndCondition"] = txtTermsAndCondition;
            PersistentInfo.purchaseInfo[e.RowIndex].reason = txtTermsAndCondition;

            PlaceOrderGridView.EditIndex = -1;
            BindData();
        }
        protected void PlaceOrderGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            PlaceOrderGridView.EditIndex = -1;
            BindData();
        }
        private void BindData()
        {
            PlaceOrderGridView.DataSource = Session["PlaceOrderTable"];
            PlaceOrderGridView.DataBind();

        }
        void fillGV()
        {
            DataTable ItemDetailsTable = new DataTable("PlaceOrderTable");

            ItemDetailsTable.Columns.Add("ItemName");
            ItemDetailsTable.Columns.Add("Qty");
            ItemDetailsTable.Columns.Add("TermsAndCondition");

            //Add items from Purchase Request to QuotationItemGridView
            int counterR = 0;

            for (int i = 0; i < PersistentInfo.purchaseInfo.Count; i++)
            {
                DataRow newRow = ItemDetailsTable.NewRow();
                ItemDetailsTable.Rows.Add(newRow);
                ItemDetailsTable.Rows[counterR]["ItemName"] = PersistentInfo.purchaseInfo[i].itemName;
                ItemDetailsTable.Rows[counterR]["Qty"] = PersistentInfo.purchaseInfo[i].quantity;
                ItemDetailsTable.Rows[counterR]["TermsAndCondition"] = PersistentInfo.purchaseInfo[i].termsandcondition;
                counterR++;
            }
            Session["PlaceOrderTable"] = ItemDetailsTable;
            PlaceOrderGridView.DataSource = ItemDetailsTable;
            PlaceOrderGridView.DataBind();
            PlaceOrderGridView.Visible = true;
        }


        protected void Vendor_NameDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SendPOButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdvProcurementProcessingConnectionString"].ConnectionString);
            conn.Open();
            string currentvendorname = Vendor_NameDropDown.SelectedValue;
            string str = "SELECT VendorID FROM VendorMaintenance where VendorName=" + currentvendorname;
            SqlCommand cmd = new SqlCommand(str, conn);
            SqlDataReader sdr = cmd.ExecuteReader();
            if(sdr.Read())
            {
                PersistentInfo.vendorid = Convert.ToInt16(sdr.GetValue(0).ToString());

            }
            else
            {

            }
            sdr.Close();
            DateTime purchaseorderdate = System.DateTime.Today;
            DateTime shippingdate = System.DateTime.Today;
            str = "SELECT TotalAmount FROM QuotationMaster where QuotationID=" + PersistentInfo.quotationid;
            cmd.CommandText = str;
            sdr = cmd.ExecuteReader();
            if(sdr.Read())
            {
                PersistentInfo.totalamount = Convert.ToDouble(sdr.GetValue(0).ToString());

            }
            sdr.Close();
            string status = "Order Placed";
            string purchaseorderby = "shivani";
            string updatedby = "nitant";
            DateTime updatedate = System.DateTime.Today;
            str = "SELECT RequestType FROM Quotation_Master where QuotationID=" + PersistentInfo.quotationid;
            cmd.CommandText = str;
            sdr = cmd.ExecuteReader();
            if(sdr.Read())
            {
                PersistentInfo.purchaserequesttype = sdr.GetValue(0).ToString();

            }
            sdr.Close();
            str = "insert into PurchaseOrderMaster(PurchaseOrderID,RequestType,QuotationID,PurchaseRequestID,VendorID,PurchaseOrderDate,ShippingDate,TotalAmount,Status,PurchaseOrderBy,UpdatedBy,UpdateDate)VALUES(" + PersistentInfo.purchaseorderid + ",'" + PersistentInfo.purchaserequesttype + "'," + PersistentInfo.quotationid + "," + PersistentInfo.purchaserequestid + "," + PersistentInfo.vendorid + ",'" + purchaseorderdate + "','" + shippingdate + "'," + PersistentInfo.totalamount + ",'" + status + "','" + purchaseorderby + "','" + updatedby + "','" + updatedate + "')";
            cmd.CommandText = str;
            cmd.ExecuteNonQuery();
            for (int i = 0; i < PersistentInfo.purchaseInfo.Count; i++)
            {
                str = "insert into PurchaseOrderDetails(PurchaseOrderID,ItemID,Quantity,UnitPrice)VALUES(" + PersistentInfo.purchaseorderid + "," + PersistentInfo.purchaseInfo[i].itemID + "," + PersistentInfo.purchaseInfo[i].quantity + "," + PersistentInfo.purchaseInfo[i].unitprice + ")";
                cmd.CommandText = str;
                cmd.ExecuteNonQuery();

            }
            PersistentInfo.purchaseorderid++;
            conn.Close();

        }
    }
}

       
    


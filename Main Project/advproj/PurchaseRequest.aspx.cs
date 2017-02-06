using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace advproj
{
    public static class ItemIDClass
    {
        public static List<int> ItemIds = new List<int>();     
        public static void clearList()
        {
            ItemIds.Clear();
        }   
    }
    public partial class PurchaseRequest : System.Web.UI.Page
    {             
        private bool isEditMode = false;

        public bool IsInEditMode { get { return this.isEditMode; } set { this.isEditMode = value; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdvProcurementProcessingConnectionString"].ConnectionString);
            conn.Open();

            //Initialize the Purchase Requst ID from the table
            string str = "SELECT TOP 1 PurchaseRequestID FROM PurchaseRequestMaster ORDER BY PurchaseRequestID DESC";
            SqlCommand com = new SqlCommand(str, conn);
            //int count = Convert.ToInt16(com.ExecuteScalar()) + 1;
            SqlDataReader sdr = com.ExecuteReader();
            if (sdr.Read())
            {
                Session["PurchaseRequestID"] = Convert.ToInt16(sdr.GetValue(0)) + 1;
            }
            else
                Session["PurchaseRequestID"] = 1;

            PurchaseRequestIDTextBox.Text = Session["PurchaseRequestID"].ToString();
            sdr.Close();
            //Initialize the itemIDs
            str = "select ItemID from ItemMaintenance where ItemType='" + TypeOfItemDropDown.SelectedValue + "';";
            com.CommandText = str;
            sdr = com.ExecuteReader();
            ItemIDClass.clearList();
            while (sdr.Read())
            {
                ItemIDClass.ItemIds.Add(Convert.ToInt16(sdr.GetValue(0)));
            }

            conn.Close();

            if (!Page.IsPostBack)
            {
                fillGV();
            }                        
        }
        protected void ItemDetailsGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ItemDetailsGrid.EditIndex = e.NewEditIndex;
            BindData();
        }
        protected void ItemDetailsGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String txtQuantity = ((TextBox)ItemDetailsGrid.Rows[e.RowIndex].FindControl("txtQuantity")).Text;
            String txtReason = ((TextBox)ItemDetailsGrid.Rows[e.RowIndex].FindControl("txtReason")).Text;

            DataTable dt = (DataTable)Session["PurchaseRequestItemsTable"];
            GridViewRow row = ItemDetailsGrid.Rows[e.RowIndex];

            dt.Rows[row.DataItemIndex]["Qty"] = txtQuantity;            
            dt.Rows[row.DataItemIndex]["Reason"] = txtReason;

            ItemDetailsGrid.EditIndex = -1;
            BindData();            
        }

        protected void ItemDetailsGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ItemDetailsGrid.EditIndex = -1;
            BindData();           
        }
        void fillGV()
        {
            DataTable ItemDetailsTable = new DataTable();


            ItemDetailsGrid.RowEditing += new GridViewEditEventHandler(ItemDetailsGrid_RowEditing);
            ItemDetailsGrid.RowUpdating += new GridViewUpdateEventHandler(ItemDetailsGrid_RowUpdating);
            ItemDetailsGrid.RowCancelingEdit += new GridViewCancelEditEventHandler(ItemDetailsGrid_RowCancelingEdit);

            ItemDetailsTable.Columns.Add("ItemName");
            ItemDetailsTable.Columns.Add("Qty");
            ItemDetailsTable.Columns.Add("Reason");
            
            //List<string> selectedManagersListDates = new List<string>();
            int counterR = 0;

            int[] selectedIndices = ItemListBox.GetSelectedIndices();
            
            for (int i=0; i<selectedIndices.Length;i++)
            {
                DataRow newRow = ItemDetailsTable.NewRow();
                ItemDetailsTable.Rows.Add(newRow);                
                ItemDetailsTable.Rows[counterR]["ItemName"] = ItemListBox.Items[selectedIndices[i]];
                ItemDetailsTable.Rows[counterR]["Qty"] = 1;
                ItemDetailsTable.Rows[counterR]["Reason"] = "not available";
                counterR = counterR + 1;
            }
            Session["PurchaseRequestItemsTable"] = ItemDetailsTable;
            BindData();
        }

        private void BindData()
        {
            ItemDetailsGrid.DataSource = Session["PurchaseRequestItemsTable"];
            ItemDetailsGrid.DataBind();
        }
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            for (int i = 0; i <= ItemDetailsGrid.Rows.Count - 1; i++)
            {
                int sno = Convert.ToInt32(ItemDetailsGrid.Rows[i].Cells[1].Text);
                String txtQuantity = ((TextBox)ItemDetailsGrid.Rows[i].FindControl("txtQuantity")).Text;
                String txtReason = ((TextBox)ItemDetailsGrid.Rows[i].FindControl("txtReason")).Text;
            }
        }

        protected void SendRequestButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdvProcurementProcessingConnectionString"].ConnectionString);
            conn.Open();
            string str;            
            string email = "nct@gmail.com";
            DateTime purchaserequestdate = System.DateTime.Today;
            string purchaserequeststatus = "Pending";
            string purchaserequestby = "nitant";
            string updatedby = "nitant";
            string requestType = TypeOfItemDropDown.SelectedValue;
            DateTime updatedate = System.DateTime.Today;
            
            str = "insert into PurchaseRequestMaster(RequestType,EmailID,PurchaseRequestDate,PurchaseRequestStatus,PurchaseRequestBy,UpdatedBy,UpdateDate)VALUES('" +requestType+"','" +email + "','" + purchaserequestdate + "','" + purchaserequeststatus + "','" + purchaserequestby + "','" + updatedby + "','" + updatedate + "')";
        
            SqlCommand cmd = new SqlCommand(str, conn);
            
            cmd.ExecuteNonQuery();

            int quantity = 1;
            string reason = "need performance";
            int ItemID = 0;
            int[] selectedIndices = ItemListBox.GetSelectedIndices();
            GridViewRowCollection gridViewRows = ItemDetailsGrid.Rows;
            GridViewRow gvr;

            int k;
            for (int i =0; i<selectedIndices.Length; i++)
            {
                k = selectedIndices[i];
                ItemID = ItemIDClass.ItemIds.ElementAt(k);
                gvr = gridViewRows[i];
                quantity = Convert.ToInt16((gvr.FindControl("lblQuantity") as Label).Text);
                reason = (gvr.FindControl("lblReason") as Label).Text;
                cmd.CommandText = "insert into PurchaseRequestDetails (PurchaseRequestID,ItemID,Quantity,Reason) VALUES (" + Session["PurchaseRequestID"] + "," + ItemID + "," + quantity + ",'" + reason + "');";
                cmd.ExecuteNonQuery();
            }
            ItemIDClass.clearList();                          
            conn.Close();
        }

        protected void ItemListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            ItemDetailsGrid.Visible = true;
            fillGV();            
        }

        protected void TypeOfItemDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdvProcurementProcessingConnectionString"].ConnectionString);
            conn.Open();
            string str = "select ItemID from ItemMaintenance where ItemType='" +TypeOfItemDropDown.SelectedValue + "';";
            SqlCommand com = new SqlCommand(str, conn);            
            SqlDataReader dr = com.ExecuteReader();
            ItemIDClass.clearList();
            while (dr.Read())
            {                                
                ItemIDClass.ItemIds.Add(Convert.ToInt16(dr.GetValue(0)));
            }
            conn.Close();
        }
    }
}
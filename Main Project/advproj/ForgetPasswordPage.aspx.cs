using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace advproj
{
    public partial class ForgetPasswordPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitbutton_Click(object sender, EventArgs e)
        {
            bool validPassword = (string.Compare(Newpasswordtextbox.Text, Confirmpasswordtextbox.Text) == 0);
            if (validPassword)
            {
                Response.Redirect("~/login.aspx");
            }
            else
                InvalidPasswordMessage.Visible = true;
        }
    }
}
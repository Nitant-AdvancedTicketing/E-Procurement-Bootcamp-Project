using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace advproj
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void resetbutton_Click(object sender, EventArgs e)
        {
            usernametextbox.Text = "";
            passwordtextbox.Text = "";
            InvalidCredentialsMessage.Visible = false;
        }

        protected void submitbutton_Click(object sender, EventArgs e)
        {
            string[] users = { "Scott@gmail.com", "Jisun", "Sam" };
            string[] passwords = { "password", "password", "password" };
            for (int i = 0; i < users.Length; i++)
            {
                bool validUsername = (string.Compare(usernametextbox.Text, users[i]) == 0);
                bool validPassword = (string.Compare(passwordtextbox.Text, passwords[i]) == 0);
                if (validUsername && validPassword)
                {
                    Response.Redirect("~/Complete.aspx");
                }
                else
                    InvalidCredentialsMessage.Visible = true;
            }

        }
    }
}
using Common;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistarationForm1
{
    public partial class Change_Password : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegForm"].ConnectionString);
        string id = string.Empty;
        public void Page_Load(object sender, EventArgs e)
        {
            EncryptQuery objEncryptQuery = new EncryptQuery();
            if (!string.IsNullOrEmpty(Request.QueryString["RegID"]))
            {
                string EncryptedEmail = Request.QueryString["RegID"];
                id = objEncryptQuery.Decrypt(EncryptedEmail);
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (txtpwd.Text != txtCpwd.Text)
            {
                lblmsg.Text = "Passwords did not match!....";
            }

            else {
                DAL obj = new DAL();
                obj.ChangePassword(txtpwd.Text, id);
                ShowMessage("Updated Successfully!.....");
                clear();                
            }

        }

        private void ShowMessage(string msg )
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script> alert('" + msg + "');</script> ");
        }
        public void clear()
        {
            txtpwd.Text = string.Empty;
            txtCpwd.Text = string.Empty;

        }
    }
}
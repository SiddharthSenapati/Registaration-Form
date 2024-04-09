using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace RegistarationForm1
{
    public partial class Stored_Procedure : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data source= 10.0.0.21; initial Catalog= intern2022;User ID = intern2022; pwd=intern2022");
        SqlCommand cmd = new SqlCommand();
        SqlParameter sp1 = new SqlParameter();
        SqlParameter sp2 = new SqlParameter();
        SqlParameter sp3 = new SqlParameter();
        SqlParameter sp4 = new SqlParameter();
        protected void Page_Load(object sender, EventArgs e) {
            try
            {
                if (!Page.IsPostBack)
                {
                    this.BindGridView();
                }
            }
            catch(Exception ex)
            {
                ShowMessage(ex.Message);
            }
        }
        public void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script> alert('" + msg + "');</script> ");
        }
        public void BindGridView()
        {
            try
            {
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from Sidd_Login", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable ds = new DataTable();
                adp.Fill(ds);
                GridView.DataSource = ds;
                GridView.DataBind();
            }
            catch (SqlException ex)
            {
                ShowMessage(ex.Message);
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
        protected void submit_Click(object sender, EventArgs e)
        {

            con.Open();
            cmd = new SqlCommand("submitRecord", con);
            cmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = id.Text;
            string encryptedPassword = this.Encrypt(pwd.Text.Trim());

            // Adding parameter to SqlCommand
            cmd.Parameters.AddWithValue("@Password", encryptedPassword);
           // cmd.Parameters.AddWithValue("@RegID", e.CommandArgument);
            //cmd.Parameters.AddWithValue("@Password",this.Encrypt(pwd.Text.Trim()),SqlDbType.VarChar);
            cmd.Parameters.Add("@Confirm_Password", SqlDbType.VarChar).Value =cpwd.Text;
            cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = email.Text;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            BindGridView();
            ShowMessage("Registerd Successfully!.....");
            Clear();
        }
         private string Encrypt(string clearText)
         {
            string encryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(encryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
         }

        protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView.PageIndex = e.NewPageIndex;
            this.BindGridView();
        }

        private void Clear()
        {
            id.Text = string.Empty;
            pwd.Text = string.Empty;
            cpwd.Text = string.Empty;
            email.Text = string.Empty;
        }
    }
}
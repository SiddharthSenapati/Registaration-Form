using DynamicData;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using Common;

namespace RegistarationForm1
{
    public partial class Forgot_Password : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegForm"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
               con.Open();
               SqlCommand cmd = new SqlCommand("SELECT RegID FROM [SIDD_REG] WHERE Email= '" + txtemail.Text + "' AND ISDeleted=0 ", con);
               SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    EncryptQuery objEncryptQuery = new EncryptQuery();

                    BusinessAccess.BAL objBAL = new BusinessAccess.BAL();

                    string RegID = Convert.ToString(objBAL.GetRegIDByEmail(txtemail.Text));

                    string from = "Siddharth@concept.co.in";
                    using (MailMessage msg = new MailMessage(from, txtemail.Text))
                    {
                        msg.Subject = "Reset Password!....";

                        string emailBody = "";

                        emailBody += "<h1> Hello User, </h1>";
                        emailBody += "Click Below link to Reset Password";

                        emailBody += "<p><a href = " + "http://localhost:65441/Change_Password.aspx?RegID=" + objEncryptQuery.Encrypt(RegID) + ">Click Here to reset Password</a></p>";
                        emailBody += "<h1>Thank You! </h1>";

                        msg.Body = emailBody;

                        msg.IsBodyHtml = true;
                        SmtpClient smt = new SmtpClient();
                        smt.Host = "mail.concept.co.in";
                        smt.Port = 25;
                        smt.EnableSsl = false;
                        smt.UseDefaultCredentials = true;
                        //smt.Credentials = nc;
                        smt.Send(msg);
                        ShowMessage("Message sent successfully!.....");
                        clear();
                    }
                }
                else {
                    ShowMessage("Email doesnot exist!....");
                }
            }
            catch(SqlException ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }
        public void clear()
        {
            txtemail.Text = string.Empty;
           

        }
        public void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('"+  msg + "');", true);
        }
    }
}
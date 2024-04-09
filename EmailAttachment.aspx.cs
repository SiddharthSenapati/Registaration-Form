using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Data.SqlClient;
using System.Data;

namespace RegistarationForm1
{
    public partial class EmailAttachment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source= 10.0.0.21; Initial Catalog= intern2022; User ID= intern2022; pwd= intern2022");
            SqlParameter sp1 = new SqlParameter();
            try
            {
                con.Open();
                string RegistrationID = string.Empty;
                if (!string.IsNullOrEmpty(Request.QueryString["RegID"]))
                {
                    RegistrationID = Request.QueryString["RegID"];
                }
                SqlCommand cmd = new SqlCommand("Siddharth_SP_GetRegistrionFromDataByID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RegID", SqlDbType.Int).Value = RegistrationID;
                DataTable dtRegistrionFromData = new DataTable();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dtRegistrionFromData);
                if (dtRegistrionFromData != null && dtRegistrionFromData.Rows.Count > 0)
                {
                    foreach (DataColumn col in dtRegistrionFromData.Columns)
                    {
                        if (col.ColumnName == "Email")
                        {
                            Textto.Text = Convert.ToString(dtRegistrionFromData.Rows[0][0]);

                        }
                    }
                }
            }

            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }



        }

        protected void send_Click(object sender, EventArgs e)
        {
            string from = "Siddharth@concept.co.in";
            using (MailMessage msg = new MailMessage(from, Textto.Text))
            {
                msg.Subject = sub.Text;
                msg.Body = textbody.Text;
                if (file.HasFile)
                {
                    string filename = file.PostedFile.FileName;
                    msg.Attachments.Add(new Attachment(file.PostedFile.InputStream, filename));
                }
                msg.IsBodyHtml = false;
                SmtpClient smt = new SmtpClient();
                smt.Host = "mail.concept.co.in";
                smt.Port = 25;
                smt.EnableSsl = false;
                smt.UseDefaultCredentials = true;
                //smt.Credentials = nc;
                smt.Send(msg);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Message sent successfullly');", true);
            }
        }
    }
}

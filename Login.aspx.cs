using Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistarationForm1
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegForm"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {


                //Session.Timeout = 1;
                if (!Page.IsPostBack)
                {
                    HttpCookie mycookie = new HttpCookie("mycookie ");
                    // mycookie["First_name"] = "Siddharth";

                    if (mycookie["Email"] != null)
                    {
                        string FirstName = Request.Cookies["Email"].Value;
                    }
                    if (mycookie["Password"] != null)
                    {
                        string Surname = Request.Cookies["Password"].Value;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select First_name, Address_, Email, Phone,Password,Pincode, Certificate_, Image from SIDD_REG where Email = @Email and Password = @Password ", con);

            EncryptQuery obj = new EncryptQuery();
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            string encryptedPassword = obj.Encrypt(txtpwd.Text);

            cmd.Parameters.AddWithValue("@Password", encryptedPassword);
           
            //DataTable dt = new DataTable();
            //SqlDataAdapter adp = new SqlDataAdapter(cmd);
            //adp.Fill(dt);
           // string decryptedPassword = this.Decrypt(dt.Rows[0][4].ToString());
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                Session["First_name"] = sdr.GetValue(0).ToString();
                Session["Address_"] = sdr.GetValue(1).ToString();
                Session["Email"] = sdr.GetValue(2).ToString();
                Session["Phone"] = sdr.GetValue(3).ToString();
                Session["Password"] = sdr.GetValue(4).ToString();
                Session["Pincode"] = sdr.GetValue(5).ToString();
                Session["Certificate_"] = sdr.GetValue(6).ToString();
                Session["Image"] = sdr.GetValue(7).ToString();
                Response.Redirect("Home.aspx");
            }
            else
            {
                errorMsg.Text = "Invalid Email or Password";
                con.Close();
            }

        }
        
    }
}
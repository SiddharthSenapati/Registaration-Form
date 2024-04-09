using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistarationForm1
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          lblFname.Text = (string)Session["First_name"] + "!";
                lblAddress.Text = (string)Session["Address_"];
                lblemail.Text = (string)Session["Email"];
                lblPhone.Text = (string)Session["Phone"];
                lblpin.Text = (string)Session["Pincode"];
                hlFile.NavigateUrl = (string)Session["Certificate_"];
                Image1.ImageUrl = (string)Session["Image"];
            // lblfile.Text = (string)Session["Certificate_"];
            //lblimage.Text = 

        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
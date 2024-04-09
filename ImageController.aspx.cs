using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistarationForm1
{
    public partial class ImageController : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    // Get the file extension
                    string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();

                    // Check if the file is an image (you can add more image extensions if needed)
                    if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".gif")
                    {
                        // Save the file to a server directory
                        string filePath = Server.MapPath("~/Images/") + FileUpload1.FileName;
                        FileUpload1.SaveAs(filePath);

                        // Display the uploaded image
                        imgUploaded.ImageUrl = "~/Images/" + FileUpload1.FileName;
                    }
                    else
                    {
                        // Display an error if the uploaded file is not an image
                        Response.Write("Please select a valid image file.");
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions, if any
                    Response.Write("Error: " + ex.Message);
                }
            }
        }
    }
}





   
       
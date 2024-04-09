using System;
using System.Data.SqlClient;
using System.Data;


namespace RegistarationForm1
{
    public partial class dataset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           using (SqlConnection con = new SqlConnection("data source=.; database=student; integrated security=SSPI"))
                {
                    SqlDataAdapter sde = new SqlDataAdapter("Select * from Sidd_Student", con);
                    DataSet ds = new DataSet();
                    sde.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
            }
        }
    }

   

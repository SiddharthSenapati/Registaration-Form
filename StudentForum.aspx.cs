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
    public partial class StudentForum : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            StudentClass obj = new StudentClass();
            try
            {
                if (!Page.IsPostBack)
                {
                    this.BindGridView();
                }
            }
            catch (SqlException ex)
            {
                ShowMessage(ex.Message);
            }

        }
        private void BindGridView()
        {
            StudentClass studentClass = new StudentClass();
            DataSet ds = studentClass.BindGridView();
            GVR.DataSource = ds;
            GVR.DataBind();
        }

        public void ShowMessage(string message)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script> alert('" + message + "'); </script>");
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            StudentClass studentClass = new StudentClass();
            studentClass.submit(did.Text, dname.Text, dloc.Text);
            BindGridView();  
            ShowMessage("Registerd Successfully!.....");
            clear();
        }

        public void clear()
        {
            did.Text = string.Empty;
            dname.Text = string.Empty;
            dloc.Text = string.Empty;
        }

        protected void btn_Click1(object sender, EventArgs e)
        {
            StudentClass obj = new StudentClass();
            obj.update(did.Text, dname.Text, dloc.Text);
            BindGridView();
            ShowMessage("Updated Successfully!.....");
            clear();
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            StudentClass obj = new StudentClass();
            obj.delete(did.Text, dname.Text, dloc.Text);
            BindGridView();
            ShowMessage("Deleted Successfully!....");            
            GVR.EditIndex = -1;
            clear();

        }

        protected void select_click(object sender, EventArgs e)
        {
        int EmployeeId = Convert.ToInt32(GVR.DataKeys[Convert.ToInt32(did.Text)].Value);
            //StudentClass obj = new StudentClass();
            //obj.select();
            foreach (GridViewRow gvRow in GVR.Rows)
            {
                var dataKey = GVR.DataKeys[gvRow.DataItemIndex];
                if (dataKey == null && dataKey.Value == did.Text) continue;
                EmployeeId = gvRow.DataItemIndex;
                break;
                clear();
            }


            did.Text = GVR.Rows[EmployeeId].Cells[0].Text;
            dname.Text = GVR.Rows[EmployeeId].Cells[1].Text;
            dloc.Text = GVR.Rows[EmployeeId].Cells[2].Text;
           
          
        }

        protected void GVR_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVR.PageIndex = e.NewPageIndex;
            this.BindGridView();
        }
    }
}
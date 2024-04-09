using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace RegistarationForm1
{
    public partial class Teacher1 : System.Web.UI.Page
    {
            SqlConnection conn = new SqlConnection("Data source= 10.0.0.21; Initial catalog= intern2022; User ID= intern2022; pwd = intern2022 ");
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    BindGridView();
                }
            }
            catch(SqlException ex)
            {
                ShowMessage(ex.Message);
            }
        }
        public void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script> alert('" + msg + "');</script> ");
        }
        private void BindGridView()
        {
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cnd = new SqlCommand("Select SID, Name, Class, Address from students;", conn);
                SqlDataAdapter adp = new SqlDataAdapter(cnd);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                GVT.DataSource = ds;
                GVT.DataBind();
                cnt.Text = GVT.Rows.Count.ToString();
            }
            catch (SqlException ex)
            {
                ShowMessage(ex.Message);
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            try
            {
                submit();
            }
            catch(SqlException ex)
            {
                ShowMessage(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        public void submit()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("insert into students (SID,Name,Class,Address) values(@SID, @Name, @Class, @Address)", conn);
            if (id.Text == string.Empty && name.Text == string.Empty && Class.Text == string.Empty && add.Text == string.Empty) {
                ShowMessage("cannot be left blank");
            }
            else
            {
                cmd.Parameters.AddWithValue("@SID", id.Text);
                cmd.Parameters.AddWithValue("@Name", name.Text);
                cmd.Parameters.AddWithValue("@Class", Class.Text);
                cmd.Parameters.AddWithValue("@Address", add.Text);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                ShowMessage("Submitted Successfully!.......");
                clear();
                BindGridView();
            }
        }
        void clear()
        {
            id.Text = string.Empty; name.Text = string.Empty; Class.Text = string.Empty; add.Text = string.Empty;
        }
        protected void onSubmit_click(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            try
            {
                update();
            }
            catch(SqlException ex)
            {
                ShowMessage(ex.Message);
            }
        }
        protected void update()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("update students set Name = @Name, Class = @class, Address = @Address where SID = @SID",conn);
            if (id.Text == string.Empty && name.Text == string.Empty && Class.Text == string.Empty && add.Text == string.Empty)
            {
                ShowMessage("cannot be left blank");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Name", name.Text);
                cmd.Parameters.AddWithValue("@Class", Class.Text);
                cmd.Parameters.AddWithValue("@Address", add.Text);
                cmd.Parameters.AddWithValue("@SID", id.Text);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                ShowMessage("Updated Sucessfully!.......");
                BindGridView();
                Updtw.Visible = true;
            }
        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                ////int SID = Convert.ToInt32(GVT.DataKeys[e.RowIndex].Value);
                SqlCommand cd = new SqlCommand("Delete from students where SID = '" + id.Text + "'",conn);
                cd.ExecuteNonQuery();
                cd.Dispose();
                ShowMessage("Deleted Successfully!....");
                GVT.EditIndex = -1;
                BindGridView();
            }
            catch(SqlException ex)
            {
                ShowMessage(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }   
           
    }
}


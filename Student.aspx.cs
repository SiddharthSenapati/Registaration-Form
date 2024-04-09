using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using MySql.Data.MySqlClient;


namespace RegistarationForm1
{
    public partial class Student : System.Web.UI.Page
    {
        #region MySqlConnection Connection and Page Lode  
        SqlConnection conn = new SqlConnection("Data Source=10.0.0.21; Initial Catalog= intern2022; User ID=intern2022; pwd=intern2022");
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    BindGridView();

                }
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message);
            }
        }
        #endregion
        #region show message  
        /// <summary>  
        /// This function is used for show message.  
        /// </summary>  
        /// <param name="msg"></param>  
        void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script> alert('" + msg + "');</script> ");  
        }
        /// <summary>  
        /// This Function is used TextBox Empty.  
        /// </summary>  
        void clear()
        {
            txtname.Text = string.Empty; txtsalary.Text = string.Empty; txtcity.Text = string.Empty;
            txtid.Text = string.Empty;
            txtname.Focus();
        }
        #endregion
        #region bind data to GridViewStudent  
        private void BindGridView()
        {
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from Sidd_Student;",conn);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                GridViewStudent.DataSource = ds;
                GridViewStudent.DataBind();
                lbltotalcount.Text = GridViewStudent.Rows.Count.ToString();
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
        #endregion
        #region Insert Data  
        /// <summary>  
        /// this code used to Student Data insert in MYSQL Database  
        /// </summary>  
        /// <param name="sender"></param>  
        /// <param name="e"></param>  
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            try
            {
                  submit();
            }
            catch (SqlException ex)
            {
                ShowMessage(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        #endregion

        #region SelectedIndexChanged  
        /// <summary>  
        /// this code used to GridViewRow SelectedIndexChanged value show textbox  
        /// </summary>  
        /// <param name="sender"></param>  
        /// <param name="e"></param>  
        protected void GridViewStudent_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewStudent.SelectedRow;
            //lblSID.Text = row.Cells[2].Text;
            txtid.Text = row.Cells[2].Text;
            txtname.Text = row.Cells[3].Text;
            txtsalary.Text = row.Cells[4].Text;
            txtcity.Text = row.Cells[5].Text;
            btnSubmit.Visible = true;
            //btnUpdate.Visible = true;
        }
        #endregion
        #region Delete Student Data  
        /// <summary>  
        /// This code used to GridViewStudent_RowDeleting Student Data Delete  
        /// </summary>  
        /// <param name="sender"></param>  
        /// <param name="e"></param>  
        protected void GridViewStudent_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int EmployeeId = Convert.ToInt32(GridViewStudent.DataKeys[e.RowIndex].Value);
            try
            {   
                delete(EmployeeId);
            }
            catch (SqlException ex)
            {
                ShowMessage(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        #endregion
        #region student data update  
        /// <summary>  
        /// This code used to student data update  
        /// </summary>  
        /// <param name="sender"></param>  
        /// <param name="e"></param>  
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                update();
                
            }
            catch (SqlException ex)
            {
                ShowMessage(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        #endregion
        #region textbox clear  
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clear();
        }
        #endregion

        protected void GridViewStudent_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void btnUpdate_Click1(object sender, EventArgs e)
        {

        }
        public void update()
        {
            conn.Open();
            string EmployeeId = lblSID.Text;
            SqlCommand cmd = new SqlCommand("update Sidd_Student Set EmployeeName = @EmployeeName, EmployeeSalary = @EmployeeSalary, EmployeeCity = @EmployeeCity Where EmployeeId = @EmployeeId", conn);
            if (txtname.Text == string.Empty && txtsalary.Text == string.Empty && txtcity.Text == string.Empty)
            {
                ShowMessage("Cannot left blank!....");
            }
            else
            {
                cmd.Parameters.AddWithValue("@EmployeeId", txtid.Text);
                cmd.Parameters.AddWithValue("@EmployeeName", txtname.Text);
                cmd.Parameters.AddWithValue("@EmployeeSalary", txtsalary.Text);
                cmd.Parameters.AddWithValue("@EmployeeCity", txtcity.Text);
                //cmd.Parameters.AddWithValue("SID", SID);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                ShowMessage("Student Data update Successfully......!");
                GridViewStudent.EditIndex = -1;
                BindGridView(); btnUpdate.Visible = true;
            }

        }
        public void delete(int EmployeeId)
        {
            conn.Open();
           
            SqlCommand cmd = new SqlCommand("Delete From Sidd_Student where EmployeeId =" + EmployeeId, conn);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            ShowMessage("Student Data Delete Successfully......!");
            GridViewStudent.EditIndex = -1;
            BindGridView();
        }
        public void submit()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Insert into Sidd_Student(EmployeeId,EmployeeName,EmployeeSalary,EmployeeCity ) values(@EmployeeId,@EmployeeName,@EmployeeSalary,@EmployeeCity)", conn);
            //cmd.Parameters.AddWithValue("@EmployeeId", txtid.Text);
            if (txtname.Text == string.Empty && txtsalary.Text == string.Empty && txtcity.Text == string.Empty)
            {

                ShowMessage("Cannot left null......!");
            }
            else
            {
                cmd.Parameters.AddWithValue("@EmployeeId", txtid.Text);
                cmd.Parameters.AddWithValue("@EmployeeName", txtname.Text);
                cmd.Parameters.AddWithValue("@EmployeeSalary", txtsalary.Text);
                cmd.Parameters.AddWithValue("@EmployeeCity", txtcity.Text);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                ShowMessage("Registered successfully......!");
                clear();
                BindGridView();
            }
        }
    }
}
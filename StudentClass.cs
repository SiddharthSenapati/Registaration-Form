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
    public class StudentClass
    {
        SqlConnection con = new SqlConnection("Data Source= 10.0.0.21; Initial Catalog= intern2022; User ID = intern2022; pwd = intern2022 ");

        public DataSet BindGridView()
        {
            DataSet ds = new DataSet();
            try
            {   
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Select DeptID,DeptName,DeptLocation from Dept_Sidd;", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);                
            }
            catch (SqlException)
            {
                //ShowMessage(ex.Message);
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
            return ds;
        }
        public void submit(string DeptID, string DeptName, string DeptLocation)
        {
            con.Open();
            SqlCommand sb = new SqlCommand("Insert into Dept_Sidd(DeptID,DeptName,DeptLocation) values(@DeptID,@DeptName,@DeptLocation)", con);
            sb.Parameters.AddWithValue("@DeptID", DeptID);
            sb.Parameters.AddWithValue("@DeptName", DeptName);
            sb.Parameters.AddWithValue("@DeptLocation", DeptLocation);
            sb.ExecuteNonQuery();
            sb.Dispose();
        }
        public void update(string DeptID, string DeptName, string DeptLocation)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Dept_Sidd set DeptName = @DeptName, DeptLocation = @DeptLocation where DeptID = @DeptID ", con);
            cmd.Parameters.AddWithValue("@DeptID", DeptID);
            cmd.Parameters.AddWithValue("@DeptName", DeptName);
            cmd.Parameters.AddWithValue("@DeptLocation", DeptLocation);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
        }
        public void delete(string DeptID, string DeptName, string DeptLocation)
        {
            con.Open();
            SqlCommand cd = new SqlCommand("Delete from Dept_Sidd where DeptID ='"+ DeptID +"'", con);
           // DeptID = Convert.ToInt32(GVR.DataKeys[e.RowIndex].Value);
            cd.ExecuteNonQuery();
            cd.Dispose();
        }
        //public void select()
        //{
        //    //con.Open();
        //    //SqlCommand cd = new SqlCommand("select DeptName,DeptLocation from Dept_Sidd where DeptID ='" + DeptID + "'", con);
        //    //cd.ExecuteNonQuery();
        //    //cd.Dispose();
        //}
    }
}
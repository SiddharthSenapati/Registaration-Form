using BusinessObject;
using DataAccess;
using DynamicData.Binding;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessAccess;
using System.Security.Cryptography;
using System.Text;
using NLog.Fluent;
using Common;

namespace RegistarationForm1
{
    public partial class userReg1 : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["RegForm"].ConnectionString;

        private readonly string certificatesFolderPath = "~/Files/Certificates/";

        private readonly string photosFolderPath = "~/Files/Photos/";

        //private int pagesize = 4;
       // private SqlDataAdapter adp = new SqlDataAdapter();
        //DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!Page.IsPostBack)
                {
                    BindRepeater();
                    country();
                    //Bind_ddlState();
                    update.Visible = false;
                    // PageNumber = 0;
                    HttpCookie mycookie = new HttpCookie("mycookie ");
                    // mycookie["First_name"] = "Siddharth";

                    if (mycookie["First_name"] != null)
                    {
                        string FirstName = Request.Cookies["First_name"].Value;
                    }
                    if (mycookie["Last_name"] != null)
                    {
                        string Surname = Request.Cookies["Last_name"].Value;
                    }
                    if (mycookie["DOB"] != null)
                    {
                        string DateOfBirth = Request.Cookies["DOB"].Value;
                    }
                    if (mycookie["Pincode"] != null)
                    {
                        string PinCode = Request.Cookies["Pincode"].Value;
                    }
                    mycookie.Expires = DateTime.Now.Add(new TimeSpan(1, 0, 0));
                }
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message);
            }
        }
        //This will show message as alert
        public void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script> alert('" + msg + "');</script> ");
        }

        //This will submit data in a table
        protected void Submit_Click(object sender, EventArgs e)
        {
            BusinessEntity obj2 = new BusinessEntity();
           
            if(txtpwd.Text != txtcpwd.Text)
            {
                match.Text = "Password did not match";
            }

           // DAL obj = new DAL();
            if (file.HasFile && image.HasFile)
            {
                string certificateFilePath = SaveFile(file, certificatesFolderPath);
                string photoFilePath = SaveFile(image, photosFolderPath);
                //obj.Submit(First1.Text, last.Text, dob.Text, ddlstate.SelectedItem.Text, cntry.SelectedItem.Text, email.Text, phone.Text, pin.Text, rblGender.SelectedItem.Text, certificateFilePath, photoFilePath);
                obj2.First_name = First1.Text;
                obj2.Last_name = last.Text;
                obj2.DOB = dob.Text;
                obj2.Address_ = Convert.ToString(ddlstate.SelectedItem);
                obj2.Country = Convert.ToString(cntry.SelectedItem);
                obj2.Password = txtpwd.Text;
                obj2.Email = email.Text;
                obj2.Phone = phone.Text;
                obj2.Pincode = pin.Text;
                obj2.Gender = rblGender.SelectedItem.Text;
                obj2.certificateFilePath = certificateFilePath;
                obj2.photoFilePath = photoFilePath;
               

                BAL obj = new BAL();
                obj.SubmitEntity(obj2);
                ShowMessage("Registered Successfully......");
                //update.Visible = false;
                LogClass.WriteLog("A new entry is submitted.");
                BindRepeater();
                clear();

            }
        }

        protected string SaveFile(FileUpload fileUpload, string folderPath)
        {
            string fileName = Guid.NewGuid().ToString() + Path.GetExtension(fileUpload.FileName);
            string filePath = Server.MapPath($"{folderPath}{fileName}");
            fileUpload.SaveAs(filePath);
            return $"{folderPath}{fileName}";
        }
        public void BindRepeater()
        {
            DAL obj = new DAL();
            DataTable dt = obj.BindRepeater();
            view.DataSource = dt;
            view.DataBind();
            LogClass.WriteLog("Table is being shown.");
            lbltotalcount.Text = ("Total Student: " + dt.Rows.Count.ToString());

            //Label imgUserPhoto = fileName.FindControl("imgUserPhoto");
            EncryptQuery ecq = new EncryptQuery();
            //HyperLink lblemail = (HyperLink)view.FindControl("lblemail");
            //HyperLink RegID = (HyperLink)view.FindControl("RegID");
            //string hdnreg = ecq.Encrypt(RegID.Text).ToString();
            //lblemail.NavigateUrl = "EmailAttachment.aspx? RegID = " + hdnreg;
            //Response.Redirect("/Product?p=" + Encrypt(code));

        }

        protected void update_Click(object sender, EventArgs e)
        {
            DAL obj = new DAL();
            obj.Update(First1.Text, last.Text, dob.Text, ddlstate.Text, cntry.Text, txtpwd.Text, email.Text, phone.Text, pin.Text, rblGender.Text, certificatesFolderPath, photosFolderPath);
            update.Visible = true;
            ShowMessage("Updated Succcesslly!......");
            BindRepeater();
            clear();

        }

        public void clear()
        {
            First1.Text = string.Empty;
            last.Text = string.Empty;
            dob.Text = string.Empty;
            //ddlstate.Text = string.Empty;
            //cntry.Text = string.Empty;
            email.Text = string.Empty;
            phone.Text = string.Empty;
            pin.Text = string.Empty;
            rblGender.SelectedValue = string.Empty;
            txtpwd.Text = string.Empty;
            txtcpwd.Text = string.Empty;
        }



        public void HyperlinkFile_Click(object sender, EventArgs e)
        {
            HyperLink hyperlink = (HyperLink)sender;
            string Certificate_ = hyperlink.NavigateUrl;

            Response.Redirect(url: Certificate_);
        }
        protected void view_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            DAL obj = new DAL();
            //SqlConnection con = new SqlConnection("Data Source = 10.0.0.21; Initial Catalog = intern2022; User ID = intern2022; Password = intern2022");
            //SqlDataAdapter adp = new SqlDataAdapter();
            if (e.CommandName == "Edit")
            {
                update.Visible = true;
                btnSave.Visible = false;

                BAL obj5 = new BAL();
               DataTable dt = obj5.Edit(Convert.ToString(e.CommandArgument));
               

                First1.Text= dt.Rows[0]["First_name"].ToString();
                last.Text= dt.Rows[0]["Last_name"].ToString();
                dob.Text = dt.Rows[0]["DOB"].ToString();
                txtpwd.Text = dt.Rows[0]["Password"].ToString();
                email.Text = dt.Rows[0]["Email"].ToString();
                phone.Text = dt.Rows[0]["Phone"].ToString();
                pin.Text = dt.Rows[0]["Pincode"].ToString();
                rblGender.Text = dt.Rows[0]["Gender"].ToString();
                
                //id.Text = dt.Rows[0]["RegID"].ToString();
                // SqlDataAdapter adp = new SqlDataAdapter();
                //adp.Fill(dt);

                //obj.Edit(e.CommandName, First1.Text, last.Text, dob.Text, ddlstate.SelectedValue, cntry.SelectedValue, email.Text, phone.Text, pin.Text, rblGender.Text, hdnId.Value);
                //dt.Clear();

                // First1.Text = dt.Rows[0]["First_name"].ToString();
                // last.Text = dt.Rows[0]["Last_name"].ToString();
                // dob.Text = dt.Rows[0]["DOB"].ToString();
                // ddlstate.SelectedValue = dt.Rows[0]["Address_"].ToString();
                //// cntry.SelectedValue = dt.Rows[0]["Country"].ToString();
                // email.Text = dt.Rows[0]["Email"].ToString();
                // phone.Text = dt.Rows[0]["Phone"].ToString();
                // pin.Text = dt.Rows[0]["Pincode"].ToString();
                // rblGender.Text = dt.Rows[0]["Gender"].ToString();

                //hdnId.Value = dt.Rows[0]["RegID"].ToString();
                //btnSave.Text = "Update";

                LinkButton btn = e.Item.FindControl("lnkEdit") as LinkButton;
                //btn.CssClass = "badge badge-warning";
                string fileName = Guid.NewGuid().ToString() + Path.GetExtension(image.FileName);
                LogClass.WriteLog("An update is Committed.");


            }
            else if (e.CommandName == "Delete")
            {
                BAL objB = new BAL();
               DataTable dt =  objB.Delete(Convert.ToString(e.CommandArgument));
                ShowMessage("Deleted Successfully!.....");
                //SqlCommand cmd = new SqlCommand("DELETE", con);
                //cmd.Parameters.AddWithValue("@RegID", e.CommandArgument);
                //cmd.CommandType = CommandType.StoredProcedure;

                //adp.SelectCommand = cmd; // Assign the SqlCommand to the SqlDataAdapter
                clear();
                LogClass.WriteLog("A record is deleted.");
                BindRepeater();
            }
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("EmailAttachment.aspx");
        //}total

        protected void DataSource_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            //e.Arguments.SortExpression = sortExpression;
        }

        protected void view_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //imgUserPhoto.FindControl(""ImageUrl = "~/Files/Photos/" + fileName;
            //Label imgUserPhoto = fileName.FindControl("imgUserPhoto");
            //imgUserPhoto.ImageUrl = "~/Files/Photos/" + fileName;

            // if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            
                Image imgUserPhoto = (Image)e.Item.FindControl("imgUserPhoto");
                HiddenField imgURL = (HiddenField)e.Item.FindControl("imgURL");
                HyperLink lblemail = (HyperLink)e.Item.FindControl("lblemail");

                //if (lblemail != null)
                //{
                //    //Response.Redirect();
                //    lblemail.NavigateUrl = ("EmailAttachment.aspx?RegID= '" + id.Text);
                //}

                //if (imgUserPhoto != null)
                //{
                //    //imgUserPhoto.ImageUrl = Path.Combine(Request.Url.Authority, imgURL.Value.ToString().Substring(1));
                //}
            
        }
        public void country()
        {
            DAL obj1 = new DAL();
            DataTable dc = obj1.Bind_cntry(cntry.SelectedValue);
            cntry.DataSource = dc;
            //cntry.DataSource = dr;
            cntry.Items.Clear();
            cntry.Items.Add("--Select country--");
            cntry.DataTextField = "Country";
            cntry.DataValueField = "CountryID";
            cntry.DataBind();
           
        }
        public void state()
        {
            DAL objh = new DAL();
            DataTable ds = objh.Bind_ddlState(cntry.SelectedValue);
            ddlstate.DataSource = ds;
            ddlstate.Items.Clear();
            ddlstate.Items.Add("--Select state--");
            ddlstate.DataTextField = "StateName";
            ddlstate.DataValueField = "StateID";
            ddlstate.DataBind();
        }
        protected void cntry_SelectedIndexChanged(object sender, EventArgs e)
        {
            state();
        }

        //protected void btnshow_Click(object sender, EventArgs e)
        //{

        //}
    }
}
   




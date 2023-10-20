using LMS48.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS48
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        int id;
        string fname = string.Empty;
        string lname = string.Empty;
        string date;
        LoadFromDatabase database = new LoadFromDatabase();
        Show_HideCalendar calendar = new Show_HideCalendar();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                database.BindLeaveTypeDropdown(LeaveTypeDrowpdown);
        }

        protected void CheckID_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(database.connection))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("Select id, Fname, Lname from Employee where EmployeeID = @EmployeeID",con))
                {
                    cmd.Parameters.AddWithValue("@EmployeeID", EmpIdTextbx.Text);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    if (rdr.HasRows)
                    {
                        rdr.Read();
                        id = rdr.GetInt32(0);
                        EmpDatabaseId.Text = id.ToString();
                        fname = rdr.GetString(1);
                        lname = rdr.GetString(2);

                        EmpNameTxtBx.Text = fname + " " + lname;
                    }
                    else
                        EmpNameTxtBx.Text = "Employee Not Found";
                }
            }
        }

        protected void SimageButton_Click(object sender, ImageClickEventArgs e)
        {
            calendar.display(Spanel);
        }

        protected void EimageButton_Click(object sender, ImageClickEventArgs e)
        {
            calendar.display(Epanel);
        }

        protected void SdateCalendar_SelectionChanged(object sender, EventArgs e)
        {
            date = SdateCalendar.SelectedDate.ToShortDateString();
            SdateTxtBx.Text = date;
            SdateCalendar.Visible = false;

            if (EdateTxtBx.Text != "")
            {
                TimeSpan timedifference = EdateCalendar.SelectedDate.Date - SdateCalendar.SelectedDate.Date;
                numdayslbl.Visible = true;
                numdayslbl.Text = timedifference.Days.ToString();
            }
        }

        protected void EdateCalendar_SelectionChanged(object sender, EventArgs e)
        {            
            date = EdateCalendar.SelectedDate.ToShortDateString();
            EdateTxtBx.Text = date;
            EdateCalendar.Visible = false;

            if (SdateTxtBx.Text != "")
            {
                TimeSpan timedifference = EdateCalendar.SelectedDate.Date - SdateCalendar.SelectedDate.Date;
                numdayslbl.Visible = true;
                numdayslbl.Text = timedifference.Days.ToString();
            }

        }

        protected void Submitbtn_Click(object sender, EventArgs e)
        {            
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal(\"Success\", \"Your Leave Request Have Been Submitted!\", \"success\");\r\n", true);
            Response.Redirect("/Pages/SubmitLeave.aspx");
        }

        protected void Clearbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pages/SubmitLeave.aspx");
        }
    }
}
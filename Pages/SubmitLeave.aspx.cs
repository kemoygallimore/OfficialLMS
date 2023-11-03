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
            {
                if (Session["EmployeeData"] != null)
                {
                    EmployeeData emp = (EmployeeData)Session["EmployeeData"];
                    ((Label)Master.FindControl("EmpIdlbl")).Text = emp.EmployeeID;
                }
                
                database.BindLeaveTypeDropdown(LeaveTypeDrowpdown);

            }

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
            Spanel.Visible = false;

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
            Epanel.Visible = false;

            if (SdateTxtBx.Text != "")
            {
                TimeSpan timedifference = EdateCalendar.SelectedDate.Date - SdateCalendar.SelectedDate.Date;
                numdayslbl.Visible = true;
                numdayslbl.Text = timedifference.Days.ToString();
            }

        }

        protected void Submitbtn_Click(object sender, EventArgs e)
        {
            string Employee = EmpIdTextbx.Text;
            if(!(EmpNameTxtBx.Text == "" || EmpNameTxtBx.Text=="Employee Not Found"))
            {
                using (SqlConnection con = new SqlConnection(database.connection))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("Select id, Fname, Lname from Employee Where EmployeeID = @Employee", con))
                    {
                        cmd.Parameters.AddWithValue("@Employee", Employee);

                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            reader.Read();
                            id = reader.GetInt32(0);
                        }
                    }
                    con.Close();
                }

                /*using (SqlConnection con = new SqlConnection(database.connection))
                {
                    con.Open();
                    using (SqlCommand insert = new SqlCommand("InsertLeaveRequest", con))
                    {

                        insert.CommandType = CommandType.StoredProcedure;
                        insert.Parameters.AddWithValue("@EmpId", id);
                        insert.Parameters.AddWithValue("@LeaveTypeId", LeaveTypeDrowpdown.SelectedValue);
                        insert.Parameters.AddWithValue("@SubmissionDate", DateTime.Now.Date);
                        insert.Parameters.AddWithValue("@StartDate", Convert.ToDateTime(SdateTxtBx.Text));
                        insert.Parameters.AddWithValue("@EndDate", Convert.ToDateTime(EdateTxtBx.Text));
                        insert.Parameters.AddWithValue("@TotalDays", Convert.ToInt32(numdayslbl.Text));
                        insert.Parameters.AddWithValue("@Comments", CommentstxtBx.Text);

                        insert.ExecuteNonQuery();
                    }
                    con.Close();
                }*/
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal({ title: \"Success\", text: \"Your Leave Request Have Been Submitted!\", icon: \"success\" }).then(function() { window.location.href = \"/Pages/SubmitLeave.aspx\"; });", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal({ title: \"Failed\", text: \"All Fields With The * Are Required!\", icon: \"error\" });", true);
            }


        }

        protected void Clearbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}
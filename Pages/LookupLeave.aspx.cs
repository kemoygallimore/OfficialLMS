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
    
    public partial class LookupLeave : System.Web.UI.Page
    {
        LoadFromDatabase database = new LoadFromDatabase();
        Show_HideCalendar calendar = new Show_HideCalendar();
        string LoginID = string.Empty;
        string type = string.Empty;
        string status = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            //LoginID = ((Label)Master.FindControl("EmpIdlbl")).Text;
            if (!IsPostBack)
            {
                if (Session["EmployeeData"] != null)
                {
                    EmployeeData emp = (EmployeeData)Session["EmployeeData"];
                    ((Label)Master.FindControl("EmpIdlbl")).Text = emp.EmployeeID;
                    LoginID = emp.EmployeeID;
                }
                database.BindLeavestatusDrowpdown(LeaveStatusDropdown);
                database.BindLeaveTypeDropdown(LeaveTypeDropdown);
            }
            //database.LoadAllRequests(leaveRequestGV);
            database.LoadEmployeeRequests(leaveRequestGV, LoginID);
        }

        protected void sbutton_Click(object sender, ImageClickEventArgs e)
        {
            calendar.display(SPanel);
        }

        protected void sdatecal_SelectionChanged(object sender, EventArgs e)
        {
            Sdatetxtbx.Text = sdatecal.SelectedDate.ToShortDateString();
            SPanel.Visible = false;
        }

        protected void ebutton_Click(object sender, ImageClickEventArgs e)
        {
            calendar.display(EPanel);
        }

        protected void edatecal_SelectionChanged(object sender, EventArgs e)
        {
            Edatetxtbx.Text = edatecal.SelectedDate.ToShortDateString();
            EPanel.Visible = false;
        }

        protected void Clearbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void Submitbtn_Click(object sender, EventArgs e)
        {
            type =LeaveTypeDropdown.SelectedItem.ToString();
            status = LeaveStatusDropdown.SelectedItem.ToString();

            if (type == "Select a Leave Type" && status == "Select Status" && Sdatetxtbx.Text == "" && Edatetxtbx.Text == "")
            {
                database.LoadEmployeeRequests(leaveRequestGV, LoginID);
            }
            else
            {
                if (type == "Select a Leave Type")
                    type = string.Empty;
                if (status == "Select Status")
                    status = string.Empty;

                SqlConnection conn = new SqlConnection(database.connection);
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("FilterbyAllFields", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@EmpID", LoginID);
                    cmd.Parameters.AddWithValue("@type", type);
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@StartDate", Sdatetxtbx.Text);
                    cmd.Parameters.AddWithValue("@EndDate", Edatetxtbx.Text);
                    SqlDataReader reader = cmd.ExecuteReader();
                    leaveRequestGV.DataSource = reader;
                    leaveRequestGV.DataBind();
                }
            }
            
        }

        protected void LeaveStatusDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Edatetxtbx_TextChanged(object sender, EventArgs e)
        {

        }

        protected void LeaveTypeDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Sdatetxtbx_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
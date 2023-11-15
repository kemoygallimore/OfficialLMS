using LMS48.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS48
{
    
    public partial class CancelLeave : System.Web.UI.Page
    {
        int id;
        DateTime sdate =DateTime.Now;
        DateTime edate = DateTime.Now;

        LoadFromDatabase database = new LoadFromDatabase();
        Show_HideCalendar calendar = new Show_HideCalendar();
        string date;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["EmployeeData"] != null)
                {
                    EmployeeData emp = (EmployeeData)Session["EmployeeData"];
                    ((Label)Master.FindControl("EmpIdlbl")).Text = emp.EmployeeID;
                    ((Label)Master.FindControl("Namelbl")).Text = emp.Name;
                    ((Label)Master.FindControl("Positionlbl")).Text = emp.roletype;
                }

                database.BindLeaveTypeDropdown(LeaveTypeDropdown);
                database.BindCancelReasonDropdown(CancelReasonDropdown);
            }
            database.LoadAllRequests(AllRequestsGridview);
        }

        protected void sbutton_Click(object sender, ImageClickEventArgs e)
        {
            calendar.display(SPanel);
        }

        protected void ebutton_Click(object sender, ImageClickEventArgs e)
        {
            calendar.display(EPanel);
        }

        protected void sdatecal_SelectionChanged(object sender, EventArgs e)
        {
            date = sdatecal.SelectedDate.ToShortDateString();
            Sdatetxtbx.Text = date;
            SPanel.Visible = false;
        }

        protected void edatecal_SelectionChanged(object sender, EventArgs e)
        {
            date = edatecal.SelectedDate.ToShortDateString();
            Edatetxtbx.Text = date;
            EPanel.Visible = false;
        }

        protected void Updatebtn_Click(object sender, EventArgs e)
        {
            if(CancelReasonDropdown.SelectedItem.Text =="Select Reason")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal(\"Invalid\", \"Please Select A Cancellation Reason!\", \"warning\");\r\n", true);
            }
            else
            {
                using (SqlConnection con = new SqlConnection(database.connection))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("UPDATE LeaveSubmissionTable SET CancelId = @ReasonID, LeaveStatusId = @StatusID where id = @LeaveId",con))
                    {
                        cmd.Parameters.AddWithValue("@ReasonID", CancelReasonDropdown.SelectedValue);
                        cmd.Parameters.AddWithValue("@StatusID", 6);
                        cmd.Parameters.AddWithValue("@LeaveId", Convert.ToInt32(Label7.Text));
                        cmd.ExecuteNonQuery();
                    }
                }
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal({\r\n  title: \"Are you sure?\",\r\n " +
                    "text: \"This request cannot be undone\",\r\n " +
                    "icon: \"warning\",\r\n  buttons: [\"NO\",\"YES\"],\r\n  dangerMode: true,\r\n})\r\n" +
                    ".then((willDelete) =>" +
                    "{\r\n if (willDelete) {\r\n swal(\"Request Cancelled, the page will now refresh!\", {\r\n icon: \"success\",\r\n }).then(function() { window.location.href = \"/Pages/CancelLeave.aspx\"; });\r\n } else {\r\n swal(\"Request Not Cancelled!\");\r\n}\r\n});", true);
            }
            //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal({ title: \"Success\", text: \"The Leave Request Has Been Cancelled!\", icon: \"success\" }).then(function() { window.location.href = \"/Pages/CancelLeave.aspx\"; });", true);
            //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal(\"Success\", \"The Leave Request Has Been Cancelled!\", \"success\");\r\n", true);
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void AllRequestsGridview_SelectedIndexChanged(object sender, EventArgs e)
        {
            id = Convert.ToInt32(AllRequestsGridview.Rows[AllRequestsGridview.SelectedIndex].Cells[0].Text);
            Label7.Visible = true;
            Label7.Text = id.ToString();
            using (SqlConnection con = new SqlConnection(database.connection))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("Select * from ViewAll where id= @id", con))
                {
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(id));
                    SqlDataReader rdr = cmd.ExecuteReader();
                    rdr.Read();
                    sdate = Convert.ToDateTime(rdr[6].ToString());
                    edate = Convert.ToDateTime(rdr[7].ToString());
                    Sdatetxtbx.Text = sdate.ToShortDateString();
                    Edatetxtbx.Text = edate.ToShortDateString();
                }
            }
        }
    }
}
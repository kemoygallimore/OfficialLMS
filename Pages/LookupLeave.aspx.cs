using LMS48.Classes;
using System;
using System.Collections.Generic;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                database.BindLeavestatusDrowpdown(LeaveStatusDropdown);
                database.BindLeaveTypeDropdown(LeaveTypeDropdown);
            }
            database.LoadAllRequests(leaveRequestGV);
        }

        protected void sbutton_Click(object sender, ImageClickEventArgs e)
        {
            calendar.display(SPanel);
        }

        protected void sdatecal_SelectionChanged(object sender, EventArgs e)
        {
            Sdatetxtbx.Text = sdatecal.SelectedDate.ToString();
            SPanel.Visible = false;
        }

        protected void ebutton_Click(object sender, ImageClickEventArgs e)
        {
            calendar.display(EPanel);
        }

        protected void edatecal_SelectionChanged(object sender, EventArgs e)
        {
            Edatetxtbx.Text = edatecal.SelectedDate.ToString();
            EPanel.Visible = false;
        }

        protected void Clearbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pages/LookupLeave.aspx");
        }

        protected void Submitbtn_Click(object sender, EventArgs e)
        {

        }
    }
}
using LMS48.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS48
{
    public partial class CancelLeave : System.Web.UI.Page
    {
        LoadFromDatabase database = new LoadFromDatabase();
        Show_HideCalendar calendar = new Show_HideCalendar();
        string date;
        TimeSpan difference;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
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
            Edattxtbx.Text = date;
            EPanel.Visible = false;
        }

        protected void Updatebtn_Click(object sender, EventArgs e)
        {

        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {

        }
    }
}
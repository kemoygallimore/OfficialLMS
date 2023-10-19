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
            database.LoadAllRequests(AllRequestsGridview);
        }

        protected void sbutton_Click(object sender, ImageClickEventArgs e)
        {
            calendar.display(sdatecal);
        }

        protected void ebutton_Click(object sender, ImageClickEventArgs e)
        {
            calendar.display(edatecal);
        }

        protected void sdatecal_SelectionChanged(object sender, EventArgs e)
        {
            date = sdatecal.SelectedDate.ToShortDateString();
            Sdatetxtbx.Text = date;
            sdatecal.Visible = false;
        }

        protected void edatecal_SelectionChanged(object sender, EventArgs e)
        {
            date = edatecal.SelectedDate.ToShortDateString();
            Edattxtbx.Text = date;
            edatecal.Visible = false;
        }
    }
}
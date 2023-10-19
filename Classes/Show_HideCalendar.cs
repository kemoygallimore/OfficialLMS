using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace LMS48.Classes
{
    public class Show_HideCalendar
    {
        public Show_HideCalendar() { }
        public void display(Calendar calendar)
        {
            if (calendar.Visible)
                calendar.Visible = false;
            else
                calendar.Visible = true;
        }
    }
}
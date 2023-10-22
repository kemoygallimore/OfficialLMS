using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace LMS48.Classes
{
    public class LoadFromDatabase
    {
<<<<<<< HEAD
        public string connection = " data source=WINDOWS-10-PROG\\SQLEXPRESS;initial catalog=LeaveManagementSystem;integrated Security=true";
=======
        public string connection = " data source=DESKTOP-3A12015\\sqlexpress;initial catalog=LeaveManagementSystem;integrated Security=true";
>>>>>>> b50c971c075e3ed5e5f1223684e3e9cdcd260557
        public LoadFromDatabase() { }

        public void LoadAllRequests(GridView gridView)
        {
            using(SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("Select * from ViewAll order by SubmissionDate DESC", con))
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    gridView.DataSource = dr;
                    gridView.DataBind();
                }
            }
        }

        public void BindLeavestatusDrowpdown(DropDownList dropDown)
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("Select * from LeaveStatus", con))
                {
                    SqlDataReader rdr = cmd.ExecuteReader();
                    dropDown.DataSource = rdr;
                    dropDown.DataValueField = "id";
                    dropDown.DataTextField = "status";
                    dropDown.DataBind();
                }
            }

        }
        public void BindLeaveTypeDropdown(DropDownList dropDown)
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("Select * from LeaveTypes", con))
                {
                    SqlDataReader rdr = cmd.ExecuteReader();
                    dropDown.DataSource = rdr;
                    dropDown.DataValueField = "id";
                    dropDown.DataTextField = "Type";
                    dropDown.DataBind();
                }
            }
        }
        public void BindCancelReasonDropdown(DropDownList dropDown)
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("Select * from CancelationReasons",con))
                {
                    SqlDataReader rdr = command.ExecuteReader();
                    dropDown.DataSource = rdr;
                    dropDown.DataValueField= "id";
                    dropDown.DataTextField= "reason";
                    dropDown.DataBind();
                }
            }
        }

    }
}
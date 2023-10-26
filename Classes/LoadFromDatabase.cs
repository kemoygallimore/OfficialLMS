using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace LMS48.Classes
{
    public class LoadFromDatabase
    {

        public string connection = " data source=kemoyslenovo\\SQLEXPRESS;initial catalog=LeaveManagementSystem;integrated Security=true";

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
        public void LoadAllStaff(GridView gv, string id)
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("Select * from ViewAll where EmployeeID <> @EmployeeID order by SubmissionDate DESC ", con))
                {
                    cmd.Parameters.AddWithValue("@EmployeeID", id);
                    SqlDataReader dr = cmd.ExecuteReader();
                    gv.DataSource = dr;
                    gv.DataBind();
                }
            }
        }
        public void LoadEmployeeRequests(GridView gv, string lbl)
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("Select * from ViewAll where EmployeeID = @EmployeeID order by SubmissionDate DESC ", con))
                {
                    cmd.Parameters.AddWithValue("@EmployeeID", lbl);
                    SqlDataReader dr = cmd.ExecuteReader();
                    gv.DataSource = dr;
                    gv.DataBind();
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
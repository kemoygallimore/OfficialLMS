﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace LMS48.Classes
{
    public class LoadFromDatabase
    {
        public string connection = " data source=kemoyslenovo\\sqlexpress;initial catalog=LeaveManagementSystem;integrated Security=true";
        public LoadFromDatabase() { }

        public void LoadAllRequests(GridView gridView)
        {
            using(SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("Select * from ViewAll", con))
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

    }
}
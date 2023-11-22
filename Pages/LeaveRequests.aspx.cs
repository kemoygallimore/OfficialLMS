using LMS48.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace LMS48
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        LoadFromDatabase database = new LoadFromDatabase();
        int id;
        string dropdownselection;
        string masterid = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["EmployeeData"] != null)
                {
                    EmployeeData emp = (EmployeeData)Session["EmployeeData"];
                    ((Label)Master.FindControl("EmpIdlbl")).Text = emp.EmployeeID;
                    ((Label)Master.FindControl("Namelbl")).Text = emp.Name;
                    ((Label)Master.FindControl("Positionlbl")).Text = emp.roletype;
                }
                database.BindLeavestatusDrowpdown(LeaveStatusDropdown);
            }
            masterid = ((Label)Master.FindControl("EmpIdlbl")).Text;
            database.LoadAllStaff(LeaveRequestsGV, masterid);
        }

        protected void LeaveRequestsGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            string index = LeaveRequestsGV.Rows[LeaveRequestsGV.SelectedIndex].Cells[0].Text;
            string name = LeaveRequestsGV.Rows[LeaveRequestsGV.SelectedIndex].Cells[2].Text;
            string status = LeaveRequestsGV.Rows[LeaveRequestsGV.SelectedIndex].Cells[6].Text;
            if(status=="Cancelled")
            {
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal({ title: \"Failed\", text: text: \"You are not able to change the status of a Cancelled Order. If the order was cancelled in error, then please submit a new request\",\r\n, icon: \"error\" });", true);
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal({ title: \"Failed\", text: \"Can not change an request that is already cancelled\", icon: \"error\" });", true);

            }
            else
            {
                Label1.Visible = true;
                NameTxtBx.Text = name;
                if (status == "Approved")
                    LeaveStatusDropdown.SelectedValue = "2";
                else if (status == "Denied")
                    LeaveStatusDropdown.SelectedValue = "3";
                else if (status == "Escalated")
                    LeaveStatusDropdown.SelectedValue = "4";
                else if (status == "Pending")
                    LeaveStatusDropdown.SelectedValue = "5";
                else
                    LeaveStatusDropdown.SelectedValue = "5";

                Label1.Text = index;
            }
        }

        protected void LeaveStatusDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Updatebtn_Click(object sender, EventArgs e)
        {
            try
            {
                
                id = Convert.ToInt32(Label1.Text);
                dropdownselection = LeaveStatusDropdown.SelectedValue;
                SqlConnection con = new SqlConnection(database.connection);
                con.Open();
                using (SqlCommand sqlCommand = new SqlCommand("UpdateLeaveStatus", con))
                {
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddWithValue("@LeaveID", id);
                    sqlCommand.Parameters.AddWithValue("@newStatus", dropdownselection);
                    sqlCommand.ExecuteNonQuery();
                }
                database.LoadAllStaff(LeaveRequestsGV, masterid);
                
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}
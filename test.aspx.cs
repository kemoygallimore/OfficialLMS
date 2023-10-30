using LMS48.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace LMS48
{
    public partial class test : System.Web.UI.Page
    {
        EmployeeData E = new EmployeeData();
        LoadFromDatabase database = new LoadFromDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            Label1.Text = "Button was clicked";
            E.EmployeeID = Usernametxtbx.Text;
            using (SqlConnection con = new SqlConnection(database.connection))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("Select * from ViewEmployees where EmployeeID = @user",con))
                {
                    cmd.Parameters.AddWithValue("@User", E.EmployeeID);
                    SqlDataReader rdr = cmd.ExecuteReader();
                   
                    if(rdr.HasRows)
                    {
                        rdr.Read();
                        E.EmployeeID = rdr.GetString(1);
                        E.Name = rdr.GetString(2) + " " + rdr.GetString(3);
                        E.roletype = rdr.GetString(5);
                        Session["EmployeeData"] = E;
                        Response.Redirect("/Pages/LookupLeave.aspx");
                    }
                    else
                    {
                        Label1.Text = "Employee Not Found";
                    }
                }
            }            
        }
    }
}
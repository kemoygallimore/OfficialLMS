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
        //initialize an instance of EmployeeData class
        EmployeeData E = new EmployeeData();
        //Initialize an instance of the LoadFromDatabase class
        LoadFromDatabase database = new LoadFromDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            //create a new sql connection string with the string connection being a varaible database object
            SqlConnection connection = new SqlConnection(database.connection);
            connection.Open();
            //Quering the database for all of the data in the ViewEmployees where EmployeeId column is equal to a parameter
            using (SqlCommand cmd  = new SqlCommand("Select * from ViewEmployees where EmployeeId = @Employeeid",connection))
            {
                //this parameter stores the value stored in the textbox
                cmd.Parameters.AddWithValue("@Employeeid",Usernametxtbx.Text);
                SqlDataReader reader = cmd.ExecuteReader();
                if(reader.HasRows)
                {
                    reader.Read();
                    string password = reader.GetString(6).Trim();
                    if(Passwordtxtbx.Text==password)
                    {
                        E.EmployeeID = reader.GetString(1);
                        E.Name = reader.GetString(2) + " " + reader.GetString(3);
                        E.roletype = reader.GetString(5);
                        Session["EmployeeData"] = E;
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal({ title: \"WELCOME\", text: \"You Have Been Logged in Successfully!\", icon: \"success\" }).then(function() { window.location.href = \"/Pages/LookupLeave.aspx\"; });", true);
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal({ title: \"Failed\", text: \"Email or Password is incorrect\", icon: \"error\" });", true);
                    }
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal({ title: \"Failed\", text: \"Email or Password is incorrect\", icon: \"error\" });", true);

                }


            }


            //Label1.Text = "Button was clicked";
            //E.EmployeeID = Usernametxtbx.Text;
            /*using (SqlConnection con = new SqlConnection(database.connection))
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
            } */           
        }
    }
}
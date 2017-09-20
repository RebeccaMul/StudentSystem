using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Remove("user");
        
    }
    protected void setsession_Click(object sender, EventArgs e)
    {
        string uname = username.Text;
        string pword = password.Text;

        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection Connection = new SqlConnection(connectionString);


        Connection.Open();

        string query = "SELECT * FROM [SIS_USER] WHERE sNumber=@sNumber AND password=@password";
        SqlCommand myCommand = new SqlCommand(query, Connection);

        myCommand.Parameters.AddWithValue("@sNumber", uname);
        myCommand.Parameters.AddWithValue("@password", pword);
        SqlDataReader rdr = myCommand.ExecuteReader();




        if (rdr.HasRows)
        {
            while (rdr.Read())
            {


                string myuserid = rdr["userID"].ToString();
                Session["userID"] = myuserid;

                string type = rdr["typeID"].ToString();
                Session["typeID"] = type;

                string userdisplay = rdr["username"].ToString();
                Session["user"] = userdisplay;

                int viewusertimetable = 0;
                Session["viewusertimetable"] = viewusertimetable;

                if (Convert.ToInt32(Session["typeID"]) == 1)
                {
                    Response.Redirect("Admin/Default.aspx");
                }
                //Registered User
                else if (Convert.ToInt32(Session["typeID"]) == 2)
                {
                    Response.Redirect("Dashboard.aspx");
                }
                //Senior University Manager
                else if (Convert.ToInt32(Session["typeID"]) == 3)
                {
                    Response.Redirect("SeniorUniversityManager/default.aspx");
                }
                //Academic Program Manager
                else if (Convert.ToInt32(Session["typeID"]) == 4)
                {
                    Response.Redirect("AcademicProgramManager/Dashboard.aspx");
                }
                //Student
                else if (Convert.ToInt32(Session["typeID"]) == 5)
                {
                    Response.Redirect("Student/default.aspx");
                }
                //Lecturer
                else if (Convert.ToInt32(Session["typeID"]) == 6)
                {
                    Response.Redirect("Lecturer/lecturerdashboard.aspx");
                }


            }


        }
        else
        {
            invalidLabel.Text = "You entered an invalid username or password. Please try again.";
        }

        Connection.Close();




    }  
}
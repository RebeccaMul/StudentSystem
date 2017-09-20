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

public partial class Student_RegWizardModulesRemove : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Rebecca - If not logged in, or user is not a student, redirect to default page
        if (Session["user"] == null || (Convert.ToInt32(Session["typeID"]) != 5))
        {
            Response.Redirect("../Default.aspx");

        }
        else
        {
            //Otherwise assign session to username field
            string user = Session["user"].ToString();
            

            //RMU - Connection to database
            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

            SqlConnection myConnection = new SqlConnection(connectionString);

            myConnection.Open();

            //RMU - Getting values from URL:
            int ModuleID = Convert.ToInt32(Request.QueryString["moduleID"]);
            int sID = Convert.ToInt32(Request.QueryString["studentID"]);
            int uID = Convert.ToInt32(Request.QueryString["userID"]);
            int level = Convert.ToInt32(Request.QueryString["level"]);

            //RMU - Update - Deletes the chosen module from database for the user:
            string query = "DELETE FROM SIS_STUDENT_MODULES WHERE studentID = @sID AND moduleSelected = @modID ";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@ModID", ModuleID);
            myCommand.Parameters.AddWithValue("@SID", sID);

            myCommand.ExecuteNonQuery();

            myConnection.Close();

            //Second connection to read timetable class details
            string connectionString2 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

            SqlConnection myConnection2 = new SqlConnection(connectionString2);

            myConnection2.Open();

            //Removes timetable events for the module from user's timetable:
            string query2 = "DELETE FROM SIS_EVENT WHERE SIS_EVENT.relatedModule = @Mod AND SIS_EVENT.userID = @User";

            SqlCommand myCommand2 = new SqlCommand(query2, myConnection2);

            myCommand2.Parameters.AddWithValue("@Mod", ModuleID);
            myCommand2.Parameters.AddWithValue("@User", uID);
            
            myCommand2.ExecuteNonQuery();

            myConnection2.Close();

            //RMU- redirect query
            Response.Redirect("RegWizardModules.aspx?userid=" + uID + "&studentID=" + sID + "&Level=" + level);




        }


    }
}
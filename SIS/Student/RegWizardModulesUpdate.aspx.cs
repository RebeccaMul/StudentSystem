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

public partial class Student_RegWizardModulesUpdate : System.Web.UI.Page
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
            int comp = 0;

            //RMU - Update - Inserts module chosen into table with user's ID
            string query = "INSERT INTO SIS_STUDENT_MODULES (studentID, moduleSelected, Completed) VALUES (@ID, @Mod, @comp)";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@Mod", ModuleID);
            myCommand.Parameters.AddWithValue("@ID", sID);
            myCommand.Parameters.AddWithValue("@comp", comp);

            myCommand.ExecuteNonQuery();

            myConnection.Close();

            //Counting number of timetable events associated with module:
            NumOfEvents.DataBind();
            int eventcount = NumOfEvents.Items.Count();
            
            //DB Connection to retrieve ID's of events linked to module:
                string connectionString2 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

                SqlConnection myConnection2 = new SqlConnection(connectionString2);

                myConnection2.Open();

                string query2 = "SELECT * FROM SIS_EVENT WHERE eventID IN (SELECT EventID FROM SIS_EVENT_MODULE WHERE ModuleID = @Mod)";

                SqlCommand myCommand2 = new SqlCommand(query2, myConnection2);

                string ModID = Request.QueryString["ModuleID"];

                myCommand2.Parameters.AddWithValue("@Mod", ModID);

                SqlDataReader rdr = myCommand2.ExecuteReader();

            //Creating array to store eventIDs:
                    var moduleEvents = new List<String>();
                    while (rdr.Read())
                    {
                        moduleEvents.Add(rdr["eventID"].ToString());
                        titleBox.Text = rdr["eventID"].ToString();

                    }

            //Storing eventID's in a textbox 
                   foreach (string events in moduleEvents)
                   {

                       descBox.Text += events + " ";

                   }

            //Storing eventID's in string
                   string eventsNeeded = descBox.Text;
                    
                rdr.Close();
                //removed old code
                
                myConnection2.Close();
 

            ////RMU- redirect query carrying over all info
            Response.Redirect("RegWizardModulesUpdateEvents.aspx?userid=" + uID + "&studentID=" + sID + "&ModuleID=" + ModuleID + "&Level=" + level + "&Events=" + eventsNeeded);


        }


    }
}
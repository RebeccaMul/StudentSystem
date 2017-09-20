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

public partial class Student_RegWizardModules : System.Web.UI.Page
{
    int compTotal = 0;
    int chosenTotal = 0;
    int finalTotal = 0;

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
            
        }

        //DB Connection:
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);
        myConnection.Open();

        //Getting info from URL
        string uID = Request.QueryString["userID"];
        string sID = Request.QueryString["studentID"];
        int level = Convert.ToInt32(Request.QueryString["level"]);
        int units = Convert.ToInt32(Request.QueryString["units"]);

        //If insufficient units, alert the user 
        //& redirect back to Reg wizard
         if (units != 120)
        {
            Response.Write("<script>alert('You have not enrolled in enough modules, please ensure you have acquired 120 units.');</script>");

            Response.Redirect("RegWizard.aspx?UserID=" + uID + "&studentID=" + sID + "&level=" + level);
        }

         else if (units == 120)
         {

             //Module ID's: Placement: 41.  1st: 11, 12, 40, 8, 13, 14.     2nd: 30, 31, 16, 32, 17.     3rd: 20, 28, 19
             if (level == 1)
             {
                 //Insert compulsory first year modules (set to incomplete)
                     string year1 = "INSERT INTO SIS_STUDENT_MODULES (studentID, moduleSelected, Completed) VALUES (@ID, 11, 0)"
                     + "INSERT INTO SIS_STUDENT_MODULES (studentID, moduleSelected, Completed) VALUES (@ID, 12, 0)"
                     + "INSERT INTO SIS_STUDENT_MODULES (studentID, moduleSelected, Completed) VALUES (@ID, 13, 0)"
                     + "INSERT INTO SIS_STUDENT_MODULES (studentID, moduleSelected, Completed) VALUES (@ID, 14, 0)"
                     + "INSERT INTO SIS_STUDENT_MODULES (studentID, moduleSelected, Completed) VALUES (@ID, 8, 0)"
                     + "INSERT INTO SIS_STUDENT_MODULES (studentID, moduleSelected, Completed) VALUES (@ID, 40, 0)";

                 SqlCommand myCommand = new SqlCommand(year1, myConnection);
                 myCommand.Parameters.AddWithValue("@ID", sID);
                 myCommand.ExecuteNonQuery();

                 //INSERT LEVEL 1 MODULE TIMETABLE CLASSES HERE FOR USER

             }
             else if (level == 2) {
             //Set first year modules to complete
              string year1update = "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 8"
                  + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 11"
                  + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 12"
                  + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 13"
                  + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 14"
                  + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 40" 
                  + "UPDATE SIS_STUDENT SET L1Complete = 1";

             //Insert compulsory second year modules (set to incomplete)
              string year2 = "INSERT INTO SIS_STUDENT_MODULES (studentID, moduleSelected, Completed) VALUES (@ID, 16, 0)"
                     + "INSERT INTO SIS_STUDENT_MODULES (studentID, moduleSelected, Completed) VALUES (@ID, 17, 0)"
                     + "INSERT INTO SIS_STUDENT_MODULES (studentID, moduleSelected, Completed) VALUES (@ID, 30, 0)"
                     + "INSERT INTO SIS_STUDENT_MODULES (studentID, moduleSelected, Completed) VALUES (@ID, 31, 0)"
                     + "INSERT INTO SIS_STUDENT_MODULES (studentID, moduleSelected, Completed) VALUES (@ID, 32, 0)"
                     + "INSERT INTO SIS_STUDENT_MODULES (studentID, moduleSelected, Completed) VALUES (@ID, 42, 0)";
               
              SqlCommand myCommand = new SqlCommand(year1update, myConnection);
              SqlCommand myCommand2 = new SqlCommand(year2, myConnection);

              myCommand.Parameters.AddWithValue("@ID", sID);
              myCommand2.Parameters.AddWithValue("@ID", sID);

              //Running updates
              myCommand.ExecuteNonQuery();
              myCommand2.ExecuteNonQuery();

             }
             else if (level == 3)
             {
                //Set first year modules to complete
                 string year1update = "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 8"
                 + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 11"
                 + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 12"
                 + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 13"
                 + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 14"
                 + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 40"
                 + "UPDATE SIS_STUDENT SET L1Complete = 1";

                 //Set second year modules + placement to complete
                 string year2update = "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 16"
            + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 17"
            + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 30"
            + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 31"
            + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 32"
            + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 42"
            + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 41"
            + "UPDATE SIS_STUDENT SET L2Complete = 1"
            + "UPDATE SIS_STUDENT SET PlacementComplete = 1";

                 //Insert compulsory third year modules (set to incomplete) 
                 string year3 = "INSERT INTO SIS_STUDENT_MODULES (studentID, moduleSelected, Completed) VALUES (@ID, 19, 0)"
                   + "INSERT INTO SIS_STUDENT_MODULES (studentID, moduleSelected, Completed) VALUES (@ID, 20, 0)"
                   + "INSERT INTO SIS_STUDENT_MODULES (studentID, moduleSelected, Completed) VALUES (@ID, 28, 0)";

                 SqlCommand myCommand = new SqlCommand(year1update, myConnection);
                 SqlCommand myCommand2 = new SqlCommand(year2update, myConnection);
                 SqlCommand myCommand3 = new SqlCommand(year3, myConnection);

                 myCommand.Parameters.AddWithValue("@ID", sID);
                 myCommand2.Parameters.AddWithValue("@ID", sID);
                 myCommand3.Parameters.AddWithValue("@ID", sID);

                 //Run updates:
                 myCommand.ExecuteNonQuery();
                 myCommand2.ExecuteNonQuery();
                 myCommand3.ExecuteNonQuery();
               }

             myConnection.Close();


             //Adding Module Events IF not already added by timetable during enrolment process:
             //Requesting ID's from link, splitting them and storing in an array:
             string linkEvents = Request.QueryString["Events"];
             string[] IDs = linkEvents.Split(' ');
             int arraylength = Convert.ToInt32(IDs.Length);

             //For every event id in array, store the id in a textbox
             //Then perform an insert into the timetable database using this id
             //and move onto adding the next event, until all are added
             for (int X = 0; X < IDs.Length; X++)
             {
                 if (X > arraylength)
                 {
                     break;
                 }

                 titleBox.Text = IDs[X].ToString();
                 string tempevent = titleBox.Text;

                 ////DB to retrieve event details from ID
                 string connectionString2 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                 SqlConnection myConnection2 = new SqlConnection(connectionString2);
                 myConnection2.Open();

                 //Find the event and module details in db:
                 string query2 = "SELECT * FROM SIS_EVENT WHERE EventID = @Event";
                 string query4 = "SELECT * FROM SIS_EVENT_MODULE WHERE EVENTID = @Event";

                 SqlCommand myCommand2 = new SqlCommand(query2, myConnection2);
                 SqlCommand myCommand4 = new SqlCommand(query4, myConnection2);
                 myCommand2.Parameters.AddWithValue("@Event", tempevent);
                 myCommand4.Parameters.AddWithValue("@Event", tempevent);
                 SqlDataReader rdr = myCommand2.ExecuteReader();

                 //Store the class details found in textboxes for later use:
                 while (rdr.Read())
                 {
                     string eventid = rdr["eventID"].ToString();
                     string title = rdr["title"].ToString();
                     string desc = rdr["description"].ToString();
                     string start = rdr["event_start"].ToString();
                     string end = rdr["event_end"].ToString();
                     string day = rdr["all_day"].ToString();

                     titleBox.Text = title;
                     descBox.Text = desc;
                     startBox.Text = start;
                     endBox.Text = end;
                     dayBox.Text = day;
                     idBox.Text = eventid;
                 }

                 //Class details saved in strings:
                 string newTitle = titleBox.Text;
                 string newDesc = descBox.Text;
                 DateTime newStart = Convert.ToDateTime(startBox.Text);
                 DateTime newEnd = Convert.ToDateTime(endBox.Text);
                 string newDay = dayBox.Text;
                 string newid = idBox.Text;

                 rdr.Close();

                 SqlDataReader rdr2 = myCommand4.ExecuteReader();


                 //Store the module details found in textboxes for later use:
                 while (rdr2.Read())
                 {
                     string id = rdr2["moduleID"].ToString();

                     ModuleBox.Text = id;
                 }

                 //Module detail stored in string
                 string ModuleID = ModuleBox.Text;

                 rdr2.Close();

                 //insert new timetable event for module, with class details into the database for the user:
                 string query3 = "IF NOT EXISTS (SELECT DISTINCT * FROM SIS_EVENT WHERE userID = @user AND event_end = @end) INSERT INTO SIS_EVENT (title, description, event_start, event_end, all_day, userID, relatedModule) VALUES (@title, @desc, @start, @end, @day, @user, @module)";

                 SqlCommand myCommand3 = new SqlCommand(query3, myConnection2);

                 myCommand3.Parameters.AddWithValue("@title", newTitle);
                 myCommand3.Parameters.AddWithValue("@desc", newDesc);
                 myCommand3.Parameters.AddWithValue("@start", newStart);
                 myCommand3.Parameters.AddWithValue("@end", newEnd);
                 myCommand3.Parameters.AddWithValue("@day", newDay);
                 myCommand3.Parameters.AddWithValue("@user", uID);
                 myCommand3.Parameters.AddWithValue("@module", ModuleID);

                 myCommand3.ExecuteNonQuery();

                 //Repeats until all events in array are added
             }

             //Once all checks are complete, direct to confirmation page to finish enrolment
             Response.Redirect("RegConfirm.aspx?UserID=" + uID + "&studentID=" + sID + "&level=" + level + "&units=" + units);
         }
  
    }

}





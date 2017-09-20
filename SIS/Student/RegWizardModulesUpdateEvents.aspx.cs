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

            int ModuleID = Convert.ToInt32(Request.QueryString["moduleID"]);
            int sID = Convert.ToInt32(Request.QueryString["studentID"]);
            int uID = Convert.ToInt32(Request.QueryString["userID"]);
            int level = Convert.ToInt32(Request.QueryString["level"]);

            //Requesting ID's from link, splitting them and storing in an array:
            string linkEvents = Request.QueryString["Events"];
            string[] IDs = linkEvents.Split(' ');
            int arraylength = Convert.ToInt32(IDs.Length);
            eventCountBox.Text = arraylength.ToString();

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
                
                string query2 = "SELECT * FROM SIS_EVENT WHERE EventID = @Event";

                SqlCommand myCommand2 = new SqlCommand(query2, myConnection2);
                myCommand2.Parameters.AddWithValue("@Event", tempevent);
                SqlDataReader rdr = myCommand2.ExecuteReader();

                while (rdr.Read())
                {
                    string id = rdr["eventID"].ToString();
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
                    checkID.Text = id;
                }

                //Class details in string:
                string newTitle = titleBox.Text;
                string newDesc = descBox.Text;
                DateTime newStart = Convert.ToDateTime(startBox.Text);
                DateTime newEnd = Convert.ToDateTime(endBox.Text);
                string newDay = dayBox.Text;

                rdr.Close();

                //insert
                string query3 = "INSERT INTO SIS_EVENT (title, description, event_start, event_end, all_day, userID, relatedModule) VALUES (@title, @desc, @start, @end, @day, @user, @module)";

                SqlCommand myCommand3 = new SqlCommand(query3, myConnection2);

                myCommand3.Parameters.AddWithValue("@title", newTitle);
                myCommand3.Parameters.AddWithValue("@desc", newDesc);
                myCommand3.Parameters.AddWithValue("@start", newStart);
                myCommand3.Parameters.AddWithValue("@end", newEnd);
                myCommand3.Parameters.AddWithValue("@day", newDay);
                myCommand3.Parameters.AddWithValue("@user", uID);
                myCommand3.Parameters.AddWithValue("@module", ModuleID);

                myCommand3.ExecuteNonQuery();

            }
           
            ////RMU- redirect query (returning to registration)
           Response.Redirect("RegWizardModules.aspx?userid=" + uID + "&studentID=" + sID + "&Level=" + level);

        }


    }
}
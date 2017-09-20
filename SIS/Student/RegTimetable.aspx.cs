using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Web.Services;

using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Student_Timetable : System.Web.UI.Page
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
            username.Text = user;
            username1.Text = user;
        }

        //Adding events from compulsory modules:
        int uID = Convert.ToInt32(Request.QueryString["userID"]);

        //Requesting ID's from link, splitting them and storing in an array:
        string linkEvents = Request.QueryString["Events"];

        if (Request.QueryString["Events"] != null)
        { 

        string[] IDs = linkEvents.Split(' ');
        int arraylength = Convert.ToInt32(IDs.Length);

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
            string query4 = "SELECT * FROM SIS_EVENT_MODULE WHERE EVENTID = @Event";

            SqlCommand myCommand2 = new SqlCommand(query2, myConnection2);
            SqlCommand myCommand4 = new SqlCommand(query4, myConnection2);
            myCommand2.Parameters.AddWithValue("@Event", tempevent);
            myCommand4.Parameters.AddWithValue("@Event", tempevent);
            SqlDataReader rdr = myCommand2.ExecuteReader();

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

            //Class details in string:
            string newTitle = titleBox.Text;
            string newDesc = descBox.Text;
            DateTime newStart = Convert.ToDateTime(startBox.Text);
            DateTime newEnd = Convert.ToDateTime(endBox.Text);
            string newDay = dayBox.Text;
            string newid = idBox.Text;

            rdr.Close();

            SqlDataReader rdr2 = myCommand4.ExecuteReader();

            while (rdr2.Read())
            {
                string id = rdr2["moduleID"].ToString();
               
                ModuleBox.Text = id;
            }

            string ModuleID = ModuleBox.Text;

            rdr2.Close();

            //insert
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

        }
        }


        //Label for timetable
        Label1.Text = "Please Select Month/Week/Day View";

        //Checking for amount of clashes returned
        CLASHLIST.DataBind();
        int clashnum = CLASHLIST.Items.Count();

        //If clashes present, present warning:
        if (clashnum > 0) {

            ClashMessage.Text = "Note: The system has detected there are one or more clashes in this timetable, please check your schedule. You may still enrol with clashes. ";

        }
    }
    [System.Web.Services.WebMethod(true)]
    public static string UpdateEvent(CalendarEvent cevent)
    {

        List<int> idList = (List<int>)System.Web.HttpContext.Current.Session["idList"];
        if (idList != null && idList.Contains(cevent.id))
        {
            if (CheckAlphaNumeric(cevent.title) && CheckAlphaNumeric(cevent.description))
            {
                EventDAO.updateEvent(cevent.id, cevent.title, cevent.description);

                return "updated event with id:" + cevent.id + " update title to: " + cevent.title +
                " update description to: " + cevent.description;
            }

        }

        return "unable to update event with id:" + cevent.id + " title : " + cevent.title +
            " description : " + cevent.description;
    }

    //this method only updates start and end time
    //this is called when a event is dragged or resized in the calendar
    [System.Web.Services.WebMethod(true)]
    public static string UpdateEventTime(ImproperCalendarEvent improperEvent)
    {
        List<int> idList = (List<int>)System.Web.HttpContext.Current.Session["idList"];
        if (idList != null && idList.Contains(improperEvent.id))
        {
            EventDAO.updateEventTime(improperEvent.id,
                DateTime.ParseExact(improperEvent.start, "dd-MM-yyyy hh:mm:ss tt", CultureInfo.InvariantCulture),
                DateTime.ParseExact(improperEvent.end, "dd-MM-yyyy hh:mm:ss tt", CultureInfo.InvariantCulture));

            return "updated event with id:" + improperEvent.id + "update start to: " + improperEvent.start +
                " update end to: " + improperEvent.end;
        }

        return "unable to update event with id: " + improperEvent.id;
    }

    //called when delete button is pressed
    [System.Web.Services.WebMethod(true)]
    public static String deleteEvent(int id)
    {
        //idList is stored in Session by JsonResponse.ashx for security reasons
        //whenever any event is update or deleted, the event id is checked
        //whether it is present in the idList, if it is not present in the idList
        //then it may be a malicious user trying to delete someone elses events
        //thus this checking prevents misuse
        List<int> idList = (List<int>)System.Web.HttpContext.Current.Session["idList"];
        if (idList != null && idList.Contains(id))
        {
            EventDAO.deleteEvent(id);
            return "deleted event with id:" + id;
        }

        return "unable to delete event with id: " + id;

    }

    //called when Add button is clicked
    //this is called when a mouse is clicked on open space of any day or dragged 
    //over mutliple days
    [System.Web.Services.WebMethod]
    public static int addEvent(ImproperCalendarEvent improperEvent)
    {

        CalendarEvent cevent = new CalendarEvent()
        {
            title = improperEvent.title,
            description = improperEvent.description,
            start = DateTime.ParseExact(improperEvent.start, "dd-MM-yyyy hh:mm:ss tt", CultureInfo.InvariantCulture),
            end = DateTime.ParseExact(improperEvent.end, "dd-MM-yyyy hh:mm:ss tt", CultureInfo.InvariantCulture)

        };

        if (CheckAlphaNumeric(cevent.title) && CheckAlphaNumeric(cevent.description))
        {
            int key = EventDAO.addEvent(cevent);

            List<int> idList = (List<int>)System.Web.HttpContext.Current.Session["idList"];

            if (idList != null)
            {
                idList.Add(key);
            }

            return key;//return the primary key of the added cevent object

        }

        return -1;//return a negative number just to signify nothing has been added

    }

    private static bool CheckAlphaNumeric(string str)
    {

        return Regex.IsMatch(str, @"^[a-zA-Z0-9 ]*$");


    }

}

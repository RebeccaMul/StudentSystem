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
public partial class Admin_Timetable_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("../Default.aspx");

        }
        else if ((Convert.ToInt32(Session["typeID"]) != 1))
        {
            Response.Redirect("../Default.aspx");
        }
        else
        {

            string user = Session["user"].ToString();
            username.Text = user;
            username1.Text = user;

        }

        if (!Page.IsPostBack)
        {
            DropDownModule.DataBind();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        //Inserting initial event details:
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        // myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        int dropdownmodule = Convert.ToInt16(DropDownModule.SelectedValue);
        string eventname = Name.Text;
        string eventstart = startDate.Text;
        string eventend = endDate.Text;
        string eventdesc = desc.Text;
        DateTime startDateSelected = Calendar1.SelectedDate;
        DateTime endDateSelected = Calendar2.SelectedDate;
        int weeks = Convert.ToInt32(NumOfWeeks.SelectedValue);
        int i;
        SelectedLecturer.DataBind();
        int lectID = Convert.ToInt32(SelectedUser.Text);

       if(dropdownmodule==0)
       { 

        string query = "INSERT INTO SIS_EVENT (title, description, event_start, event_end, all_day, userID) OUTPUT INSERTED.eventID VALUES (@title, @description, @event_start, @event_end, @all_day, @userID)";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@userID", 0);
        myCommand.Parameters.AddWithValue("@title", eventname);
        myCommand.Parameters.AddWithValue("@description", eventdesc);
        myCommand.Parameters.AddWithValue("@event_start", eventstart);
        myCommand.Parameters.AddWithValue("@event_end", eventend);
        myCommand.Parameters.AddWithValue("@all_day", "");

        //Executes query and takes the id of the newly inserted row
        Int32 newEventID = (Int32)myCommand.ExecuteScalar();

        myConnection.Close();

        done.Text = "Event Added";

        //Inserting event into event module link table:
        string connectionString2 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection2 = new SqlConnection(connectionString2);

        myConnection2.Open();

        string query2 = "INSERT INTO [SIS_EVENT_MODULE] (eventID, moduleID) VALUES (@newEventID, @newModuleID)";

        SqlCommand myCommand2 = new SqlCommand(query2, myConnection2);

        myCommand2.Parameters.AddWithValue("@newEventID", newEventID);
        myCommand2.Parameters.AddWithValue("@newModuleID", dropdownmodule);

        myCommand2.ExecuteNonQuery();
      

        myConnection2.Close();


        //If more than one week is chosen, add multiple events (calculates dates)
        if (weeks > 1)
        {

            int DayInterval = 7;
            DateTime fullend = startDateSelected.AddMonths(3);
            DateTime fullend2 = endDateSelected.AddMonths(3);

            //Start dates array:
            List<DateTime> startDateList = new List<DateTime>();
            while (startDateSelected.AddDays(DayInterval) <= fullend)
            {
                startDateSelected = startDateSelected.AddDays(DayInterval);
                startDateList.Add(startDateSelected);
            }

            //End dates array:
            List<DateTime> endDateList = new List<DateTime>();
            while (endDateSelected.AddDays(DayInterval) <= fullend2)
            {
                endDateSelected = endDateSelected.AddDays(DayInterval);
                endDateList.Add(endDateSelected);
            }

            DateTime nextweekstart;
            DateTime nextweekend;

            for (i = 0; i < weeks; i++)
            {
                if (i > weeks)
                {
                    break;
                }

                nextweekstart = startDateList[i];
                nextweekend = endDateList[i];
                week2.Text = nextweekstart.ToString();
                week3.Text = nextweekstart.ToString();

                week2.DataBind();
                week3.DataBind();

                DateTime newStart = Convert.ToDateTime(week2.Text);
                DateTime newEnd = Convert.ToDateTime(week3.Text);

                string connectionString3 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection myConnection3 = new SqlConnection(connectionString);

                // myConnection.ConnectionString is now set to connectionString.
                myConnection3.Open();

                string query3 = "INSERT INTO SIS_EVENT (title, description, event_start, event_end, all_day, userID) OUTPUT INSERTED.eventID VALUES (@title2, @description2, @event_start2, @event_end2, @all_day2, @userID2)";

                SqlCommand myCommand3 = new SqlCommand(query3, myConnection3);

                //create a parameterised object

                myCommand3.Parameters.AddWithValue("@userID2", 0);
                myCommand3.Parameters.AddWithValue("@title2", eventname);
                myCommand3.Parameters.AddWithValue("@description2", eventdesc);
                myCommand3.Parameters.AddWithValue("@event_start2", newStart);
                myCommand3.Parameters.AddWithValue("@event_end2", newEnd);
                myCommand3.Parameters.AddWithValue("@all_day2", "");

                //Executes query and takes the id of the newly inserted row
                newEventID = (Int32)myCommand3.ExecuteScalar();

                myConnection3.Close();

                done.Text = "Event Added";


                string connectionString4 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection myConnection4 = new SqlConnection(connectionString2);

                myConnection4.Open();


                string query4 = "INSERT INTO [SIS_EVENT_MODULE] (eventID, moduleID) VALUES (@newEventID2, @newModuleID2)";

                SqlCommand myCommand4 = new SqlCommand(query4, myConnection4);

                myCommand4.Parameters.AddWithValue("@newEventID2", newEventID);
                myCommand4.Parameters.AddWithValue("@newModuleID2", dropdownmodule);

                myCommand4.ExecuteNonQuery();

                myConnection4.Close();


            }
        }
        }
        else
        {
            string query = "INSERT INTO SIS_EVENT (title, description, event_start, event_end, all_day, userID) OUTPUT INSERTED.eventID VALUES (@title, @description, @event_start, @event_end, @all_day, @userID)";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@userID", lectID);
        myCommand.Parameters.AddWithValue("@title", eventname);
        myCommand.Parameters.AddWithValue("@description", eventdesc);
        myCommand.Parameters.AddWithValue("@event_start", eventstart);
        myCommand.Parameters.AddWithValue("@event_end", eventend);
        myCommand.Parameters.AddWithValue("@all_day", "");

        //Executes query and takes the id of the newly inserted row
        Int32 newEventID = (Int32)myCommand.ExecuteScalar();

        myConnection.Close();

        done.Text = "Event Added";

        //Inserting event into event module link table:
        string connectionString2 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection2 = new SqlConnection(connectionString2);

        myConnection2.Open();

        string query2 = "INSERT INTO [SIS_EVENT_MODULE] (eventID, moduleID) VALUES (@newEventID, @newModuleID)";

        SqlCommand myCommand2 = new SqlCommand(query2, myConnection2);

        myCommand2.Parameters.AddWithValue("@newEventID", newEventID);
        myCommand2.Parameters.AddWithValue("@newModuleID", dropdownmodule);

        myCommand2.ExecuteNonQuery();
      

        myConnection2.Close();


        //If more than one week is chosen, add multiple events (calculates dates)
        if (weeks > 1)
        {

            int DayInterval = 7;
            DateTime fullend = startDateSelected.AddMonths(3);
            DateTime fullend2 = endDateSelected.AddMonths(3);

            //Start dates array:
            List<DateTime> startDateList = new List<DateTime>();
            while (startDateSelected.AddDays(DayInterval) <= fullend)
            {
                startDateSelected = startDateSelected.AddDays(DayInterval);
                startDateList.Add(startDateSelected);
            }

            //End dates array:
            List<DateTime> endDateList = new List<DateTime>();
            while (endDateSelected.AddDays(DayInterval) <= fullend2)
            {
                endDateSelected = endDateSelected.AddDays(DayInterval);
                endDateList.Add(endDateSelected);
            }

            DateTime nextweekstart;
            DateTime nextweekend;

            for (i = 0; i < weeks; i++)
            {
                if (i > weeks)
                {
                    break;
                }

                nextweekstart = startDateList[i];
                nextweekend = endDateList[i];
                week2.Text = nextweekstart.ToString();
                week3.Text = nextweekstart.ToString();

                week2.DataBind();
                week3.DataBind();

                DateTime newStart = Convert.ToDateTime(week2.Text);
                DateTime newEnd = Convert.ToDateTime(week3.Text);

                string connectionString3 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection myConnection3 = new SqlConnection(connectionString);

                // myConnection.ConnectionString is now set to connectionString.
                myConnection3.Open();

                string query3 = "INSERT INTO SIS_EVENT (title, description, event_start, event_end, all_day, userID) OUTPUT INSERTED.eventID VALUES (@title2, @description2, @event_start2, @event_end2, @all_day2, @userID2)";

                SqlCommand myCommand3 = new SqlCommand(query3, myConnection3);

                //create a parameterised object

                myCommand3.Parameters.AddWithValue("@userID2", lectID);
                myCommand3.Parameters.AddWithValue("@title2", eventname);
                myCommand3.Parameters.AddWithValue("@description2", eventdesc);
                myCommand3.Parameters.AddWithValue("@event_start2", newStart);
                myCommand3.Parameters.AddWithValue("@event_end2", newEnd);
                myCommand3.Parameters.AddWithValue("@all_day2", "");

                //Executes query and takes the id of the newly inserted row
                newEventID = (Int32)myCommand3.ExecuteScalar();

                myConnection3.Close();

                done.Text = "Event Added";


                string connectionString4 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection myConnection4 = new SqlConnection(connectionString2);

                myConnection4.Open();


                string query4 = "INSERT INTO [SIS_EVENT_MODULE] (eventID, moduleID) VALUES (@newEventID2, @newModuleID2)";

                SqlCommand myCommand4 = new SqlCommand(query4, myConnection4);

                myCommand4.Parameters.AddWithValue("@newEventID2", newEventID);
                myCommand4.Parameters.AddWithValue("@newModuleID2", dropdownmodule);

                myCommand4.ExecuteNonQuery();

                myConnection4.Close();


            }
        }
           

        

        }

    }
    protected void Calendar1_DayRender(object sender, System.Web.UI.WebControls.DayRenderEventArgs e)
    {

        DateTime pastday = e.Day.Date;
        DateTime date = DateTime.Now;
        int year = date.Year;
        int month = date.Month;
        int day = date.Day;
        DateTime today = new DateTime(year, month, day);
        if (pastday.CompareTo(today) < 0)
        {
            e.Cell.BackColor = System.Drawing.Color.AliceBlue;
            e.Day.IsSelectable = false;
        }
        else
        {
            startDate.Text = Calendar1.SelectedDate.ToString("MM/dd/yyyy hh:mm:ss");

        }

    }

        protected void Calendar2_DayRender(object sender, System.Web.UI.WebControls.DayRenderEventArgs e)
    {
        DateTime pastday = e.Day.Date;
        DateTime date = DateTime.Now;
        int year = date.Year;
        int month = date.Month;
        int day = date.Day;
        DateTime today = new DateTime(year, month, day);
        if (pastday.CompareTo(today) < 0)
        {
            e.Cell.BackColor = System.Drawing.Color.AliceBlue;
            e.Day.IsSelectable = false;
        }
        else
        {
            endDate.Text = Calendar2.SelectedDate.ToString("MM/dd/yyyy hh:mm:ss");
        }

      
       
    }



    //When a module is selected find the ID + lecturer
        protected void DropDownModule_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Module ID from list:
            string modID = DropDownModule.SelectedValue;

            string connectionString5 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection5 = new SqlConnection(connectionString5);

            myConnection5.Open();

            string query5 = "SELECT * FROM SIS_MODULES WHERE moduleID=@selectedMod";

            SqlCommand myCommand5 = new SqlCommand(query5, myConnection5);

            myCommand5.Parameters.AddWithValue("@selectedMod", modID);

            SqlDataReader rdr = myCommand5.ExecuteReader();


            while (rdr.Read())
            {

                string lecturer = rdr["lecturerID"].ToString();
            

                SelectedLecturer.Text = lecturer;

            }

            rdr.Close();

            SelectedLecturer.DataBind();
            string lecturerID = SelectedLecturer.Text;

            string query6 = "SELECT * FROM SIS_LECTURER WHERE lecturerID=@lecturer";
            SqlCommand myCommand6 = new SqlCommand(query6, myConnection5);
            myCommand6.Parameters.AddWithValue("@lecturer", lecturerID);
            SqlDataReader rdr2 = myCommand6.ExecuteReader();

            while (rdr2.Read())
            {
                string user = rdr2["userID"].ToString();
                SelectedUser.Text = user;

            }

            rdr2.Close();

            SelectedUser.DataBind();

        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            if(Calendar1.Visible==false)
            {
                DateTime today = DateTime.Today;
                Calendar1.TodaysDate = today;
                Calendar1.SelectedDate = Calendar1.TodaysDate;
Calendar1.Visible = true;
startDate.Visible = true;
Calendar2.SelectedDate = Calendar1.TodaysDate;
Calendar2.Visible = true;
endDate.Visible = true;
            }
            else
            {
                Calendar1.Visible = false;
                Calendar2.Visible = false;
            }
            

            

        }
      
}
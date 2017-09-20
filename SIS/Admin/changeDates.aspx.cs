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
using System.Drawing;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //Rebecca - If no session exists, or if  not a Senior University Manager, redirect to default page.
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
            //Otherwise, store session in username field.
            string user = Session["user"].ToString();
            username.Text = user;
            username1.Text = user;

        }

        //DB Connection
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);
        myConnection.Open();

        //Find this years academic dates from database
        string query = "SELECT * FROM SIS_ACADEMICDATES WHERE dateID='4'";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        SqlDataReader rdr = myCommand.ExecuteReader();

        //Read database values, and store in hidden textboxes
        while (rdr.Read())
        {

            DateTime startD = Convert.ToDateTime(rdr["startDate"]);
            string sDate = startD.ToShortDateString();

            DateTime endD = Convert.ToDateTime(rdr["endDate"]);
            string eDate = endD.ToShortDateString();

            startLabel.Text = sDate;
            endLabel.Text = eDate;
 
        }

        rdr.Close();


    }

    //Update method occurs when save button clicked
    protected void newDatesButton_Click(object sender, EventArgs e)
    {
        //create connection to database
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        // myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        //Getting start and end dates user chose from the Calendars
        DateTime start = startCal.SelectedDate;
        DateTime end = endCal.SelectedDate;
        //Setting null value (to prevent null dates being entered)
        DateTime test = new DateTime(0001,01,01,0,0,0);

        //If end is null, and start isn't, update the start date in database:
        if (end == test && start != test)
        {
            //Updating date in database
            string query1 = "UPDATE SIS_ACADEMICDATES SET startDate = @start";
            SqlCommand myCommand1 = new SqlCommand(query1, myConnection);
            myCommand1.Parameters.AddWithValue("@start", start);

            //running update
            myCommand1.ExecuteNonQuery();
            myConnection.Close();

            //notifying user
            complete.Text = "Academic Start Date Updated";
            DateList.DataBind();

            //reloading page
            Response.Redirect("changeDates.aspx");

        }
        //If start is null, and end isn't, update the end date in database:
        else if (start == test && end != test)
        {
            //Updating end date in db
            string query2 = "UPDATE SIS_ACADEMICDATES SET endDate = @end";

            SqlCommand myCommand2 = new SqlCommand(query2, myConnection);

            myCommand2.Parameters.AddWithValue("@end", end);

            //running update
            myCommand2.ExecuteNonQuery();
            myConnection.Close();
            //notifying user
            complete.Text = "Academic End Date Updated";
            DateList.DataBind();
            //reloading page
            Response.Redirect("changeDates.aspx");
        }
        //If neither dates are null, update the start & end date in database:
        else if (end != test && start != test)
        {
            //Updating both dates in db
            string query = "UPDATE SIS_ACADEMICDATES SET startDate = @start, endDate = @end";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@start", start);
            myCommand.Parameters.AddWithValue("@end", end);

            //running update
            myCommand.ExecuteNonQuery();
            myConnection.Close();
            //notifying update
            complete.Text = "Academic Dates Updated";
            DateList.DataBind();
            //reloading page
            Response.Redirect("changeDates.aspx");
        }
        //If end & start are null, notifies user that no dates were chosen
        else if (end == test && start == test)
            complete.Text = "No Dates were chosen";

    }
}
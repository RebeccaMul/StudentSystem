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

        //If the page isn't posted back
        if (!IsPostBack)
        {
            //Getting event Id from url
            string chosenEvent = Request.QueryString["eventID"];
            
            //DB connection
            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);
            myConnection.Open();

            //Get event details
            string query = "SELECT * FROM SIS_EVENT WHERE eventID=@event";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@event", chosenEvent);

            SqlDataReader rdr = myCommand.ExecuteReader();

            //Read event details from database into textboxes, for editing
            while (rdr.Read())
            {

                string title = rdr["title"].ToString();
                string desc = rdr["description"].ToString();
                string eventS = rdr["event_start"].ToString();
                string eventE = rdr["event_end"].ToString();
                bool allday = Convert.ToBoolean(rdr["all_day"]);

                DateTime dt = DateTime.ParseExact(eventS, "dd/MM/yyyy HH:mm:ss", System.Globalization.CultureInfo.InvariantCulture);

                string newStart = dt.ToString("MM/dd/yyyy HH:mm:ss");


                DateTime dt2 = DateTime.ParseExact(eventE, "dd/MM/yyyy HH:mm:ss", System.Globalization.CultureInfo.InvariantCulture);

                string newEnd = dt2.ToString("MM/dd/yyyy HH:mm:ss");

             
                startLabel.Text = newStart;
                descLabel.Text = desc;
                endLabel.Text = newEnd;
                titleLabel.Text = title;
                dayBox.Checked = allday;

            }

            rdr.Close();
        }


    }

    //Method is called when save button is clicked - updates event with new details
    protected void editButton_Click(object sender, EventArgs e)
    {
        //create connection to database
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);
          myConnection.Open();

        //Requesting eventID
        string chosenEvent = Request.QueryString["eventID"];

        //Refreshing event detail textboxes (ensures they are up to date)
        titleLabel.DataBind();
        descLabel.DataBind();
        endLabel.DataBind();
        startLabel.DataBind();
        dayBox.DataBind();

        //Stores event details in strings for query
        string start = startLabel.Text;
        
        //DateTime dt = DateTime.ParseExact(start, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
      
        //string newStart = dt.ToString("MM/dd/yyyy");
        //string newFormat = DateTime.ParseExact(start, "dd'/'MM'/'yyyy", null).ToString("MM'/'dd'/'yyyy");

        string desc = descLabel.Text;
        string end = endLabel.Text;
        //string newFormatend = DateTime.ParseExact(end, "dd'/'MM'/'yyyy", null).ToString("MM'/'dd'/'yyyy");
     //  DateTime dt2 = DateTime.ParseExact(end, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
      
       // string newEnd = dt2.ToString("MM/dd/yyyy");
        //string newFormat = DateTime.ParseExact(start, "dd'/'MM'/'yyyy", null).ToString("MM'/'dd'/'yyyy");

        string title = titleLabel.Text;
        string day = dayBox.Checked.ToString();

       // string starttime = DropDownListStartTime.SelectedValue;
        //string startDate = start + ' ' + starttime;
        //DateTime startfinal = Convert.ToDateTime(startDate);

       // string endtime = DropDownListendtime.SelectedValue;
        //string finalendDate = end + ' ' + endtime;
        //DateTime endfinal = Convert.ToDateTime(finalendDate);

        //TextBox1.Text = startfinal.ToString();

       // TextBox2.Text = finalendDate.ToString();

        //string begin = TextBox1.Text;
       // string last = TextBox2.Text;
        
        //Update to DB to change event details
            string query = "UPDATE SIS_EVENT SET title=@title, description=@description, event_start = @start, event_end=@end, all_day=@day WHERE eventID=@event";

            SqlCommand myCommand = new SqlCommand(query, myConnection);
        
            myCommand.Parameters.AddWithValue("@start", start);
            myCommand.Parameters.AddWithValue("@description", desc);
            myCommand.Parameters.AddWithValue("@title", title);
            myCommand.Parameters.AddWithValue("@end", end);
            myCommand.Parameters.AddWithValue("@day", day);
            myCommand.Parameters.AddWithValue("@event", chosenEvent);

        //running update
            myCommand.ExecuteNonQuery();
            myConnection.Close();

        //notifies user
            complete.Text = "Event Updated";
            
        //reloads page
            Response.Redirect("Timetable_Edit.aspx");
        
    }
}
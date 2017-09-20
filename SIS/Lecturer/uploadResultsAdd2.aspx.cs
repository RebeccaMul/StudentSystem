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

public partial class Lecturer_uploadresults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {



            if (Session["user"] == null || (Convert.ToInt32(Session["typeID"]) != 6))//deny users with no access
            {
                Response.Redirect("../default.aspx");
            }
            else
            {
                string usern = Session["user"].ToString();//allow users with access

                username.Text = usern;
                username1.Text = usern;
            }


        }
        string percent =  Request.QueryString["percent"];
        int moduleid = Convert.ToInt32(Request.QueryString["moduleid"]);
        int lecturerID = Convert.ToInt32(Request.QueryString["lecturerID"]);
        int assignment = Convert.ToInt32(Request.QueryString["assignmentID"]);
        int student = Convert.ToInt32(Request.QueryString["studentID"]);

        markvalue.Text = percent.ToString();



        //Second Db Connection:
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;//connection to db

        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();//open connection to db

        //insert query
        string query = "UPDATE SIS_RESULTS SET percentage = @percentage WHERE assignmentID = @assignmentID AND studentID = @student";

        //assigning parameters
        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@percentage", percent);
        myCommand.Parameters.AddWithValue("@assignmentID", assignment);
        myCommand.Parameters.AddWithValue("@student", student);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

       Response.Redirect("uploadresults.aspx?moduleid=" + moduleid + "&lecturerID=" + lecturerID);
    



        }
    }

    

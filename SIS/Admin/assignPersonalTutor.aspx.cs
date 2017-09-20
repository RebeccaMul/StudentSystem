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

public partial class Admin_assignPersonalTutor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null || (Convert.ToInt32(Session["typeID"]) != 1))
        {
            Response.Redirect("../Default.aspx");

        }
        else
        {

            string user = Session["user"].ToString();
            username.Text = user;
            username1.Text = user;

        }

    }

    protected void assignTutorBtn_Click(object sender, EventArgs e)
    {


          string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
          SqlConnection myConnection = new SqlConnection(connectionString);

      //   myConnection.ConnectionString is now set to connectionString.

          myConnection.Open();

        //request student id, tutorId and selected value
         int row = int.Parse(Request.QueryString["studentID"]);
         int tutorOptions = Convert.ToInt32(tutor.SelectedValue);
         int row1 = int.Parse(Request.QueryString["tutorID"]);

        

        
           string query = "UPDATE SIS_STUDENT SET tutorID=@tutorID WHERE studentID=@studentID";



           SqlCommand myCommand = new SqlCommand(query, myConnection);

           myCommand.Parameters.AddWithValue("@studentID", row);
           myCommand.Parameters.AddWithValue("@tutorID", tutorOptions);
         





          myCommand.ExecuteNonQuery();
          myConnection.Close();



         addLabel.Text = "Personal Tutor has been assigned";

        }
    //enables the Admin to go back to previous page when clicked
    protected void backBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("viewStudents.aspx");
    }
}


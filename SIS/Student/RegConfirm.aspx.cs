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

public partial class Student_RegConfirm : System.Web.UI.Page
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

        }

        //Requesting student information from URL
        int sID = Convert.ToInt32(Request.QueryString["studentID"]);
        int uID = Convert.ToInt32(Request.QueryString["userID"]);
        int units = Convert.ToInt32(Request.QueryString["units"]);
        int level = Convert.ToInt32(Request.QueryString["level"]);

        //If insufficent units, alert the user & redirect back to the wizard
        if (units != 120)
        {
            Response.Write("<script>alert('You have not enrolled in enough modules, please ensure you have acquired 120 units.');</script>");

            Response.Redirect("RegWizard.aspx?UserID=" + uID + "&studentID=" + sID + "&level=" + level);
        }
        else if (units == 120)
        {
            //RMU - Connection to database
            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);
            myConnection.Open();

            //Setting enrolled value to true:
            int enrol = 1;

            //RMU - Update setting student to enrolled: 
            string query = "UPDATE SIS_STUDENT SET enrolled = @enrol WHERE studentID = @ID";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@enrol", enrol);
            myCommand.Parameters.AddWithValue("@ID", sID);

            //Running update:
            myCommand.ExecuteNonQuery();
            myConnection.Close();

        }



    }

}


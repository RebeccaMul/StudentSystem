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

public partial class Student_RegWizardUpdate : System.Web.UI.Page
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

            //RMU - Getting userID from URL:
            string Fname = Request.QueryString["Fname"];
            string Lname = Request.QueryString["Lname"];
            string Newadd = Request.QueryString["Address"];
            string Newcont = Request.QueryString["Contact"];
            string userID = Request.QueryString["UserID"];
            string level = Request.QueryString["Level"];
            string student = Request.QueryString["StudentID"];


            //RMU - SQL Update Query
            string query = "UPDATE SIS_STUDENT SET firstName = @newname, lastName = @newLname, address = @newAddress, contactNumber = @newNum WHERE userID = @ID";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@newname", Fname);
            myCommand.Parameters.AddWithValue("@newLname", Lname);
            myCommand.Parameters.AddWithValue("@newAddress", Newadd);
            myCommand.Parameters.AddWithValue("@newNum", Newcont);
            myCommand.Parameters.AddWithValue("@ID", userID);

            myCommand.ExecuteNonQuery();

            myConnection.Close();

            //RMU- redirect query
            Response.Redirect("RegWizard.aspx?userid=" + userID + "&Level=" + level + "&StudentID=" + student);




        }


    }
}
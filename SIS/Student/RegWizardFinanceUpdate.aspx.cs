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

public partial class Student_RegWizardFinanceUpdate : System.Web.UI.Page
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
            string Other = Request.QueryString["Other"];
            string SFNI = Request.QueryString["SFNI"];
            string OtherMethod = Request.QueryString["OtherMethod"];
            int uID = Convert.ToInt32(Request.QueryString["userID"]);
            int sID = Convert.ToInt32(Request.QueryString["studentID"]);

            //RMU - SQL Update Query
            string query = "UPDATE SIS_FINANCE SET SFNI = @newSFNI, otherPaymentMethod = @newMethod, other = @newOther WHERE studentID = @ID";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@newOther", Other);
            myCommand.Parameters.AddWithValue("@newSFNI", SFNI);
            myCommand.Parameters.AddWithValue("@newMethod", OtherMethod);
            myCommand.Parameters.AddWithValue("@ID", sID);

            myCommand.ExecuteNonQuery();

            myConnection.Close();

            string level = Request.QueryString["Level"];
            string student = Request.QueryString["StudentID"];

            //RMU- redirect query
            Response.Redirect("RegWizard.aspx?userid=" + uID + "&studentID=" + student + "&Level=" + level);




        }


    }
}
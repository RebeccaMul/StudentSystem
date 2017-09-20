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

public partial class Student_RegWizardEdit : System.Web.UI.Page
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
           
        }

        //It is not a postback / on page load / do not perfrm when save button pressed
        if (!IsPostBack)
        {


            //Getting userID from URL
            int userID = Convert.ToInt32(Request.QueryString["userID"]);

            //RMU - DB Connection:
            string connectionString = WebConfigurationManager.ConnectionStrings
                ["dbconnect"].ConnectionString;

            SqlConnection myConnection = new SqlConnection(connectionString);

            myConnection.Open();

            string query = "SELECT * FROM SIS_STUDENT WHERE userID=@Id";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@Id", userID);

            SqlDataReader rdr = myCommand.ExecuteReader();

            while (rdr.Read())
            {
                string firstname = rdr["firstName"].ToString();
                first.Text = firstname;
                string lastname = rdr["lastName"].ToString();
                last.Text = lastname;
                string add = rdr["address"].ToString();
                Addbox.Text = add;
                string cont = rdr["contactNumber"].ToString();
                Contbox.Text = cont;
            }
        }
    }


    protected void EditBtn_Click(object sender, EventArgs e)
    {

        string Fname = first.Text;
        string Lname = last.Text;
        string Newadd = Addbox.Text;
        string Newcont = Contbox.Text;
        string level = Request.QueryString["Level"];
        string student = Request.QueryString["StudentID"];

        int row = int.Parse(Request.QueryString["UserID"]);

        //RMU - Redirect back to Reg Wizard with new updated details
        Response.Redirect("RegWizardUpdate.aspx?Fname=" + Fname + "&Lname=" + Lname + "&Address=" + Newadd + "&Contact=" + Newcont + "&UserID=" + row + "&StudentID=" + student + "&Level=" + level);
    }
}
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

public partial class SIS2_Lecturer_academicRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //If not logged in, or user is not a student, redirect to default page
        if (Session["user"] == null || (Convert.ToInt32(Session["typeID"]) != 6))
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

                 if (!IsPostBack)
        {

            int row = 0;
            if (Request.QueryString["studentID"] != null)
            {
                row = int.Parse(Request.QueryString["studentID"]);
               
            }
            else
            {
                Response.Redirect("Student.aspx");


            }

            //set-up object to use the web.config file


            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            myConnection.Open();

            string query = "SELECT * FROM SIS_STUDENT INNER JOIN SIS_USER ON SIS_STUDENT.userID = SIS_USER.userID INNER JOIN SIS_ADVISOR ON SIS_ADVISOR.advisorID = SIS_STUDENT.advisorID INNER JOIN SIS_LECTURER ON SIS_LECTURER.lecturerID = SIS_STUDENT.tutorID WHERE studentID=@rowid";

            SqlCommand myCommand = new SqlCommand(query, myConnection);



            myCommand.Parameters.AddWithValue("@rowid", row);

            SqlDataReader rdr = myCommand.ExecuteReader();


            //RME - Entering data into textboxes from DB
                    
            while (rdr.Read())
            {
                string sstudentNumber = rdr["studentNo"].ToString();
                string sfirstName = rdr["firstName"].ToString();
                string slastName = rdr["lastName"].ToString();
                string shomeaddress = rdr["address"].ToString();
                string stermaddress = rdr["termAddress"].ToString();
                string scontactNumber = rdr["contactNumber"].ToString();
                string semail = rdr["Email"].ToString();


                studentNum.Text = sstudentNumber;
                fname.Text = sfirstName;
                lname.Text = slastName;
                homeAddress.Text = shomeaddress;
                termAddress.Text = stermaddress;
                email.Text = semail;
                contactNumber.Text = scontactNumber;
                
         
            }

        }       
    }
}
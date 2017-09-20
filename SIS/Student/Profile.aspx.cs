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

public partial class Student_Profile : System.Web.UI.Page
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
        if (!IsPostBack)
        {

            int row = Convert.ToInt32(Session["userID"]);


            //set-up object to use the web.config file


            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            myConnection.Open();

            string query = "SELECT * FROM SIS_STUDENT INNER JOIN SIS_USER ON SIS_STUDENT.userID = SIS_USER.userID INNER JOIN SIS_LECTURER ON SIS_LECTURER.lecturerID = SIS_STUDENT.tutorID INNER JOIN SIS_ADVISOR ON SIS_ADVISOR.advisorID = SIS_STUDENT.advisorID WHERE SIS_STUDENT.userID=@rowid";




            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@rowid", row);

            SqlDataReader rdr = myCommand.ExecuteReader();


            while (rdr.Read())
            {
                //Student Details from SIS_Student
                string sstudentNumber = rdr["studentNo"].ToString();
                string sfirstName = rdr["firstName"].ToString();
                string slastName = rdr["lastName"].ToString();
                string shomeAddress = rdr["address"].ToString();
                string stermAddress = rdr["termAddress"].ToString();
                string scontactNumber = rdr["contactNumber"].ToString();
                string sKinFirstName = rdr["kinFirstName"].ToString();
                string sKinLastName = rdr["kinLastName"].ToString();
                string sKinAddress = rdr["kinAddress"].ToString();
                string skinNumber = rdr["kinContactNumber"].ToString();

                string sEmail = rdr["Email"].ToString();

                string sSchool = rdr["school"].ToString();
                string sCourse = rdr["course"].ToString();
                string sLevel = rdr["level"].ToString();

                string sAdvisor = rdr["advisorID"].ToString();
                string sTutor = rdr["lecturerID"].ToString();

                //Student Details from SIS_User
            
                studentNumber.Text = sstudentNumber;
                emailText.Text = sEmail;

                fnameText.Text = sfirstName;
                lnameText.Text = slastName;
                homeaddressText.Text = shomeAddress;
                termaddressText.Text = stermAddress;
                contactnumberText.Text = scontactNumber;

                kinFirstNameText.Text = sKinFirstName;
                kinLastNameText.Text = sKinLastName;
                kinAddressText.Text = sKinAddress;
                kinContactText.Text = skinNumber;


                schoolText.Text = sSchool;
                courseText.Text = sCourse;
                levelText.Text = sLevel;

                advisorList.Text = sAdvisor;
                tutorList.Text = sTutor;
            }
        }
    }


    protected void saveBtn_Click(object sender, EventArgs e)
    {
        //ET - User ability to search for image.
        string UpPath = Server.MapPath("~/files");

        Random r = new Random();
        int rInt = r.Next(0, 10000);

        if (!Directory.Exists(UpPath))
        {
            Directory.CreateDirectory(UpPath);
            myinfo.Text = UpPath + " folder files does not exist";
        }
        else
        {
            int imgSize = myimage.PostedFile.ContentLength;
            string imgName = myimage.FileName;
            string imgPath = "~/files/" + rInt + imgName;

            if (myimage.PostedFile.ContentLength > 1500000)
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('File is too big.')",

true);
            }
            else
            {

                myimage.SaveAs(Server.MapPath(imgPath));

            }

           

            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            // myConnection.ConnectionString is now set to connectionString.
            myConnection.Open();

            string sfirstNameUpdate = fnameText.Text;
            string slastNameUpdate = lnameText.Text;
            string shomeAddressUpdate = homeaddressText.Text;
            string stermAddressUpdate = termaddressText.Text;
            string sEmailUpdate = emailText.Text;
            string scontactNumberUpdate = contactnumberText.Text;
            string skinNumberUpdate = kinContactText.Text;
            string img = rInt + myimage.FileName;

            string sKinFirstNameUpdate = kinFirstNameText.Text;
            string sKinLastNameUpdate = kinLastNameText.Text;
            string sKinAddressUpdate = kinAddressText.Text;


            //ET - If no image selected do not update image, Else directed to next query with image update.

            if (img == rInt.ToString())
            {
                int row = Convert.ToInt32(Session["userID"]);
                string query = "UPDATE SIS_STUDENT SET firstName = @newfirstName, lastName = @newlastName, address = @newhomeaddress, termAddress = @newtermaddress, contactNumber = @newcontactNumber, kinFirstName = @kinfirstname, kinLastName = @kinlastname, kinAddress = @kinaddress, kinContactNumber = @newkincontactNumber WHERE userID = @id";

                SqlCommand myCommand = new SqlCommand(query, myConnection);

                myCommand.Parameters.AddWithValue("@newfirstname", sfirstNameUpdate);
                myCommand.Parameters.AddWithValue("@newlastname", slastNameUpdate);
                myCommand.Parameters.AddWithValue("@newhomeaddress", shomeAddressUpdate);
                myCommand.Parameters.AddWithValue("@newtermaddress", stermAddressUpdate);
                myCommand.Parameters.AddWithValue("@newemailaddress", sEmailUpdate);
                myCommand.Parameters.AddWithValue("@newcontactnumber", scontactNumberUpdate);

                myCommand.Parameters.AddWithValue("@kinfirstname", sKinFirstNameUpdate);
                myCommand.Parameters.AddWithValue("@kinlastname", sKinLastNameUpdate);
                myCommand.Parameters.AddWithValue("@kinaddress", sKinAddressUpdate);
                myCommand.Parameters.AddWithValue("@newkincontactNumber", skinNumberUpdate);
                myCommand.Parameters.AddWithValue("@id", row);

                myCommand.ExecuteNonQuery();

                myConnection.Close();

            }

            else
            {
                int row = Convert.ToInt32(Session["userID"]);
                string queryImage = "UPDATE SIS_STUDENT SET firstName = @newfirstName, lastName = @newlastName, address = @newhomeaddress, termAddress = @newtermaddress, contactNumber = @newcontactNumber, kinFirstName = @kinfirstname, kinLastName = @kinlastname, kinAddress = @kinaddress, kinContactNumber = @newkincontactNumber, imagepath = @newimagepath WHERE userID = @id";

                SqlCommand myCommand = new SqlCommand(queryImage, myConnection);

                myCommand.Parameters.AddWithValue("@newfirstname", sfirstNameUpdate);
                myCommand.Parameters.AddWithValue("@newlastname", slastNameUpdate);
                myCommand.Parameters.AddWithValue("@newhomeaddress", shomeAddressUpdate);
                myCommand.Parameters.AddWithValue("@newtermaddress", stermAddressUpdate);
                myCommand.Parameters.AddWithValue("@newemailaddress", sEmailUpdate);
                myCommand.Parameters.AddWithValue("@newcontactnumber", scontactNumberUpdate);

                myCommand.Parameters.AddWithValue("@kinfirstname", sKinFirstNameUpdate);
                myCommand.Parameters.AddWithValue("@kinlastname", sKinLastNameUpdate);
                myCommand.Parameters.AddWithValue("@kinaddress", sKinAddressUpdate);
                myCommand.Parameters.AddWithValue("@newkincontactNumber", skinNumberUpdate);
                myCommand.Parameters.AddWithValue("@newimagepath", img);
                myCommand.Parameters.AddWithValue("@id", row);
                myCommand.ExecuteNonQuery();

                myConnection.Close();

            }
            displaySaved.Text = "The changes that have been made are now saved to the database.";
            
        }
    }
}

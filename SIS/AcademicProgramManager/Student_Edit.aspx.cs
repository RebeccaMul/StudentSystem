using System;
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

public partial class AcademicProgramManager_Student_Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("../Default.aspx");

        }
        else if ((Convert.ToInt32(Session["typeID"]) != 4))
        {
            Response.Redirect("../Default.aspx");
        }
        else
        {

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


            while (rdr.Read())
            {
                string sstudentNumber = rdr["studentNo"].ToString();
                string sfirstName = rdr["firstName"].ToString();
                string slastName = rdr["lastName"].ToString();
                string shomeaddress = rdr["address"].ToString();
                string stermaddress = rdr["termAddress"].ToString();
                string scontactNumber = rdr["contactNumber"].ToString();
                string semail = rdr["Email"].ToString();
                string scourse = rdr["course"].ToString();
                string slevel = rdr["level"].ToString();
                string senrolled = rdr["enrolled"].ToString();
                string sdropOut = rdr["droppedout"].ToString();
                string sKinFirstName = rdr["kinFirstName"].ToString();
                string sKinLastName = rdr["kinLastName"].ToString();
                string sKinAddress = rdr["kinAddress"].ToString();
                string skinNumber = rdr["kinContactNumber"].ToString();

                string sSchool = rdr["school"].ToString();
                string sCourse = rdr["course"].ToString();
                string sLevel = rdr["level"].ToString();

               string sAdvisor = rdr["advisorID"].ToString();
                string sTutor = rdr["lecturerID"].ToString();

                studentNumber.Text = sstudentNumber;
                emailText.Text = semail;
                fnameText.Text = sfirstName;
                lnameText.Text = slastName;
                homeaddressText.Text = shomeaddress;
                termaddressText.Text = stermaddress;
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

            string sstudentnumberupdate = studentNumber.Text;
            string sfirstNameUpdate = fnameText.Text;
            string slastNameUpdate = lnameText.Text;
            string saddressUpdate = homeaddressText.Text;
            string stermaddressUpdate = termaddressText.Text;
            string scontactNumberUpdate = contactnumberText.Text;
            string img = rInt + myimage.FileName;


            string skinNumberUpdate = kinContactText.Text;
            string sKinFirstNameUpdate = kinFirstNameText.Text;
            string sKinLastNameUpdate = kinLastNameText.Text;
            string sKinAddressUpdate = kinAddressText.Text;

            
            string sSchoolUpdate = schoolText.Text;
            string sCourseUpdate = courseText.Text;
            string sLevelUpdate = levelText.Text;

            

            string sadvisorUpdate = advisorList.SelectedValue;
            int advisorIDUpdate = Convert.ToInt32(sadvisorUpdate);

            string stutorUpdate = tutorList.SelectedValue;
            int tutorID = Convert.ToInt32(stutorUpdate);

            if (img == rInt.ToString())
            {


                int row = Convert.ToInt32(Request.QueryString["studentID"]);
                string query = "UPDATE SIS_STUDENT SET studentNo = @newstudentNo, firstName = @newfirstName, lastName = @newlastName, address = @newaddress,  @newtermaddress = termAddress,contactNumber = @newcontactNumber, kinFirstName = @kinfirstname, kinLastName = @kinlastname, kinAddress = @kinaddress, kinContactNumber = @newkincontactNumber, school = @newschool, course = @newcourse, level = @newlevel, advisorID = @newadvisor, tutorID = @newtutor WHERE studentID = @id";


                SqlCommand myCommand = new SqlCommand(query, myConnection);

                myCommand.Parameters.AddWithValue("@newstudentNo", sstudentnumberupdate); 
                myCommand.Parameters.AddWithValue("@newfirstname", sfirstNameUpdate);
                myCommand.Parameters.AddWithValue("@newlastname", slastNameUpdate);
                myCommand.Parameters.AddWithValue("@newaddress", saddressUpdate);
                myCommand.Parameters.AddWithValue("@newtermaddress", stermaddressUpdate);
                myCommand.Parameters.AddWithValue("@newcontactNumber", scontactNumberUpdate);

                myCommand.Parameters.AddWithValue("@kinfirstname", sKinFirstNameUpdate);
                myCommand.Parameters.AddWithValue("@kinlastname", sKinLastNameUpdate);
                myCommand.Parameters.AddWithValue("@kinaddress", sKinAddressUpdate);
                myCommand.Parameters.AddWithValue("@newkincontactNumber", skinNumberUpdate);

                myCommand.Parameters.AddWithValue("@newschool", sSchoolUpdate);
                myCommand.Parameters.AddWithValue("@newcourse", sCourseUpdate);
                myCommand.Parameters.AddWithValue("@newlevel", sLevelUpdate);

                myCommand.Parameters.AddWithValue("@newadvisor", sadvisorUpdate);
                myCommand.Parameters.AddWithValue("@newtutor", stutorUpdate);

                myCommand.Parameters.AddWithValue("@id", row);


                myCommand.ExecuteNonQuery();

                myConnection.Close();


                string connectionString2 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection myConnection2 = new SqlConnection(connectionString);

                // myConnection.ConnectionString is now set to connectionString.
                myConnection2.Open();

                string semailUpdate = emailText.Text;


                int row2 = Convert.ToInt32(Request.QueryString["userID"]);
                string query2 = "UPDATE SIS_USER SET Email = @newemail WHERE userID = @id";

                SqlCommand myCommand2 = new SqlCommand(query2, myConnection2);
                myCommand2.Parameters.AddWithValue("@newemail", semailUpdate);

                myCommand2.Parameters.AddWithValue("@id", row2);
                myCommand2.ExecuteNonQuery();

                myConnection2.Close();
                displayLabel.Text = "The changes that have been made are now saved to the database.";

            }
            else
            {
                int row = Convert.ToInt32(Request.QueryString["studentID"]);
                string queryImage = "UPDATE SIS_STUDENT SET studentNo = @newstudentNo, firstName = @newfirstName, lastName = @newlastName, address = @newaddress,  @newtermaddress = termAddress, contactNumber = @newcontactNumber, kinFirstName = @kinfirstname, kinLastName = @kinlastname, kinAddress = @kinaddress, kinContactNumber = @newkincontactNumber, school = @newschool, course = @newcourse, level = @newlevel, imagepath = @newimage WHERE studentID = @id";


                SqlCommand myCommand = new SqlCommand(queryImage, myConnection);

                myCommand.Parameters.AddWithValue("@newstudentNo", sstudentnumberupdate); 
                myCommand.Parameters.AddWithValue("@newfirstname", sfirstNameUpdate);
                myCommand.Parameters.AddWithValue("@newlastname", slastNameUpdate);
                myCommand.Parameters.AddWithValue("@newaddress", saddressUpdate);
                myCommand.Parameters.AddWithValue("@newtermaddress", stermaddressUpdate);
                myCommand.Parameters.AddWithValue("@newcontactNumber", scontactNumberUpdate);
                myCommand.Parameters.AddWithValue("@newimage", img);

                myCommand.Parameters.AddWithValue("@kinfirstname", sKinFirstNameUpdate);
                myCommand.Parameters.AddWithValue("@kinlastname", sKinLastNameUpdate);
                myCommand.Parameters.AddWithValue("@kinaddress", sKinAddressUpdate);
                myCommand.Parameters.AddWithValue("@newkincontactNumber", skinNumberUpdate);

                myCommand.Parameters.AddWithValue("@newschool", sSchoolUpdate);
                myCommand.Parameters.AddWithValue("@newcourse", sCourseUpdate);
                myCommand.Parameters.AddWithValue("@newlevel", sLevelUpdate);
                myCommand.Parameters.AddWithValue("@newadvisor", sadvisorUpdate);
                myCommand.Parameters.AddWithValue("@newtutor", stutorUpdate);

                myCommand.Parameters.AddWithValue("@id", row);

                myCommand.ExecuteNonQuery();

                myConnection.Close();


                string connectionString2 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection myConnection2 = new SqlConnection(connectionString);

                // myConnection.ConnectionString is now set to connectionString.
                myConnection2.Open();

                string semailUpdate = emailText.Text;


                int row2 = Convert.ToInt32(Request.QueryString["userID"]);
                string query2 = "UPDATE SIS_USER SET Email = @newemail WHERE userID = @id";

                SqlCommand myCommand2 = new SqlCommand(query2, myConnection2);
                myCommand2.Parameters.AddWithValue("@newemail", semailUpdate);

                myCommand2.Parameters.AddWithValue("@id", row2);
                myCommand2.ExecuteNonQuery();

                myConnection2.Close();
                displayLabel.Text = "The changes that have been made are now saved to the database.";

            }
        }
    }

    protected void cancelBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Student_Edit.aspx");
    }


}





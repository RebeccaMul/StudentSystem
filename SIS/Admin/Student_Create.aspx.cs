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


public partial class Admin_Student_Create : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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

            string user = Session["user"].ToString();
            username.Text = user;
            username1.Text = user;

        }
    }

    protected void createBtn_Click(object sender, EventArgs e)
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



            //Inserting into user
            string sPassword = passwordText.Text;
            string sEmail = emailText.Text;
            int typeID = 5;

            string img = rInt + myimage.FileName;

            //Inserting into student
            string sStudentNo = studentNoText.Text;
            string sFirstName = fnameText.Text;
            string sLastName = lnameText.Text;
            string sStudentEmail = emailText.Text;
            string sHomeAddress = homeaddressText.Text;
            string sTermAddress = termaddressText.Text;
            string sContactNumber = contactnumberText.Text;


            //Kin Details
            string skinFirstName = kinFirstNameText.Text;
            string skinLastName = kinLastNameText.Text;
            string skinAddress = kinAddressText.Text;
            string sKinNumber = kinContactnoBox.Text;

            //Academics
            string sSchool = schoolBox.Text;
            string sCourse = courseBox.Text;
            string sLevel = levelBox.Text;

            int sFalse = 0;


            string advisor = advisorList.SelectedValue;
            int advisorID = Convert.ToInt32(advisor);

            string tutor = tutorList.SelectedValue;
            int tutorID = Convert.ToInt32(tutor);


            if (img == rInt.ToString())
            {
                string query = "INSERT INTO [SIS_USER] (username, typeID, password, email, sNumber) OUTPUT INSERTED.userID VALUES (@username, @typeID, @password, @email, @sNumber)";


                SqlCommand myCommand = new SqlCommand(query, myConnection);

                myCommand.Parameters.AddWithValue("@username", sStudentNo);
                myCommand.Parameters.AddWithValue("@typeID", typeID);
                myCommand.Parameters.AddWithValue("@password", sPassword);
                myCommand.Parameters.AddWithValue("@email", sEmail);
                myCommand.Parameters.AddWithValue("@sNumber", sStudentNo);


                Int32 newId = (Int32)myCommand.ExecuteScalar();
                myConnection.Close();

                string connectionString2 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection myConnection2 = new SqlConnection(connectionString2);

                // myConnection.ConnectionString is now set to connectionString.
                myConnection2.Open();





                string query2 = "INSERT INTO [SIS_STUDENT] (userID, firstName, lastName, address, termAddress, contactNumber, kinFirstName, kinLastName, kinAddress, kinContactNumber, school, course, level, enrolled, droppedout, L1Complete, L2Complete, PlacementComplete, L3Complete, studentNo, advisorID, tutorID) OUTPUT INSERTED.studentID VALUES (@userID, @firstname, @lastname, @address, @termAddress, @contactNumber, @kinFirstName, @kinLastName, @kinAddress, @kinContactNumber, @school,  @course, @level, @enrolled, @droppedout, @L1Complete, @L2Complete, @placementComplete, @L3Complete,  @studentNumber, @advisor, @tutor)";



                SqlCommand myCommand2 = new SqlCommand(query2, myConnection2);

                myCommand2.Parameters.AddWithValue("@userID", newId);
                myCommand2.Parameters.AddWithValue("@firstname", sFirstName);
                myCommand2.Parameters.AddWithValue("@lastname", sLastName);
                myCommand2.Parameters.AddWithValue("@address", sHomeAddress);
                myCommand2.Parameters.AddWithValue("@termAddress", sTermAddress);
                myCommand2.Parameters.AddWithValue("@contactNumber", sContactNumber);
                myCommand2.Parameters.AddWithValue("@kinFirstName", skinFirstName);
                myCommand2.Parameters.AddWithValue("@kinLastName", skinLastName);
                myCommand2.Parameters.AddWithValue("@kinAddress", skinAddress);
                myCommand2.Parameters.AddWithValue("@kinContactNumber", sKinNumber);
                myCommand2.Parameters.AddWithValue("@course", sCourse);
                myCommand2.Parameters.AddWithValue("@level", sLevel);
                myCommand2.Parameters.AddWithValue("@school", sSchool);
                myCommand2.Parameters.AddWithValue("@enrolled", sFalse);
                myCommand2.Parameters.AddWithValue("@droppedout", sFalse);
                myCommand2.Parameters.AddWithValue("@L1Complete", sFalse);
                myCommand2.Parameters.AddWithValue("@L2Complete", sFalse);
                myCommand2.Parameters.AddWithValue("@placementComplete", sFalse);
                myCommand2.Parameters.AddWithValue("@L3Complete", sFalse);
                myCommand2.Parameters.AddWithValue("@studentNumber", sStudentNo);

                myCommand2.Parameters.AddWithValue("@advisor", advisorID);
                myCommand2.Parameters.AddWithValue("@tutor", tutorID);

                Int32 newStudentId = (Int32)myCommand2.ExecuteScalar();
                myConnection2.Close();

                string sFeesOutstanding = "9000";
                string sAmountPaid = "0";
                int sSFNI = 0;
                int sOtherPaymentMethod = 0;
                string sOther = "N/A";
                int sFinanceComplete = 0;


                string connectionString3 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection myConnection3 = new SqlConnection(connectionString3);
                myConnection3.Open();

                string query3 = "INSERT INTO SIS_FINANCE (feesOutstanding, amountPaid, studentID, SFNI, otherPaymentMethod, other, financeComplete) VALUES (@FeesOutstanding, @AmountPaid, @newStudentId, @SFNI, @OtherPaymentMethod, @other, @FinanceComplete)";

                SqlCommand myCommand3 = new SqlCommand(query3, myConnection3);
                myCommand3.Parameters.AddWithValue("@FeesOutstanding", sFeesOutstanding);
                myCommand3.Parameters.AddWithValue("@AmountPaid", sAmountPaid);
                myCommand3.Parameters.AddWithValue("@newStudentId", newStudentId);
                myCommand3.Parameters.AddWithValue("@SFNI", sSFNI);
                myCommand3.Parameters.AddWithValue("@OtherPaymentMethod", sOtherPaymentMethod);
                myCommand3.Parameters.AddWithValue("@other", sOther);
                myCommand3.Parameters.AddWithValue("@FinanceComplete", sFinanceComplete);

                myCommand3.ExecuteNonQuery();
                myConnection3.Close();

                sFirstName.ToString();
                sLastName.ToString();
                String name = sFirstName + " " + sLastName;
                displayLabel.Text = name + " has been created on the system";

                //Clear fields
                passwordText.Text = "";
                emailText.Text = "";
                studentNoText.Text = "";
                fnameText.Text = "";
                lnameText.Text = "";
                emailText.Text = "";
                homeaddressText.Text = "";
                termaddressText.Text = "";
                contactnumberText.Text = "";
                kinFirstNameText.Text = "";
                kinLastNameText.Text = "";
                kinAddressText.Text = "";
                kinContactnoBox.Text = "";
                schoolBox.Text = "";
                courseBox.Text = "";
                levelBox.Text = "";

                //userid, studentid... insert into finance table(fees outstanding = £9000) leave evertyhing null 


            }
            else
            {

                string query = "INSERT INTO [SIS_USER] (username, typeID, password, email, sNumber) OUTPUT INSERTED.userID VALUES (@username, @typeID, @password, @email, @sNumber)";


                SqlCommand myCommand = new SqlCommand(query, myConnection);

                myCommand.Parameters.AddWithValue("@username", sStudentNo);
                myCommand.Parameters.AddWithValue("@typeID", typeID);
                myCommand.Parameters.AddWithValue("@password", sPassword);
                myCommand.Parameters.AddWithValue("@email", sEmail);
                myCommand.Parameters.AddWithValue("@sNumber", sStudentNo);


                Int32 newId = (Int32)myCommand.ExecuteScalar();
                myConnection.Close();

                string connectionString2 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection myConnection2 = new SqlConnection(connectionString2);

                // myConnection.ConnectionString is now set to connectionString.
                myConnection2.Open();





                string query2 = "INSERT INTO [SIS_STUDENT] (userID, firstName, lastName, address, termAddress, contactNumber, kinFirstName, kinLastName, kinAddress, kinContactNumber, school, course, level, enrolled, droppedout, L1Complete, L2Complete, PlacementComplete, L3Complete, studentNo, advisorID, tutorID, imagepath) OUTPUT INSERTED.studentID VALUES (@userID, @firstname, @lastname, @address, @termAddress, @contactNumber, @kinFirstName, @kinLastName, @kinAddress, @kinContactNumber, @school,  @course, @level, @enrolled, @droppedout, @L1Complete, @L2Complete, @placementComplete, @L3Complete,  @studentNumber, @advisor, @tutor, @imagepath)";



                SqlCommand myCommand2 = new SqlCommand(query2, myConnection2);

                myCommand2.Parameters.AddWithValue("@userID", newId);
                myCommand2.Parameters.AddWithValue("@firstname", sFirstName);
                myCommand2.Parameters.AddWithValue("@lastname", sLastName);
                myCommand2.Parameters.AddWithValue("@address", sHomeAddress);
                myCommand2.Parameters.AddWithValue("@termAddress", sTermAddress);
                myCommand2.Parameters.AddWithValue("@contactNumber", sContactNumber);
                myCommand2.Parameters.AddWithValue("@kinFirstName", skinFirstName);
                myCommand2.Parameters.AddWithValue("@kinLastName", skinLastName);
                myCommand2.Parameters.AddWithValue("@kinAddress", skinAddress);
                myCommand2.Parameters.AddWithValue("@kinContactNumber", sKinNumber);
                myCommand2.Parameters.AddWithValue("@course", sCourse);
                myCommand2.Parameters.AddWithValue("@level", sLevel);
                myCommand2.Parameters.AddWithValue("@school", sSchool);
                myCommand2.Parameters.AddWithValue("@enrolled", sFalse);
                myCommand2.Parameters.AddWithValue("@droppedout", sFalse);
                myCommand2.Parameters.AddWithValue("@L1Complete", sFalse);
                myCommand2.Parameters.AddWithValue("@L2Complete", sFalse);
                myCommand2.Parameters.AddWithValue("@placementComplete", sFalse);
                myCommand2.Parameters.AddWithValue("@L3Complete", sFalse);
                myCommand2.Parameters.AddWithValue("@studentNumber", sStudentNo);

                myCommand2.Parameters.AddWithValue("@advisor", advisorID);
                myCommand2.Parameters.AddWithValue("@tutor", tutorID);
                myCommand2.Parameters.AddWithValue("@imagepath", img);

                Int32 newStudentId = (Int32)myCommand2.ExecuteScalar();
                myConnection2.Close();

                string sFeesOutstanding = "9000";
                string sAmountPaid = "0";
                int sSFNI = 0;
                int sOtherPaymentMethod = 0;
                string sOther = "N/A";
                int sFinanceComplete = 0;


                string connectionString3 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection myConnection3 = new SqlConnection(connectionString3);
                myConnection3.Open();

                string query3 = "INSERT INTO SIS_FINANCE (feesOutstanding, amountPaid, studentID, SFNI, otherPaymentMethod, other, financeComplete) VALUES (@FeesOutstanding, @AmountPaid, @newStudentId, @SFNI, @OtherPaymentMethod, @other, @FinanceComplete)";

                SqlCommand myCommand3 = new SqlCommand(query3, myConnection3);
                myCommand3.Parameters.AddWithValue("@FeesOutstanding", sFeesOutstanding);
                myCommand3.Parameters.AddWithValue("@AmountPaid", sAmountPaid);
                myCommand3.Parameters.AddWithValue("@newStudentId", newStudentId);
                myCommand3.Parameters.AddWithValue("@SFNI", sSFNI);
                myCommand3.Parameters.AddWithValue("@OtherPaymentMethod", sOtherPaymentMethod);
                myCommand3.Parameters.AddWithValue("@other", sOther);
                myCommand3.Parameters.AddWithValue("@FinanceComplete", sFinanceComplete);

                myCommand3.ExecuteNonQuery();
                myConnection3.Close();

                sFirstName.ToString();
                sLastName.ToString();
                String name = sFirstName + " " + sLastName;
                displayLabel.Text = name + " has been created on the system";

                //Clear fields
                passwordText.Text = "";
                emailText.Text = "";
                studentNoText.Text = "";
                fnameText.Text = "";
                lnameText.Text = "";
                emailText.Text = "";
                homeaddressText.Text = "";
                termaddressText.Text = "";
                contactnumberText.Text = "";
                kinFirstNameText.Text = "";
                kinLastNameText.Text = "";
                kinAddressText.Text = "";
                kinContactnoBox.Text = "";
                schoolBox.Text = "";
                courseBox.Text = "";
                levelBox.Text = "";

                //userid, studentid... insert into finance table(fees outstanding = £9000) leave evertyhing null 


            }
        }
    }
    
    protected void cancelBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }


    [System.Web.Services.WebMethod]
    public static string CheckName(string username)
    {
        string retval = "";

        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);
        myConnection.Open();

        SqlCommand cmd = new SqlCommand("SELECT sNumber FROM SIS_USER WHERE sNumber =  @username", myConnection);

        cmd.Parameters.AddWithValue("@username", username);

        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            retval = "true";
        }
        else
        {
            retval = "false";
        }

        return retval;
    }
   
}
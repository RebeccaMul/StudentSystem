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


public partial class AcademicProgramManager_studentInfoEdit : System.Web.UI.Page
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
                Response.Redirect("viewStudentInfo.aspx");


            }

            //set-up object to use the web.config file


            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            myConnection.Open();

            string query = "SELECT * FROM SIS_STUDENT WHERE studentID=@rowid";

            SqlCommand myCommand = new SqlCommand(query, myConnection);



            myCommand.Parameters.AddWithValue("@rowid", row);

            SqlDataReader rdr = myCommand.ExecuteReader();


            while (rdr.Read())
            {

                string sfirstName = rdr["firstName"].ToString();
                string slastName = rdr["lastName"].ToString();
                string saddress = rdr["address"].ToString();
                string scontactNumber = rdr["contactNumber"].ToString();
                string scourse = rdr["course"].ToString();
                string slevel = rdr["level"].ToString();
                string senrolled = rdr["enrolled"].ToString();
                string sdropOut = rdr["droppedout"].ToString();
              
       

                TextBox1.Text = sfirstName;
                TextBox2.Text = slastName;
                TextBox3.Text = saddress;
                TextBox4.Text = scontactNumber;
                TextBox5.Text = scourse;
                TextBox7.Text = slevel;


            }

        }
    }

    
    protected void EditButton1_Click(object sender, EventArgs e)
    {
 string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        // myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();


        string sfirstNameUpdate = TextBox1.Text;
        string slastNameUpdate = TextBox2.Text;
        string saddressUpdate = TextBox3.Text;
        string scontactNumberUpdate = TextBox4.Text;
        string scourseUpdate = TextBox5.Text;
        string slevelUpdate = TextBox7.Text;



        int row = int.Parse(Request.QueryString["studentID"]);
        string query = "UPDATE SIS_Student SET firstName = @newfirstName, lastName = @newlastName, address = @newaddress, contactNumber = @newcontactNumber, course = @newcourse, level = @newlevel WHERE studentID = @id";

        SqlCommand myCommand = new SqlCommand(query, myConnection);



        myCommand.Parameters.AddWithValue("@newfirstname", sfirstNameUpdate);
        myCommand.Parameters.AddWithValue("@newlastname", slastNameUpdate);
        myCommand.Parameters.AddWithValue("@newaddress", saddressUpdate);
        myCommand.Parameters.AddWithValue("@newcontactNumber", scontactNumberUpdate);
        myCommand.Parameters.AddWithValue("@newcourse", scourseUpdate);
        myCommand.Parameters.AddWithValue("@newlevel", slevelUpdate);



        myCommand.Parameters.AddWithValue("@id", row);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        displayLabel.Text = "Students Details have been edited";

    }
    }

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

public partial class SIS2_AcademicProgramManager_editMarks : System.Web.UI.Page
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

        string module = Request.QueryString["moduleID"];

        if (!IsPostBack)
        {

            //get the querystring data from the URL and store it in a variable.
            //this will be used in the SQL Statement.

            int row = 0;
            if (Request.QueryString["resultsID"] != null)
            {
                //if it does exist in URL then do this...
                row = int.Parse(Request.QueryString["resultsID"]);
            }

            //   string row = Request.QueryString["photoId"];

            //set up object to use the web.config file
            string connectionString = WebConfigurationManager.ConnectionStrings
                ["dbconnect"].ConnectionString;

            //set up connection object called 'myConnection'
            SqlConnection myConnection = new SqlConnection(connectionString);

            //open database communication
            myConnection.Open();

            //create the SQL statement
            string query = "SELECT * FROM SIS_RESULTS WHERE resultsID=@rowId";

            //set up SQL command and use the SQL and myConnection object
            SqlCommand myCommand = new SqlCommand(query, myConnection);
            //create a parameterised object
            myCommand.Parameters.AddWithValue("@rowId", row);

            //create an sqldatareader object that asks for data from a table
            SqlDataReader rdr = myCommand.ExecuteReader();

            //when in read mode ask for data
            while (rdr.Read())
            {
                string markResult = rdr["resultMark"].ToString();
                markText.Text = markResult;
                string passfaildescription = rdr["pass/fail"].ToString();
                passfailText.Text = passfaildescription;
                string percentageMark = rdr["percentage"].ToString();
                percentageText.Text = percentageMark;

                string result = Request.QueryString["resultsID"];

                //set up object to use the web.config file
                string connectionString2 = WebConfigurationManager.ConnectionStrings
                    ["dbconnect"].ConnectionString;

                //set up connection object called 'myConnection'
                SqlConnection myConnection2 = new SqlConnection(connectionString2);

                //open database communication
                myConnection2.Open();

                //create the SQL statement
                string query2 = "SELECT * FROM SIS_RESULTS INNER JOIN SIS_ASSIGNMENT ON SIS_RESULTS.assignmentID = SIS_ASSIGNMENT.assignmentID WHERE resultsID=@Id";

                //set up SQL command and use the SQL and myConnection object
                SqlCommand myCommand2 = new SqlCommand(query2, myConnection2);
                //create a parameterised object
                myCommand2.Parameters.AddWithValue("@Id", result);

                //create an sqldatareader object that asks for data from a table
                SqlDataReader rdr2 = myCommand2.ExecuteReader();

                //when in read mode ask for data
                while (rdr2.Read())
                {
                    string weight = rdr2["assignmentWeight"].ToString();
                    markWeight.Text = weight;

                }

            }


        }//Not postback ends

        string connectionString3 = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection3 = new SqlConnection(connectionString3);

        myConnection3.Open();

        string query3 = "SELECT AVG(resultMark) AS Average, MIN(resultMark) AS Min, MAX(resultMark) AS Max FROM SIS_RESULTS WHERE moduleID=@module";

        SqlCommand myCommand3 = new SqlCommand(query3, myConnection3);

        myCommand3.Parameters.AddWithValue("@module", module);

        SqlDataReader rdr3 = myCommand3.ExecuteReader();

        while (rdr3.Read())
        {

            string avg = rdr3["Average"].ToString();
            string min = rdr3["Min"].ToString();
            string max = rdr3["Max"].ToString();

            Average.Text = avg;
            Maximum.Text = max;
            Minimum.Text = min;

        }

        rdr3.Close();

        Minimum.DataBind(); Maximum.DataBind(); Average.DataBind();
        string minvalue = Minimum.Text;
        string maxvalue = Maximum.Text;
        string avgvalue = Average.Text;

        string query4 = "UPDATE SIS_MODULES SET minMark=@min, maxMark=@max, avgMark=@avg WHERE moduleID=@module";
        SqlCommand myCommand4 = new SqlCommand(query4, myConnection3);
        myCommand4.Parameters.AddWithValue("@module", module);
        myCommand4.Parameters.AddWithValue("@min", minvalue);
        myCommand4.Parameters.AddWithValue("@max", maxvalue);
        myCommand4.Parameters.AddWithValue("@avg", avgvalue);

        myCommand4.ExecuteNonQuery();

        myConnection3.Close();
        


     
    }

    protected void saveResultsBtn_Click(object sender, EventArgs e)
    {
        // set-up object to use the web.config file
        string connectionString5 = WebConfigurationManager.ConnectionStrings
            ["dbconnect"].ConnectionString;

        //set-up connection object called 'myConnection'
        SqlConnection myConnection5 = new SqlConnection(connectionString5);

        //open database communication
        myConnection5.Open();

        string markResultUpdate = markText.Text;
        string passfailUpdate = passfailText.SelectedValue;
        string percentagemarkUpdate = percentageText.Text;

        int row = int.Parse(Request.QueryString["resultsID"]);

        string query5 = "UPDATE SIS_RESULTS SET resultMark = @updatenewmark, [pass/fail]=@newpassfail, percentage=@newpercentage WHERE resultsID = @Id";


        SqlCommand myCommand5 = new SqlCommand(query5, myConnection5);
        //create a parameterised object
        myCommand5.Parameters.AddWithValue("@updatenewmark", markResultUpdate);
        myCommand5.Parameters.AddWithValue("@Id", row);
        myCommand5.Parameters.AddWithValue("@newpassfail", passfailUpdate);
        myCommand5.Parameters.AddWithValue("@newpercentage", percentagemarkUpdate);
      
        myCommand5.ExecuteNonQuery();

        myConnection5.Close();

        addLabel.Text = "Update Successful";

    }
    protected void calculatePercent(object sender, System.EventArgs e)
    {
        markWeight.DataBind();
        decimal weight = Convert.ToDecimal(markWeight.Text);
        decimal mark = Convert.ToDecimal(markText.Text);
        decimal total = 100;

        decimal one = mark / total * weight;

        percentageText.Text = one.ToString();
        percentageText.DataBind();

    }
}
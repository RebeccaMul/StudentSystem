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

public partial class Student_Default : System.Web.UI.Page
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


            //RMU - Getting enrolled value from DB (to display Registration Wizard)

            //Getting userID from URL
            int userID = Convert.ToInt32(Session["userID"]);

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
                string enrolled = rdr["enrolled"].ToString();
                enrolValue.Text = enrolled;


            }

            rdr.Close();

            string datequery = "SELECT * FROM SIS_ACADEMICDATES WHERE dateID=4";

            SqlCommand dateCommand = new SqlCommand(datequery, myConnection);

            SqlDataReader dateRdr = dateCommand.ExecuteReader();

            while (dateRdr.Read())
            {
                String date = dateRdr["startDate"].ToString();
                StartDate.Text = date;


            }
        }


        //Student's enrol state (true/false)
        string enrol = enrolValue.Text;
        
        //Academic term start date:
        DateTime start = Convert.ToDateTime(StartDate.Text);
        string startD = start.ToString("dd/MM/yy");

        //Calculating 2 weeks before start:
        DateTime beforeDeadline = start.AddDays(-14);
        string beforeD = beforeDeadline.ToString("dd/MM/yy");

        //Calculating 2 weeks after:
        DateTime afterDeadline = start.AddDays(14);
        string afterD = afterDeadline.ToString("dd/MM/yy");

        //Storing now date/time
        string nowTime = DateTime.Now.ToString("dd/MM/yy");
        DateTime now = Convert.ToDateTime(nowTime);

        //If enrolled, banner disappears:
        if (enrol == "True" || enrol == "true")
        {
            Reg.Visible = false;
            deadline.Visible = false;
        }

        //If enrolled, banner remains:
        if (enrol == "False" || enrol == "false")
        {
        }

        //If right now, is before the 2 weeks before deadline, banner disappears:
        if (now < beforeDeadline) {
            Reg.Visible = false;
        }
  
        //If right now, is after the 2 weeks after deadline, banner disappears:
        if (now > afterDeadline && (enrol == "False" || enrol == "false"))
        {
            Reg.Visible = false;
            deadline.Text = "You have missed the enrolment deadline, please contact your Advisor of Studies";
        }

        //If now is in range, banner remains
        if (now.Date >= beforeDeadline.Date && now.Date <= afterDeadline.Date)
        {
        }

        AdRotator1.DataSource = FetchAdsFromDB();
        AdRotator1.DataBind();

    }
    private DataTable FetchAdsFromDB()
    {
        string connectionString = WebConfigurationManager.ConnectionStrings
                ["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();
        string sql = "SELECT * FROM SIS_ADS";
       // SqlCommand myCommand = new SqlCommand(sql, myConnection);
        SqlDataAdapter da = new SqlDataAdapter(sql, myConnection );
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
        
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        AdRotator1.DataSource = FetchAdsFromDB();
        AdRotator1.DataBind();
    }
}

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

public partial class Lecturer_uploadresults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //JC - if statement to allow or deny access to page
        string module = Request.QueryString["moduleid"];

        if (!IsPostBack)
        {

            if (Session["user"] == null || (Convert.ToInt32(Session["typeID"]) != 6))//deny users with no access
            {
                Response.Redirect("../default.aspx");
            }
            else
            {
                string usern = Session["user"].ToString();//allow users with access

                username.Text = usern;
                username1.Text = usern;
            }

        }

        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();

        //Returns the Avg, Min, Max

        string query = "SELECT AVG(resultMark) AS Average, MIN(resultMark) AS Min, MAX(resultMark) AS Max FROM SIS_RESULTS WHERE moduleID=@module";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@module", module);

        SqlDataReader rdr = myCommand.ExecuteReader();

        while (rdr.Read())
        {

            string avg = rdr["Average"].ToString();
            string min = rdr["Min"].ToString();
            string max = rdr["Max"].ToString();

            Average.Text = avg;
            Maximum.Text = max;
            Minimum.Text = min;

        }

        rdr.Close();

        Minimum.DataBind(); Maximum.DataBind(); Average.DataBind(); 
        string minvalue = Minimum.Text;
        string maxvalue = Maximum.Text;
        string avgvalue = Average.Text;
        
        string query2 = "UPDATE SIS_MODULES SET minMark=@min, maxMark=@max, avgMark=@avg WHERE moduleID=@module";
        SqlCommand myCommand2 = new SqlCommand(query2, myConnection);
        myCommand2.Parameters.AddWithValue("@module", module);
        myCommand2.Parameters.AddWithValue("@min", minvalue);
        myCommand2.Parameters.AddWithValue("@max", maxvalue);
        myCommand2.Parameters.AddWithValue("@avg", avgvalue);
        
        myCommand2.ExecuteNonQuery();

        myConnection.Close();
        
       
    }
    
    //SM - Calculation takes place which generates overall final module mark percentage
    protected void submit_Click(object sender, EventArgs e)
    {
        //JC - connection to db
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);

        //JC - open connection to db
        myConnection.Open();

        //JC -Getting query strings from URL:
        int userID = Convert.ToInt32(userSelected.SelectedValue);
        int moduleID = int.Parse(Request.QueryString["moduleID"]);
        int lecturerID = int.Parse(Request.QueryString["lecturerID"]);
        string assignment = type.SelectedValue;
        string mark = markno.Text;
        string pass = passfail.SelectedValue;
       

        //JC - insert query
        string query = "INSERT INTO SIS_RESULTS ( resultMark, [pass/fail], studentID, moduleID, lecturerID, assignmentID) VALUES ( @mark, @pass, @user, @module,@lecturer,@name)";

        //JC - assigning parameters
        SqlCommand myCommand = new SqlCommand(query, myConnection);
        myCommand.Parameters.AddWithValue("@name", assignment);
        myCommand.Parameters.AddWithValue("@mark", mark);
        myCommand.Parameters.AddWithValue("@pass", pass);
        myCommand.Parameters.AddWithValue("@user", userID);
        myCommand.Parameters.AddWithValue("@module", moduleID);
        myCommand.Parameters.AddWithValue("@lecturer", lecturerID);

        myCommand.ExecuteNonQuery();

        myConnection.Close();//close connection

        ScriptManager.RegisterStartupScript(this, GetType(), "Success", "confirm('Student Result Submission Complete');", true);

        submitcomplete.Text = "Student Result Submission Complete";
        //JC user message
        hidediv.Visible = false;
        hidediv2.Visible = false;

        markno.DataBind();
        string markEntered = markno.Text;

        string studentID = userSelected.SelectedValue;

        Response.Redirect("uploadResultsAdd.aspx?input=" + markEntered + "&assignmentID=" + assignment + "&studentID=" + studentID + "&lecturerID=" + lecturerID + "&moduleID=" + moduleID);

      
    }



    protected void selectinguser_Click(object sender, EventArgs e)
    {
        string userid = userSelected.SelectedValue;

        Session["userinfo"] = userid;

       
        hidediv.Visible = true;
        hidediv2.Visible = true;
      
      
       
        
    }
}
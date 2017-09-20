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

public partial class Admin_adminUploadResults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //JC - if statement to allow or deny access to page
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
        if (!IsPostBack)
        {




        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        //JC - connection to db
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);
        //JC -open connection to db
        myConnection.Open();

        //JC  Getting query strings from URL:
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

        myConnection.Close();//JC -close connection
        //JC - A javascript confirmation message for user
        ScriptManager.RegisterStartupScript(this, GetType(), "Success", "confirm('Student Result Submission Complete');", true);
        //JC user message
        submitcomplete.Text = "Student Result Submission Complete";
        hidediv.Visible = false;
        hidediv2.Visible = false;

    }



    protected void selectinguser_Click(object sender, EventArgs e)
    {
        //method is used to enable the hidden div after student is selected and admin user click "Go"
        string userid = userSelected.SelectedValue;

        Session["userinfo"] = userid;


        hidediv.Visible = true;
        hidediv2.Visible = true;

    }
}
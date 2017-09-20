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
using System.Drawing;

public partial class Admin_createPathway : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //JC - If statement used to allow or deny access based on typeID
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
    protected void newPathwayButton_Click(object sender, EventArgs e)
    {
        //JC - create connection to database
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        // JC - myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        string pathway = newPathway.Text;
        string code = newCode.Text;
        string pathlength = years.Text;
        string entry = newentryRequirements.Text;
        string fac = newfaculty.Text;
        string school = newschool.Text;
        string info = newoverview.Text;


        //JC - SQL insert statment for new pathway
        string query = "INSERT INTO SIS_PATHWAY (pathwayName, pathwayCode, pathwayYears, entryRequirements, faculty, school, overview) VALUES ( @path, @code, @length, @ent, @faculty, @sch, @info)";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@path", pathway);
        myCommand.Parameters.AddWithValue("@code", code);
        myCommand.Parameters.AddWithValue("@length", pathlength);
        myCommand.Parameters.AddWithValue("@ent", entry);
        myCommand.Parameters.AddWithValue("@faculty", fac);
        myCommand.Parameters.AddWithValue("@sch", school);
        myCommand.Parameters.AddWithValue("@info", info);
        

        myCommand.ExecuteNonQuery();
        myConnection.Close();
        //JC - Clear fields once new module has been inserted into DB
        newPathway.Text = "";
        newCode.Text = "";
        years.Text = "";

        //JC - user message
        complete.Text = "Add Pathway Complete";

    }
}
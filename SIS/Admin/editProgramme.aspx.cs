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

public partial class Admin_editProgramme : System.Web.UI.Page
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
    }
    protected void addmodule_Click(object sender, EventArgs e)
    {
        //JC - create connection to database
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        // JC - myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        string moduleadd = modulelist.SelectedValue;
        //JC - Get pathwayID from the querystring 
        string pathwayIDR = Request.QueryString["pathwayID"].ToString();
        int level1 = Convert.ToInt32(level.SelectedValue);


        string query = "INSERT INTO SIS_PROGRAMME (pathwayID, moduleID, level) VALUES ( @mod, @path, @level)";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        //JC - Add pareameter values
        myCommand.Parameters.AddWithValue("@path", moduleadd);
        myCommand.Parameters.AddWithValue("@mod", pathwayIDR);
        myCommand.Parameters.AddWithValue("@level", level1);

        myCommand.ExecuteNonQuery();
        myConnection.Close();

        //JC - Reload page to show changes
        Response.Redirect(Request.Url.AbsoluteUri);



    }
    protected void remove_Click(object sender, EventArgs e)
    {
        //JC - Method to delete a module from a pathway
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);
        //JC - Open DB connection
        myConnection.Open();

        //JC Getting pathwayID from URL:
        string modid = remmod.SelectedValue;
        string pathid = Request.QueryString["pathwayID"];

        string query = "DELETE FROM SIS_PROGRAMME WHERE moduleID = @ID AND pathwayID = @pathID";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@ID", modid);
        myCommand.Parameters.AddWithValue("@pathID", pathid);
        myCommand.ExecuteNonQuery();

        myConnection.Close();
        //JC - Reload page to show changes
        Response.Redirect(Request.Url.AbsoluteUri);

    }
}
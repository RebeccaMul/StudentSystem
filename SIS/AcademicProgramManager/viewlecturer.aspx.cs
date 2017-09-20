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

public partial class AcademicProgramManager_viewlecturer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["user"] == null || (Convert.ToInt32(Session["typeID"]) != 4))
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

    protected void assignModuleBtn_Click(object sender, EventArgs e)
    {

        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        // myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();


        //request lecturer id
        int row = int.Parse(Request.QueryString["lecturerID"]);
        string moduleoptions = modules.SelectedValue;




        // ET - Inserts values of Backlog into Table.
        string query = "UPDATE SIS_MODULES SET lecturerID = @lecturerID WHERE moduleName = @modules";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@lecturerID", row);
        myCommand.Parameters.AddWithValue("@modules", moduleoptions);





        myCommand.ExecuteNonQuery();
        myConnection.Close();



        addLabel.Text = "Module assigned";

    }
}
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

public partial class AcademicProgramManager_reviewlecturerchangesAdd : System.Web.UI.Page
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

        }


        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        // myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        int row = int.Parse(Request.QueryString["moduleID"]);
        string sug = Request.QueryString["suggestion"];
        string desc = "";
        int row1 = int.Parse(Request.QueryString["lecturerID"]);


        //Updates value into Modules table
        string query = "UPDATE SIS_MODULES SET moduleDescription = @change, suggestedDescriptionChange = @empty WHERE moduleID = @module";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@module", row);
        myCommand.Parameters.AddWithValue("@change", sug);
        myCommand.Parameters.AddWithValue("@empty", desc);


        myCommand.ExecuteNonQuery();
        myConnection.Close();

        Response.Redirect("reviewlecturerchanges.aspx?lecturerID=" + row1 + "&moduleID=" + row);


    }

}

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

public partial class Lecturer_deletefile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //method to delete a resource. Open connection and deletes using resourceID
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();

        //JC - Getting userID from URL:
        int resourceID = int.Parse(Request.QueryString["resourceID"]);

        string query = "DELETE FROM SIS_RESOURCES WHERE resourceID = @ID";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@ID", resourceID);

        myCommand.ExecuteNonQuery();

        myConnection.Close();
        //JC - Reload age to show deleted file is gone
        Response.Redirect("fileupload.aspx");
    }
}
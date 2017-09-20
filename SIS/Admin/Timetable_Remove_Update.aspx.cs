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


public partial class Admin_Timetable_Remove : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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

    

        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);
        myConnection.Open();

        int row = int.Parse(Request.QueryString["eventID"]);
        string query = "DELETE FROM SIS_EVENT WHERE (eventID = @id)";
        SqlCommand myCommand = new SqlCommand(query, myConnection);
        myCommand.Parameters.AddWithValue("@id", row);

        myCommand.ExecuteNonQuery();
        myConnection.Close();

        Response.Redirect("Timetable_Remove.aspx");

}
    }
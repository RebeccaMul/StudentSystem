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

public partial class Admin_deleteAd : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        //JC - IF statement to allow or deny access to page using TYPEID
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
           // username.Text = user;
            //username1.Text = user; 

        }

        //method to delete a advertisment. Open connection and deletes using adID

        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);
        myConnection.Open();

        int row = int.Parse(Request.QueryString["adID"]);
        string query = "DELETE FROM SIS_ADS WHERE (addID = @id)";
        SqlCommand myCommand = new SqlCommand(query, myConnection);
        myCommand.Parameters.AddWithValue("@id", row);

        myCommand.ExecuteNonQuery();
        myConnection.Close();


        //JC - User message
        Response.Redirect("manageads.aspx");
    }
}
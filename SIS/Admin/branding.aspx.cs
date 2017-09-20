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
using System.Globalization;

public partial class Admin_Default : System.Web.UI.Page
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

        if (!IsPostBack)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            myConnection.Open();

            string query = "SELECT * FROM SIS_CONFIG";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            SqlDataReader rdr = myCommand.ExecuteReader();


            while (rdr.Read())
            {
                string sSystemName = rdr["systemName"].ToString();
                string sWelcomeAlert = rdr["welcomeAlert"].ToString();

                systemName.Text = sSystemName;
                welcomeAlert.Text = sWelcomeAlert;

            }

        }
    }
    protected void cancelBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Configuration.aspx");
    }

    protected void saveBtn_Click(object sender, EventArgs e)
    {
        //ET - User ability to search for image.
        string UpPath = Server.MapPath("~/files");

        Random r = new Random();
        int rInt = r.Next(0, 10000);

        if (!Directory.Exists(UpPath))
        {
            Directory.CreateDirectory(UpPath);
            displayLabel.Text = UpPath + " folder files does not exist";
        }
        else
        {
            int imgSize = myimage.PostedFile.ContentLength;
            string imgName = myimage.FileName;
            string imgPath = "~/files/" + rInt + imgName;

            if (myimage.PostedFile.ContentLength > 1500000)
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('File is too big.')",

true);
            }
            else
            {

                myimage.SaveAs(Server.MapPath(imgPath));

            }

            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            // myConnection.ConnectionString is now set to connectionString.
            myConnection.Open();

            string sWelcomeAlertUpdate = welcomeAlert.Text;
            string sSystemNameUpdate = systemName.Text;
            string img = rInt + myimage.FileName;


            if (img == rInt.ToString())
            {
                string query = "UPDATE SIS_CONFIG SET welcomeAlert = @newWelcomeAlert, systemName = @newSystemName WHERE configID = 1";


                SqlCommand myCommand = new SqlCommand(query, myConnection);

                myCommand.Parameters.AddWithValue("@newWelcomeAlert", sWelcomeAlertUpdate);
                myCommand.Parameters.AddWithValue("@newSystemName", sSystemNameUpdate);

                myCommand.ExecuteNonQuery();

                myConnection.Close();
               
            }
            else
            {
                string query = "UPDATE SIS_CONFIG SET welcomeAlert = @newWelcomeAlert, systemName = @newSystemName, logoImagepath = @newimagepath WHERE configID = 1";


                SqlCommand myCommand = new SqlCommand(query, myConnection);

                myCommand.Parameters.AddWithValue("@newWelcomeAlert", sWelcomeAlertUpdate);
                myCommand.Parameters.AddWithValue("@newSystemName", sSystemNameUpdate);
                myCommand.Parameters.AddWithValue("@newImagepath", img);

                myCommand.ExecuteNonQuery();

                myConnection.Close();
            }

        }
      displayLabel.Text = "The changes that have been made are now saved to the database.";
    }
}
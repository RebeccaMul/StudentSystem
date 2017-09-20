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
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;

public partial class resetPasswordUser : System.Web.UI.Page
{
    //ET - If there is no user session redirect to resetpassword page.
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("resetPassword.aspx");

        }
        else
        {
            //ET - If there is a user session, set session of user and use username to display on screen.
            string user = Session["user"].ToString();
            username.Text = "Username: " + "<b>" + user + "</b>";

        }
    }

    //BL - Build unique code 
    class Sample
    {
        public static void Main()
        {
            Guid g;
            // Create and display the value of two GUIDs.
            g = Guid.NewGuid();
        }
    }
    //ET - Checks if the users answer to the security question is in database.
    protected void continueBtn_Click(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);


        string str = null;
        SqlCommand cmd;

        connection.Open();


        String username = Convert.ToString(Session["user"]); //.ToString;


        str = "SELECT * FROM SIS_USER WHERE sNumber=@username";

        cmd = new SqlCommand(str, connection);

        cmd.Parameters.AddWithValue("@username", username);

        SqlDataReader reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            if (answerBox.Text == reader["questionAns"].ToString())
            {

                Response.Redirect("resetPasswordUpdate.aspx");
            }
            else
            {
                warningLabel.Text = "<b><font color=red>Answer to security question incorrect, please try again or use email address to reset password below.</font></b>";

            }

        }


    }
    //ET - Directs user to other method of resetting password. 
    protected void EmailBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("resetPasswordEmail.aspx");
    }
}


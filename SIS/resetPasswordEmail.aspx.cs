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

public partial class resetPasswordEmail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("resetPassword.aspx");

        }
        else
        {

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
    protected void sendBtn_Click(object sender, EventArgs e)
    {


        string query = "SELECT * FROM SIS_USER WHERE sNumber=@username";

        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();

        string username = Convert.ToString(Session["user"]);

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@username", username);

        SqlDataReader reader = myCommand.ExecuteReader();

        while (reader.Read())
        {
            if (emailBox.Text == reader["email"].ToString())
            {
                string email = Request.QueryString["email"];
                string name = Request.QueryString["username"];
                string g = Request.QueryString["g"];

                myCommand.Parameters.AddWithValue("@email", email);
                myCommand.Parameters.AddWithValue("@name", name);
                myCommand.Parameters.AddWithValue("@g", g);

                email = @email;

                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("cit12reset@gmail.com");
                msg.To.Add(emailBox.Text);
                msg.Subject = "SIS Password Reset";
                msg.Body = "SIS Password Reset" + "\n\nThis email has been sent from SIS at http://etroyo01.public.cs.qub.ac.uk/sis/resetPassword.aspx If you did not request to reset your password you should ignore this email. If you did request to reset your password then you should use the link below to choose a new password. This link is only valid for a limited time after you request it. If you do not use it immediately you will need to go through the process again. \n\n Your password reset address is: \n http://etroyo01.public.cs.qub.ac.uk/sis/resetPasswordUpdate.aspx";
                SmtpClient smt = new SmtpClient("smtp.gmail.com", 587);
                smt.Credentials = new System.Net.NetworkCredential("siscsc3047@gmail.com", "queensbelfast");
                smt.EnableSsl = true;
                smt.Send(msg);
                sentLabel.Text = "Email has been sent, please check your inbox and follow the link.";
                emailLabel.Visible = false;
               
            }
            else
            {
                emailLabel.Text = "<b><font color=#73879C>Email address for user is incorrect, please try again.</font></b>";
            }
        }


    }

}


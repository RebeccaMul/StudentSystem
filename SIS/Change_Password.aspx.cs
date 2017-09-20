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
using System.Configuration;
using System.Data.SqlClient;



public partial class Admin_Change_Password : System.Web.UI.Page
{
    // JD - Establishing a connection string to connect to the database
    string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

    // JD - Initialise the string with a null value
    string str = null;

    //JD - Initialising the sql command
    SqlCommand cmd;

    //JD - Declaring a variable "up" of type int which will be used as a boolean value as part of an if statement when reading from db
    int up;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["user"] == null)
            Response.Redirect("../Default.aspx");
        else
        {
            string user = Session["user"].ToString();
            username.Text = user;
            username1.Text = user;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        //JD - Utilising the connection string to connect to the database
        SqlConnection connection = new SqlConnection(connectionString);

        // JD - Opening the connection
        connection.Open();
        String username = Convert.ToString(Session["user"]); //.ToString;

        // JD - Setting the string to sql select command in order to select all registered users
        str = "SELECT * FROM [SIS_USER] WHERE username=@username";

        cmd = new SqlCommand(str, connection);


        cmd.Parameters.AddWithValue("@username", username);
        //Jd - Initialising the data reader to read table info
        SqlDataReader reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            // JD - Validating the users current password
            if (oldPassword.Text == reader["password"].ToString())
            {
                //JD - If the (user entered) password matches that in the database the int up is set to 1.
                up = 1;
            }
        }

        //JD - Closing of the data reader after the records have been read from the database.
        reader.Close();

        //JD - Closing the connection
        connection.Close();

        //JD - Utilising the int "up" in an if statement to update the password. If the data matches in the reader the sql update query will be performed. 
        if (up == 1)
        {
            //JD - Re-open the connection
            connection.Open();

            //JD - Reset the string "str" to a new sql query which performs the update of the password based upon the logged in user (user session).
            str = "UPDATE [SIS_USER] SET  password=@newpass where username='" + Session["user"].ToString() + "'";

            //JD - Establishing a new sql command.
            cmd = new SqlCommand(str, connection);

            //JD - Paramtising the values
            cmd.Parameters.AddWithValue("@newpass", confirmPassword.Text);
            cmd.Parameters.AddWithValue("@password", oldPassword.Text);

            //JD - Initialising the connection.
            cmd.Connection = connection;

            //JD - Used to edit the data through the sql query.
            cmd.ExecuteNonQuery();

            //JD - Establsihing a new data reader and setting it to null.
            SqlDataReader rdr = null;
            rdr = cmd.ExecuteReader();

            //JD - While loop used to ensure new password and confirm password input matches
            while (rdr.Read())
            {

                //JD - If statement used to compare the values.
                if ((newPassword.Text == rdr["newPassword"].ToString()) & (confirmPassword.Text == (rdr["confirmPassword"].ToString())))
                {


                }
            }

            //JD - If the values match the label text is updated to inform the user the process was succesful. 
            Label1.Text = ("Password changed successfully!");

        }
        else
        {

            //JD - Else statement used to inform the user that the validation of the current password failed. If this is the case the label text is changed to indicate to the user that their current password was entered incorrectly. 
            Label1.Text = "Please enter correct current password!";
        }
    }
}


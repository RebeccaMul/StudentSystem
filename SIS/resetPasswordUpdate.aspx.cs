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

public partial class resetPasswordUpdate : System.Web.UI.Page
{
    //ET - Setting up connection to database.
    string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

    string str = null;

    SqlCommand cmd;

    int up;

    protected void Page_Load(object sender, EventArgs e)
    {
        string guidToTest = Request["g"];

        if (Session["user"] == null)
        {
            Response.Redirect("resetPassword.aspx");

        }
        else
        {

            string user = Session["user"].ToString();
            username.Text = "Username: " + "<b>" + user + "</b>";
            loginBtn.Visible = false;

        }
    }

    //ET - Updates user's password on database depending on what user is logged in.
    protected void confirmBtn_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(connectionString);

        connection.Open();
        //ET - Update query
        str = "UPDATE [SIS_USER] SET password=@newpass WHERE sNumber='" + Session["user"].ToString() + "'";

        cmd = new SqlCommand(str, connection);

        cmd.Parameters.AddWithValue("@newpass", confirmPassword.Text);

        SqlDataReader reader = cmd.ExecuteReader();
        reader.Close();
        cmd.Connection = connection;

        cmd.ExecuteNonQuery();

        SqlDataReader rdr = null;
        rdr = cmd.ExecuteReader();
        //ET - Checks and compares that both passwords entered match.
        while (rdr.Read())
        {
            if ((newPassword.Text == rdr["newPassword"].ToString()) & (confirmPassword.Text == (rdr["confirmPassword"].ToString())))
            {


            }
        }
        // ET - Shows the user the status of change.
        updateLabel.Text = ("Password changed successfully!");
        confirmBtn.Visible = false;
        passwordPanel.Visible = false;
        loginBtn.Visible = true;


    }
    //ET - Directs user back to original log in screen for system.
    protected void loginBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}


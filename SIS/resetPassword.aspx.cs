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

public partial class resetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //ET - Removes user session
        Session.Remove("user");

    }
    //ET - Checks whether username matches that of database.
    protected void continueBtn_Click(object sender, EventArgs e)
    {
        string user = username.Text;

        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection Connection = new SqlConnection(connectionString);


        Connection.Open();
        // ET - SELECT username and userID from Table
        string query = "SELECT * FROM [SIS_USER] WHERE sNumber=@username";

        SqlCommand myCommand = new SqlCommand(query, Connection);

        myCommand.Parameters.AddWithValue("@username", user);

        SqlDataReader rdr = myCommand.ExecuteReader();

        if (rdr.HasRows)
        {
            while (rdr.Read())
            {
                string myname = rdr["sNumber"].ToString();
                string myuserid = rdr["userID"].ToString();


                //ET - Set the session to username and userid

                Session["user"] = myname;
                Session["userid"] = myuserid;
                Response.Redirect("resetPasswordUser.aspx");

            }
        }
        else
        {
           invalidLabel.Text = "You entered an invalid username. Please try again.";
        }
    }

}


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

public partial class Lecturer_Change_Security : System.Web.UI.Page
{
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
        if (!IsPostBack)
        {

            int row = Convert.ToInt32(Session["userID"]);


            //set-up object to use the web.config file


            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            myConnection.Open();

            string query = "SELECT * FROM SIS_SECURITYQ INNER JOIN SIS_USER ON SIS_USER.questionID = SIS_SECURITYQ.questionID WHERE SIS_USER.userID=@rowid";





            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@rowid", row);

            SqlDataReader rdr = myCommand.ExecuteReader();


            while (rdr.Read())
            {

                string sSecurityQ = rdr["questionID"].ToString();
                securityQList.Text = sSecurityQ;

            }
        }
    }
    protected void updateSecurityQ_Click(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        // myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        string sSecurityQ = securityQList.SelectedValue;
        int securityID = Convert.ToInt32(sSecurityQ);

        string sSecurityConfirmAns = answerConfirm.Text;

        int row = Convert.ToInt32(Session["userID"]);
        string query = "UPDATE SIS_USER SET questionID = @questionID, questionAns = @questionAns WHERE userID = @id";


        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@questionID", securityID);
        myCommand.Parameters.AddWithValue("@questionAns", sSecurityConfirmAns);
        myCommand.Parameters.AddWithValue("@id", row);
        securityUpdateLabel.Text = "Security question and answer updated.";


        myCommand.ExecuteNonQuery();

        myConnection.Close();
    }
}
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
public partial class SeniorUniversityManager_EditTask_Item : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        {
            if (Session["user"] == null || (Convert.ToInt32(Session["typeID"]) != 3))
            {
                Response.Redirect("../Default.aspx");

            }
            else
            {

                string user = Session["user"].ToString();
                username.Text = user;
                username1.Text = user;

            }
        }
        if (!IsPostBack)
        {

            int row = 0;
            if (Request.QueryString["taskID"] != null)
            {
                row = int.Parse(Request.QueryString["taskID"]);
            }
            else
            {
                Response.Redirect("Edit_Task.aspx");
            }



            //set-up object to use the web.config file


            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            myConnection.Open();

            string query = "SELECT * FROM SIS_TASK WHERE taskID = @rowID";


            string date = DateTime.Now.ToString("dd/MM/yyyy");

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@rowID", row);


            SqlDataReader rdr = myCommand.ExecuteReader();


            while (rdr.Read())
            {

                string sTaskName = rdr["taskName"].ToString();
                string sNotificationMessage = rdr["taskMessage"].ToString();
                string sUserType = rdr["typeID"].ToString();




                taskName.Text = sTaskName;
                taskMessage.Text = sNotificationMessage;

            }
        }
    }


    protected void saveBtn_Click(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        // myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        string sTaskNameUpdate = taskName.Text;
        string sTaskMessageUpdate = taskMessage.Text;
        string sTaskAssign = proxyList.SelectedValue;

        //barry static variable
        int typeID = 1;

        {
            int row = Convert.ToInt32(Request.QueryString["taskID"]);
            string query = "UPDATE SIS_TASK SET taskName = @newTaskName, taskMessage = @newTaskMessage WHERE taskID = @rowid";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@newtypeID", typeID);
            myCommand.Parameters.AddWithValue("@newTaskName", sTaskNameUpdate);
            myCommand.Parameters.AddWithValue("@newTaskMessage", sTaskMessageUpdate);

            myCommand.Parameters.AddWithValue("@rowid", row);

            myCommand.ExecuteNonQuery();

            myConnection.Close();
          
        }  displayLabel.Text = "The changes that have been made are now saved to the database.";
    }

    protected void deleteConfirmBtn_Click(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);

        //myconnection.ConnectionString is now set to connectionString
        myConnection.Open();

        int row = int.Parse(Request.QueryString["taskID"]);

        string query = "DELETE FROM SIS_TASK WHERE (taskID = @rowid)";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@rowID", row);


        myCommand.ExecuteNonQuery();

        myConnection.Close();

        Response.Redirect("Edit_Task.aspx");
    }
    protected void cancelBtn_Click(object sender, EventArgs e)
    {

        Response.Redirect("Edit_Task.aspx");
    }
}
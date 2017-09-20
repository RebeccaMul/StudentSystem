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


public partial class SeniorUniversityManager_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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

    protected void confirmBtn_Click(object sender, EventArgs e)
    {

       

            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            // myConnection.ConnectionString is now set to connectionString.
            myConnection.Open();
         
            string sTaskName = taskName.Text;
            string sTaskText = messageBox.Text;
            string sTaskAssign = proxyList.SelectedValue;

            //barry static variable
            int typeID = 1;


            string date = DateTime.Now.ToString("dd/MM/yyyy");

            //  string date = DateTime.Now.ToString("dd/MM/yyyy");

            //ET - If no image selected do not update image, Else directed to next query with image update.
         
                string query = "INSERT INTO [SIS_TASK] (typeID, taskName, taskDate, taskMessage, taskAssign) VALUES (@typeID, @taskName, @taskDate, @taskMessage, @taskAssign)";


                SqlCommand myCommand = new SqlCommand(query, myConnection);

                myCommand.Parameters.AddWithValue("@typeID", typeID);
                myCommand.Parameters.AddWithValue("@taskName", sTaskName);
                myCommand.Parameters.AddWithValue("@taskDate", date);
                myCommand.Parameters.AddWithValue("@taskMessage", sTaskText);
                myCommand.Parameters.AddWithValue("@taskAssign", sTaskAssign);


                myCommand.ExecuteNonQuery();

                myConnection.Close();
                Response.Redirect(Request.RawUrl);

 
            }
   

    protected void editPostBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Edit_Task.aspx");
    }
}




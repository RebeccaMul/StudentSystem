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

public partial class Admin_Edit_Notification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["user"] == null)
        {
            Response.Redirect("../Default.aspx");
        }
        else if ((Convert.ToInt32(Session["typeID"]) != 1))
        {

        }
        else
        {
            string user = Session["user"].ToString();
            username.Text = user;
            username1.Text = user;
        }

        if (!IsPostBack)
        {

            int row = 0;
            if (Request.QueryString["notificationID"] != null)
            {
                row = int.Parse(Request.QueryString["notificationID"]);
            }
            else
            {
                Response.Redirect("Edit_Notification.aspx");
            }



            //set-up object to use the web.config file


            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            myConnection.Open();

            string query = "SELECT * FROM SIS_NOTIFICATION WHERE notificationID = @rowID";


            string date = DateTime.Now.ToString("dd/MM/yyyy");

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@rowID", row);


            SqlDataReader rdr = myCommand.ExecuteReader();


            while (rdr.Read())
            {

                string sNotificationName = rdr["notificationName"].ToString();
                string sNotificationMessage = rdr["notificationMessage"].ToString();
                string sUserType = rdr["typeID"].ToString();

    


                accountType.Text = sUserType;
                notificationName.Text = sNotificationName;
                notificationMessage.Text = sNotificationMessage;

            }
        }

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
            myinfo.Text = UpPath + " folder files does not exist";
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

            string sNotificationNameUpdate = notificationName.Text;
            string sNotificationMessageUpdate = notificationMessage.Text;
            string img = rInt + myimage.FileName;
                
            string userType = accountType.SelectedValue;
            int typeID = Convert.ToInt32(userType);

            if (img == rInt.ToString())
            {
                int row = Convert.ToInt32(Request.QueryString["notificationID"]);
                string query = "UPDATE SIS_NOTIFICATION SET typeID = @newtypeID, notificationName = @newNotificationName, notificationMessage = @newNotificationMessage WHERE notificationID = @rowid";

                SqlCommand myCommand = new SqlCommand(query, myConnection);

                myCommand.Parameters.AddWithValue("@newtypeID", typeID);
                myCommand.Parameters.AddWithValue("@newNotificationName", sNotificationNameUpdate);
                myCommand.Parameters.AddWithValue("@newNotificationMessage", sNotificationMessageUpdate);

                myCommand.Parameters.AddWithValue("@rowid", row);

                myCommand.ExecuteNonQuery();

                myConnection.Close();
            }
            else
            {
                int row = Convert.ToInt32(Request.QueryString["notificationID"]);
                string queryImage = "UPDATE SIS_NOTIFICATION SET typeID = @newtypeID, notificationName = @newNotificationName, notificationMessage = @newNotificationMessage, imagepath = @newImagepath WHERE notificationID = @rowid";

                SqlCommand myCommand = new SqlCommand(queryImage, myConnection);

                myCommand.Parameters.AddWithValue("@newtypeID", typeID);
                myCommand.Parameters.AddWithValue("@newNotificationName", sNotificationNameUpdate);
                myCommand.Parameters.AddWithValue("@newNotificationMessage", sNotificationMessageUpdate);
                myCommand.Parameters.AddWithValue("@newImagepath", img);
                myCommand.Parameters.AddWithValue("@rowid", row);

                myCommand.ExecuteNonQuery();

                myConnection.Close();
            }

            displayLabel.Text = "The changes that have been made are now saved to the database.";
        }
    }
    

    protected void cancelBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Edit_Notification.aspx");
    }
    protected void deleteBtn_Click(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);

        //myconnection.ConnectionString is now set to connectionString
        myConnection.Open();

        int row = int.Parse(Request.QueryString["notificationID"]);

        string query = "DELETE FROM SIS_NOTIFICATION WHERE (notificationID = @rowid)";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@rowID", row);


        myCommand.ExecuteNonQuery();

        myConnection.Close();

        Response.Redirect("Edit_Notification.aspx");
    }
}
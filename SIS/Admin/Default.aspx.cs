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
    }





    protected void confirmBtn_Click(object sender, EventArgs e)
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
            string img = rInt + myimage.FileName;
            string sNotificatioName = notificationName.Text;

            string sMessageText = messageBox.Text;




            string userType = userTypeList.SelectedValue;
            int typeID = Convert.ToInt32(userType);

            string date = DateTime.Now.ToString("dd/MM/yyyy");



            //  string date = DateTime.Now.ToString("dd/MM/yyyy");

            //ET - If no image selected do not update image, Else directed to next query with image update.
            if (img == rInt.ToString())
            {

                string query = "INSERT INTO [SIS_NOTIFICATION] (typeID, notificationName, notificationDate, notificationMessage) VALUES (@typeID, @notificationName, @notificationDate, @notificationMessage)";


                SqlCommand myCommand = new SqlCommand(query, myConnection);

                myCommand.Parameters.AddWithValue("@typeID", typeID);
                myCommand.Parameters.AddWithValue("@notificationName", sNotificatioName);
                myCommand.Parameters.AddWithValue("@notificationDate", date);
                myCommand.Parameters.AddWithValue("@notificationMessage", sMessageText);

                myCommand.ExecuteNonQuery();

                myConnection.Close();
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                string queryImage = "INSERT INTO [SIS_NOTIFICATION] (typeID, notificationName, notificationDate, notificationMessage, imagepath) VALUES (@typeID, @notificationName, @notificationDate, @notificationMessage, @imagepath)";


                SqlCommand myCommand = new SqlCommand(queryImage, myConnection);

                myCommand.Parameters.AddWithValue("@typeID", typeID);
                myCommand.Parameters.AddWithValue("@notificationName", sNotificatioName);
                myCommand.Parameters.AddWithValue("@notificationDate", date);
                myCommand.Parameters.AddWithValue("@notificationMessage", sMessageText);
                myCommand.Parameters.AddWithValue("@imagepath", img);

                myCommand.ExecuteNonQuery();

                myConnection.Close();
                Response.Redirect(Request.RawUrl);
            }
        }
    }
    protected void editPostBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Edit_Notification.aspx");
    }


    //SM - enables admin to post external links

    protected void linktest_Click(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        // myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();


        string slinkMessageText = linkMessageBox.Text;
        string slinkNameText = linkName.Text;
        string linkType = linkTypeList.SelectedValue;
        int typeID = Convert.ToInt32(linkType);
        int row = Convert.ToInt32(Request.QueryString["linkID"]);



        string query = "INSERT INTO [SIS_EXTERNAL_LINKS] (linkType, linkMessage, linkName) VALUES (@linkType, @linkMessage, @linkName)";



        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@linkType", linkType);
        myCommand.Parameters.AddWithValue("@linkMessage", slinkMessageText);
        myCommand.Parameters.AddWithValue("@linkName", slinkNameText);

        myCommand.ExecuteNonQuery();


        myConnection.Close();

        displayLabel.Text = "The changes that have been made are now saved to the database.";

    }
    //enables admin to edit External links
    protected void editLinkPostBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Edit_Link.aspx");
    }

  
    }

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

public partial class Admin_fileUpload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DownloadFile(object sender, EventArgs e)
    {

        //JC - method to use javascript too attach resource as a response, response is used to write data to file on local user machine

        string filePath = "~/files/"+(sender as LinkButton).CommandArgument;
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile(filePath);
        Response.End();
    }
    protected void deleteFile(object sender, EventArgs e)
    {


        

    }
     protected void submitbutton_Click(object sender, EventArgs e)
    {

        //JC - method to submit resources to system, file size validation is used to ensure resource intergity. Random number assigned to name to avoid file name conflicts
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
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('File is too big.')", true);
            }
            else
            {
                //then save it to the Folder
                myimage.SaveAs(Server.MapPath(imgPath));
                // myinfo.Text = "file " + imgPath + " uploaded";
            }

            myinfo.Text = "file " + imgPath + " uploaded";
        }

        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        //JC -  myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        string img = rInt + myimage.FileName;
        string desc = descriptiontext.Text;
        string name = nametext.Text;
        int mod = Convert.ToInt32(modulelist1.SelectedValue);
        string time = DateTime.Now.ToString();

        //JC - SQL query to insert into database

        string query = "INSERT INTO SIS_RESOURCES (Description, filepath, title, moduleID, datetime) VALUES (@description, @image, @name, @module, @date)";

        SqlCommand myCommand = new SqlCommand(query, myConnection);
        //JC - create a parameterised object

        myCommand.Parameters.AddWithValue("@name", name);
        myCommand.Parameters.AddWithValue("@description", desc);
       
        myCommand.Parameters.AddWithValue("@image", img);
         myCommand.Parameters.AddWithValue("@module", mod);
         myCommand.Parameters.AddWithValue("@date", time);




        myCommand.ExecuteNonQuery();



        //JC - feedback to user
        myinfo.Text = "You have successfully added your item!";




        //JC - clear form of data
        nametext.Text = "";
        descriptiontext.Text = "";

        
     


        myConnection.Close();
        //JC - Refresh page to show latest uploaded resource 
        Response.Redirect("fileupload.aspx");

        
    }
    
}

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

public partial class Admin_manageAds : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //JC - If statement to allow or deny access to page based on typeID
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
                //JC - then save it to the Folder
                myimage.SaveAs(Server.MapPath(imgPath));
                // myinfo.Text = "file " + imgPath + " uploaded";
            }

            myinfo.Text = "file " + imgPath + " uploaded";
        }

        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        // JC - myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        string img = "../../files/" + rInt + myimage.FileName;
        string linkname = link.Text;
        string name = nametext.Text;
        
        string time = DateTime.Now.ToString();



        //JC - SQL query to insert into database
        string query = "INSERT INTO SIS_ADS (AlternateText, ImageURL, NavigateURL) VALUES (@name, @image, @link)";

        SqlCommand myCommand = new SqlCommand(query, myConnection);
        //JC - create a parameterised object

        myCommand.Parameters.AddWithValue("@name", name);
        myCommand.Parameters.AddWithValue("@link", linkname);

        myCommand.Parameters.AddWithValue("@image", img);
        




        myCommand.ExecuteNonQuery();



        //JC - feedback to user
        myinfo.Text = "You have successfully added your Ad!";




        //JC - clear form of data
        nametext.Text = "";
        link.Text = "";





        myConnection.Close();
        //JC- reload page to show changes
        Response.Redirect("manageAds.aspx");


    }

}
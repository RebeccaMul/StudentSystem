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


public partial class Lecturer_editModule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
//JC - If statment to allow or deny users to page based on typeID
        if (Session["user"] == null || (Convert.ToInt32(Session["typeID"]) != 6))
        {
            Response.Redirect("../default.aspx");
        }
        else
        {
            string usern = Session["user"].ToString();//allow users with access

            username.Text = usern;
            username1.Text = usern;
        }
    }
    protected void submitbutton_Click(object sender, EventArgs e)
    {
        //JC  - connection to db
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        // JC - myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        string row = Request.QueryString["moduleid"];// request the query string
        string modulechange = moduletext.Text;//assign to text box





        string query2 = "UPDATE [SIS_MODULES] SET suggestedDescriptionChange = @desc WHERE moduleID = @id";//update query


        SqlCommand myCommand = new SqlCommand(query2, myConnection);
        //JC - create a parameterised object


        myCommand.Parameters.AddWithValue("@desc", modulechange);// add values
        myCommand.Parameters.AddWithValue("@id", row);

        myCommand.ExecuteNonQuery();



        //JC - feedback to user
        myinfo.Text = "      You have successfully added your change for Review!!";//info message for user




        //JC - clear form of data
        moduletext.Text = "";



        myConnection.Close();//close connection
    }
   
}
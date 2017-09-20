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

public partial class AcademicProgramManager_deletemodules : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["user"] == null || (Convert.ToInt32(Session["typeID"]) != 4))
        {
            Response.Redirect("../Default.aspx");

        }
        else
        {

            string user = Session["user"].ToString();
            username.Text = user;
            username1.Text = user;

        }

        //It is not a postback on page load do not perform when the deletebutton is pressed.

        if (!IsPostBack)
        {

            //get the querystring data from the URL and store it in a variable.
            //this will be used in the SQL Statement.

            int row = 0;
            if (Request.QueryString["moduleID"] != null)
            {
                //if it does exist in URL then do this...
                row = int.Parse(Request.QueryString["moduleID"]);
            }
            else
            {

            }

            //   string row = Request.QueryString["photoId"];

            //set up object to use the web.config file
            string connectionString = WebConfigurationManager.ConnectionStrings
                ["dbconnect"].ConnectionString;

            //set up connection object called 'myConnection'
            SqlConnection myConnection = new SqlConnection(connectionString);

            //open database communication
            myConnection.Open();

            //create the SQL statement
            string query = "DELETE FROM SIS_MODULES WHERE moduleID=@rowId";

            //set up SQL command and use the SQL and myConnection object
            SqlCommand myCommand = new SqlCommand(query, myConnection);
            //create a parameterised object
            myCommand.Parameters.AddWithValue("@rowId", row);

            //create an sqldatareader object that asks for data from a table
            SqlDataReader rdr = myCommand.ExecuteReader();



            myConnection.Close();
        }
    }
}
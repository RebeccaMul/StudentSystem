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

public partial class AcademicProgramManager_editModules : System.Web.UI.Page
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

        }


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
            string query = "SELECT * FROM SIS_MODULES WHERE moduleID=@rowId";

            //set up SQL command and use the SQL and myConnection object
            SqlCommand myCommand = new SqlCommand(query, myConnection);
            //create a parameterised object
            myCommand.Parameters.AddWithValue("@rowId", row);

            //create an sqldatareader object that asks for data from a table
            SqlDataReader rdr = myCommand.ExecuteReader();



            //when in read mode ask for data
            while (rdr.Read())
            {
                string modulename = rdr["moduleName"].ToString();
                modulenametext.Text = modulename;
                string moduledescription = rdr["moduleDescription"].ToString();
                moduledescriptiontext.Text = moduledescription;
                string units = rdr["units"].ToString();
                unitstext.Text = units;
                string compulsory = rdr["compulsary"].ToString();
                compulsorytext.Text = compulsory;
            }


        }
    }

    protected void module_Click(object sender, EventArgs e)
    {
        // set-up object to use the web.config file
        string connectionString = WebConfigurationManager.ConnectionStrings
            ["dbconnect"].ConnectionString;

        //set-up connection object called 'myConnection'
        SqlConnection myConnection = new SqlConnection(connectionString);

        //open database communication
        myConnection.Open();

        string modulename = modulenametext.Text;
        string moduledescriptiontextupdate = moduledescriptiontext.Text;
        string unitstextupdate = unitstext.Text;
        string compulsorytextupdate = compulsorytext.Text;

        int row = int.Parse(Request.QueryString["moduleID"]);



        //string query = "UPDATE photo SET imageName = @imagenewname WHERE moduleID = @Id";
        string query = null;



        query = "UPDATE SIS_MODULES SET moduleName = @modulenewName, moduleDescription=@modulenewDescription, units=@newmoduleUnits, compulsary=@newmoduleCompulsory WHERE moduleID = @Id";


        SqlCommand myCommand = new SqlCommand(query, myConnection);
        //create a parameterised object
        myCommand.Parameters.AddWithValue("@modulenewName", modulename);
        myCommand.Parameters.AddWithValue("@Id", row);
        myCommand.Parameters.AddWithValue("@modulenewDescription", moduledescriptiontextupdate);
        myCommand.Parameters.AddWithValue("@newmoduleUnits", unitstextupdate);
        myCommand.Parameters.AddWithValue("@newmoduleCompulsory", compulsorytextupdate);


        myCommand.ExecuteNonQuery();

        myConnection.Close();

        Response.Redirect("updatemodules.aspx");




    }
}
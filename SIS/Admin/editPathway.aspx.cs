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

public partial class Admin_editPathway : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //JC - if statement to allow or deny access to page
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

        if (!IsPostBack)
        {
            //JC - method used to pull data from database and insert into textboxes
            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            string row = Request.QueryString["pathwayID"];

            myConnection.Open();

            string query = "SELECT * FROM SIS_PATHWAY WHERE pathwayID=@rowid";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@rowid", row);

            //Data reader used to read date into textboxes in front end
            SqlDataReader rdr = myCommand.ExecuteReader();


            while (rdr.Read())
            {

                

                string mname = rdr["pathwayName"].ToString();
                string mcode = rdr["pathwayCode"].ToString();
                string myear = rdr["pathwayYears"].ToString();
                string ment = rdr["entryRequirements"].ToString();
                string mfac = rdr["faculty"].ToString();
                string msch = rdr["school"].ToString();
                string mover = rdr["overview"].ToString();
           

                name.Text = mname;
                code.Text = mcode;
                year.Text = myear;
                entry.Text = ment;
                fac.Text = mfac;
                school.Text = msch;
                overview.Text = mover;


            

            }
        }
    }
    protected void updatePathway_Click(object sender, EventArgs e)
    {

        //JC - Method used to take edit in textboxes and insert in DB
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();


        //JC - Assigning values to variables to use in SQL
        string uname = name.Text;
        string ucode = code.Text;
        string uyear =  year.Text;
        string uent =entry.Text;
        string ufac = fac.Text;
        string usch = school.Text;
        string uover = overview.Text;


        //JC - Pull pathwayID from the querystring
        string row = Request.QueryString["pathwayID"];




        string query = "UPDATE SIS_PATHWAY SET pathwayName = @uname, pathwayCode = @ucode, pathwayYears = @uyear, entryRequirements = @uent, faculty = @ufac, school = @usch, overview = @uover WHERE pathwayID = @id";

        SqlCommand myCommand = new SqlCommand(query, myConnection);



        //JC - Assignming parameters list for SQL
        myCommand.Parameters.AddWithValue("@uname", uname);
        myCommand.Parameters.AddWithValue("@ucode", ucode);
        myCommand.Parameters.AddWithValue("@uyear", uyear);
        myCommand.Parameters.AddWithValue("@uent", uent);
        myCommand.Parameters.AddWithValue("@ufac", ufac);
        myCommand.Parameters.AddWithValue("@usch", usch);
        myCommand.Parameters.AddWithValue("@uover", uover);
        
        
        myCommand.Parameters.AddWithValue("@id", row);
       

        myCommand.ExecuteNonQuery();

        myConnection.Close();


        //JC - User message
        confirm.Text = "Update Successful";

        //JC - Cleat textboxes
        name.Text = "";
        code.Text = "";
        year.Text = "";
        entry.Text = "";
        fac.Text = "";
        school.Text = "";
        overview.Text = "";


    }



}
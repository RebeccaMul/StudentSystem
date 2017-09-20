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


public partial class Admin_editModule : System.Web.UI.Page
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

            string row = Request.QueryString["moduleID"];
            //JC - Open DB connection
            myConnection.Open();

            string query = "SELECT * FROM SIS_MODULES INNER JOIN SIS_LECTURER ON SIS_LECTURER.lecturerID = SIS_MODULES.lecturerID WHERE moduleID=@rowid";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@rowid", row);

            //Data reader used to read date into textboxes in front end
            SqlDataReader rdr = myCommand.ExecuteReader();


            while (rdr.Read())
            {

                string mcode = rdr["moduleCode"].ToString();
                string mname = rdr["moduleName"].ToString();
                string mdesc = rdr["moduleDescription"].ToString();
                string mdesc2 = rdr["suggestedDescriptionChange"].ToString();
                string munit = rdr["units"].ToString();
                string mcomp = rdr["compulsary"].ToString();
                string mlecturer = rdr["firstName"].ToString();
                string mllecturer = rdr["lastName"].ToString();
                string mlevel = rdr["level"].ToString();
                string msemester = rdr["semester"].ToString();

                string fullname = mlecturer + " " + mllecturer;

                module.Text = mcode;
                name.Text = mname;
                desc.Text = mdesc;
                desc2.Text = mdesc2;
                unit.Text = munit;
                comp.Text = mcomp;
                lecturerfirst.Text = fullname;


                level.Text = mlevel;
                semester.Text = msemester;

            }
        }
    }
    protected void updateModule_Click(object sender, EventArgs e)
    {
        //JC - Method used to take edit in textboxes and insert in DB

        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();

        //JC - Assigning values to variables to use in SQL
        string nmodule = module.Text;
        string nname = name.Text;
        string ndesc = desc.Text;
        string ndesc2 = desc2.Text;
        string nunit = unit.Text;
        string ncomp = comp.Text;
        //string nlecturer = lecturer.Text;
        string nlecturer = lecturervalues.SelectedValue;
        int clecturer = Convert.ToInt32(nlecturer);
        string nlevel = level.Text;
        string nsemester = semester.Text;
        string nStatus = ModuleStatus.SelectedValue;

        //JC - Pull moduleID from the querystring
        string row = Request.QueryString["moduleid"];



        string query = "UPDATE SIS_MODULES SET moduleCode = @nmodule, moduleName = @nname, moduleDescription = @ndesc, suggestedDescriptionChange = @ndesc2, units = @nunits, compulsary = @ncomp, lecturerID = @nlecturer, Level = @nlevel, Semester = @nsemester , Status = @nStatus WHERE moduleID = @id";

        SqlCommand myCommand = new SqlCommand(query, myConnection);



        //JC - Assignming parameters list for SQL
        myCommand.Parameters.AddWithValue("@nmodule", nmodule);
        myCommand.Parameters.AddWithValue("@nname", nname);
        myCommand.Parameters.AddWithValue("@ndesc", ndesc);
        myCommand.Parameters.AddWithValue("@ndesc2", ndesc2);
        myCommand.Parameters.AddWithValue("@nunits", nunit);
        myCommand.Parameters.AddWithValue("@ncomp", ncomp);
        myCommand.Parameters.AddWithValue("@nlecturer", clecturer);
        myCommand.Parameters.AddWithValue("@nlevel", nlevel);
        myCommand.Parameters.AddWithValue("@nsemester", nsemester);
        myCommand.Parameters.AddWithValue("@id", row);
        myCommand.Parameters.AddWithValue("@nStatus", nStatus);

        myCommand.ExecuteNonQuery();

        myConnection.Close();


    }



}
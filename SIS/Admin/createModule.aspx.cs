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
using System.Drawing;

public partial class Admin_createModule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //JC - If statement used to allow or deny access based on typeID
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
    protected void newModuleButton_Click(object sender, EventArgs e)
    {
        //JC - create connection to database
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        //JC  myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        string module = newModule.Text;
        string code = newCode.Text;
        string desc = newDesc.Text;
        string units = newUnits.Text;
        string com = comp.SelectedValue;
        string lecturer = LecturerList.SelectedValue;
        string level = newLevel.Text;
        string semester = newSem.SelectedValue;


        //JC - SQL insert statment for new module
        string query = "INSERT INTO SIS_MODULES (moduleCode, moduleName, moduleDescription, units, compulsary, lecturerID, Level, Semester) VALUES ( @mod, @code, @desc, @units, @com, @lecturer, @level, @semester)";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@mod", module);
        myCommand.Parameters.AddWithValue("@code", code);
        myCommand.Parameters.AddWithValue("@desc", desc);
        myCommand.Parameters.AddWithValue("@units", units);
        myCommand.Parameters.AddWithValue("@com", com);
        myCommand.Parameters.AddWithValue("@lecturer", lecturer);
        myCommand.Parameters.AddWithValue("@level", level);
        myCommand.Parameters.AddWithValue("@semester", semester);

        myCommand.ExecuteNonQuery();
        myConnection.Close();
        
        //JC - Clear fields once new module has been inserted into DB
        newModule.Text = "";
        newCode.Text = "";
        newDesc.Text = "";
        newUnits.Text = "";
        
        newLevel.Text = "";
        
        //JC - user message
        complete.Text = "Add Module Complete";

    }
}
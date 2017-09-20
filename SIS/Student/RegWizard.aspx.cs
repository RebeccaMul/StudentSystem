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

public partial class Student_RegWizard : System.Web.UI.Page
{
    //Declaring values for calculating unit totals
    int unitsTotal = 0;
    int unitsTotal2 = 0;
    int finalTotal = 0;
    string CompMods;
    
    //Author - Rebecca Mulholland

    protected void Page_Load(object sender, EventArgs e)
    {

        //Rebecca - If not logged in, or user is not a student, redirect to default page
        if (Session["user"] == null || (Convert.ToInt32(Session["typeID"]) != 5))
        {
            Response.Redirect("../Default.aspx");

        }
        else
        {
            //Otherwise assign session to username field
            string user = Session["user"].ToString();
           

        }
        //DB Connection:
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);
        myConnection.Open();

        //Getting info from URL
        string uID = Request.QueryString["userID"];
        string sID = Request.QueryString["studentID"];
        int level = Convert.ToInt32(Request.QueryString["level"]);
        
        //If level 1, find compulsory module's events to add to timetable
        if (level == 1)
        {
            string lvl1events = "SELECT * FROM SIS_EVENT WHERE eventID IN (SELECT EventID FROM SIS_EVENT_MODULE WHERE ModuleID = @Mod1 OR ModuleID = @Mod2 OR ModuleID = @Mod3 OR ModuleID = @Mod4 OR ModuleID = @Mod5 OR ModuleID = @Mod6)";

            SqlCommand myCommand = new SqlCommand(lvl1events, myConnection);

            myCommand.Parameters.AddWithValue("@Mod1", 11);
            myCommand.Parameters.AddWithValue("@Mod2", 12);
            myCommand.Parameters.AddWithValue("@Mod3", 40);
            myCommand.Parameters.AddWithValue("@Mod4", 8);
            myCommand.Parameters.AddWithValue("@Mod5", 13);
            myCommand.Parameters.AddWithValue("@Mod6", 14);

            SqlDataReader rdr = myCommand.ExecuteReader();

            //Creating array to store eventIDs:
            var moduleEvents = new List<String>();
            while (rdr.Read())
            {
                moduleEvents.Add(rdr["eventID"].ToString());
            }

            //Storing eventID's in a textbox 
            foreach (string events in moduleEvents)
            {
                Modules.Text += events + " ";
            }

            //Storing eventID's in string
            string eventsNeeded = Modules.Text;

            rdr.Close();
            
        }

        //If level has progressed, automatically enrol & complete previous years modules:
        if (level == 2) {
             //Set first year modules to complete
              string year1update = "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 8"
                  + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 11"
                  + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 12"
                  + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 13"
                  + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 14"
                  + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 40" 
                  + "UPDATE SIS_STUDENT SET L1Complete = 1";
            
            //running update query
            SqlCommand myCommand = new SqlCommand(year1update, myConnection);
            myCommand.Parameters.AddWithValue("@ID", sID);
            myCommand.ExecuteNonQuery();

            //Adding level 2 events
            string lvl2events = "SELECT * FROM SIS_EVENT WHERE eventID IN (SELECT EventID FROM SIS_EVENT_MODULE WHERE ModuleID = @Mod1 OR ModuleID = @Mod2 OR ModuleID = @Mod3 OR ModuleID = @Mod4 OR ModuleID = @Mod5 OR ModuleID = @Mod6)";

            SqlCommand myCommand2 = new SqlCommand(lvl2events, myConnection);

            myCommand2.Parameters.AddWithValue("@Mod1", 30);
            myCommand2.Parameters.AddWithValue("@Mod2", 31);
            myCommand2.Parameters.AddWithValue("@Mod3", 32);
            myCommand2.Parameters.AddWithValue("@Mod4", 16);
            myCommand2.Parameters.AddWithValue("@Mod5", 17);
            myCommand2.Parameters.AddWithValue("@Mod6", 42);

            SqlDataReader rdr = myCommand2.ExecuteReader();

            //Creating array to store eventIDs:
            var moduleEvents = new List<String>();
            while (rdr.Read())
            {
                moduleEvents.Add(rdr["eventID"].ToString());
            }

            //Storing eventID's in a textbox 
            foreach (string events in moduleEvents)
            {
                Modules.Text += events + " ";
            }

            //Storing eventID's in string
            string eventsNeeded = Modules.Text;

            rdr.Close();
          
        }
        if (level == 3)
        {
            //Set second year modules + placement to complete
            string year2update = "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 16"
       + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 17"
       + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 30"
       + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 31"
       + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 32"
       + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 42"
       + "UPDATE SIS_STUDENT_MODULES SET Completed = 1 WHERE studentID = @ID AND moduleSelected = 41"
       + "UPDATE SIS_STUDENT SET L2Complete = 1"
       + "UPDATE SIS_STUDENT SET PlacementComplete = 1";

            //running update query
            SqlCommand myCommand = new SqlCommand(year2update, myConnection);
            myCommand.Parameters.AddWithValue("@ID", sID);
            myCommand.ExecuteNonQuery();

            //Adding level 3 events
            string lvl3events = "SELECT * FROM SIS_EVENT WHERE eventID IN (SELECT EventID FROM SIS_EVENT_MODULE WHERE ModuleID = @Mod1 OR ModuleID = @Mod2 OR ModuleID = @Mod3)";

            SqlCommand myCommand2 = new SqlCommand(lvl3events, myConnection);

            myCommand2.Parameters.AddWithValue("@Mod1", 19);
            myCommand2.Parameters.AddWithValue("@Mod2", 20);
            myCommand2.Parameters.AddWithValue("@Mod3", 28);

            SqlDataReader rdr = myCommand2.ExecuteReader();

            //Creating array to store eventIDs:
            var moduleEvents = new List<String>();
            while (rdr.Read())
            {
                moduleEvents.Add(rdr["eventID"].ToString());
            }

            //Storing eventID's in a textbox 
            foreach (string events in moduleEvents)
            {
                Modules.Text += events + " ";
            }

            //Storing eventID's in string
            string eventsNeeded = Modules.Text;

            rdr.Close();

        }

        myConnection.Close();
        //Updating modules + personal details to reflect changes
        Modules.DataBind();
        StudentDetails.DataBind();

    }

    //Method for calculating total units
    protected void unitscount_DataBinding(object sender, System.EventArgs e)
    {
        //Finding unit values, adding each to quantity's total, then updating literal text with calculated total 
        Literal lt = (Literal)(sender);
        int quantity = Convert.ToInt32((Eval("units")));
        unitsTotal += quantity;
        lt.Text = quantity.ToString();
     
        //Compulsory units total stored
        comptotal.Text = unitsTotal.ToString();

        //Total units updated + displayed
        TotalValue.Text = unitsTotal.ToString();
        TotalValue.Visible = true;

        //Storing unit total to string to carry in URL (for checking at confirmation)
        string linktotal1 = TotalValue.Text;
        int userID = Convert.ToInt32(Request.QueryString["userID"]);
        int studentID = Convert.ToInt32(Request.QueryString["studentID"]);
        int Level = Convert.ToInt32(Request.QueryString["Level"]);
        Modules.DataBind();
        CompMods = Modules.Text;

        //Adding unit total for carrying to modules area (so optional units can be added to total)
        ModLink.NavigateUrl = "RegWizardModules.aspx?UserID=" + userID + "&Level=" + Level + "&studentID=" + studentID;

        ModLink.DataBind();

        //Adding unit total for carrying to confirmation (for 120 units required check)
        ConfirmLink.NavigateUrl = "RegWizardCompMod.aspx?UserID=" + userID + "&Level=" + Level + "&studentID=" + studentID + "&units=" + linktotal1 + "&Events=" + CompMods;

        ConfirmLink.DataBind();

        int linkvis = Convert.ToInt32(linktotal1);

        //If 120 units are acquired, disable the optional module link so students can't go over units
        if (linkvis == 120)
        {
            ModLink.Visible = false;
        }

    }

    protected void unitscount2_DataBinding(object sender, System.EventArgs e)
    {
        //Finding unit values, adding each to quantity's total, then updating literal text with calculated total 
        Literal lt = (Literal)(sender);
        int quantity2 = Convert.ToInt32((Eval("units")));
        unitsTotal2 += quantity2;
        lt.Text = quantity2.ToString();

        //Optional units total stored
        opttotal.Text = unitsTotal2.ToString();
       
        //Total units updated + displayed
        comptotal.DataBind();
        unitsTotal = Convert.ToInt32(comptotal.Text);

        //Re-Calculating final total (compulsory units + added optional units)
        finalTotal = unitsTotal2 + unitsTotal;
        TotalValue2.Text = finalTotal.ToString();
        TotalValue2.DataBind();

        //Display re-calculated total, hide old total
        TotalValue2.Visible = true;
        TotalValue.Visible = false;

        //Storing unit total to string to carry in URL (for checking at confirmation)
        int linktotal = finalTotal;
        int userID = Convert.ToInt32(Request.QueryString["userID"]);
        int studentID = Convert.ToInt32(Request.QueryString["studentID"]);
        int Level = Convert.ToInt32(Request.QueryString["Level"]);
        Modules.DataBind();
        CompMods = Modules.Text;

        //Adding unit total for carrying to modules area (so optional units can be added to total)
        ModLink.NavigateUrl = "RegWizardModules.aspx?UserID=" + userID + "&Level=" + Level + "&studentID=" + studentID;

        ModLink.DataBind();

        //Adding unit total for carrying to confirmation (for 120 units required check)
        ConfirmLink.NavigateUrl = "RegWizardCompMod.aspx?UserID=" + userID + "&Level=" + Level + "&studentID=" + studentID + "&units=" + finalTotal + "&Events=" + CompMods;

        ConfirmLink.DataBind();

        //If 120 units are acquired, disable the optional module link so students can't go over units
        if (finalTotal == 120)
        {
            ModLink.Visible = false;

        }

    }



    //This method requests the up to date student details required to access a specific student's timetable
    //Used if a student updates their details during enrolment
    protected void StudentDetails_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        //Requesting current values for student's info
        int userID = Convert.ToInt32(Request.QueryString["userID"]);
        int studentID = Convert.ToInt32(Request.QueryString["studentID"]);
        int Level = Convert.ToInt32(Request.QueryString["Level"]);
        Modules.DataBind();
        string Events = Modules.Text;

        //Creating personalised timetable link with updated student details
        HyperLink Timetable = (HyperLink)e.Item.FindControl("Timetable");
        Timetable.NavigateUrl = "RegTimetable.aspx?UserID=" + userID + "&Level=" + Level + "&studentID=" + studentID + "&Events=" + Events;
    }
}

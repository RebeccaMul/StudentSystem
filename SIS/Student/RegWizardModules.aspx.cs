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

public partial class Student_RegWizardModules : System.Web.UI.Page
{
    int compTotal = 0;
    int chosenTotal = 0;
    int finalTotal = 0;

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

    }

    //Method counting compulsory module only units
    protected void compcount_DataBinding(object sender, System.EventArgs e)
    {
        //Counts the units of compulsory modules, stores them in quantity, then displays them in the literal value
        Literal lt = (Literal)(sender);
        int quantity = Convert.ToInt32((Eval("units")));
        compTotal += quantity;
        lt.Text = quantity.ToString();

        //Stores to string
        compT.Text = compTotal.ToString();

        //Displays calculated value
        TotalValue.Text = compTotal.ToString();
        TotalValue.Visible = true;

        //If units = 120, removes option to select more modules (prevents over 120 units occuring)
        if (compTotal == 120)
        {
            Selection.Visible = false;
            NoSelect.Visible = true;
        }

    }

    //Method to count the chosen module units:
    protected void chosencount_DataBinding(object sender, System.EventArgs e)
    {
        //Counts the units of chosen modules, stores them in quantity, then displays them in the literal value
        Literal lt = (Literal)(sender);
        int quantity2 = Convert.ToInt32((Eval("units")));
        chosenTotal += quantity2;
        lt.Text = quantity2.ToString();

        //Saves compulsory value in string
        chosenT.Text = chosenTotal.ToString();

        //Updates and stores compulsory modules value
        compT.DataBind();
        compTotal = Convert.ToInt32(compT.Text);

        //Calculates final total by adding compulsory units to chosen units
        finalTotal = compTotal + chosenTotal;
        TotalValue2.Text = finalTotal.ToString();
        TotalValue2.DataBind();

        //Shows newly calculated compulsory + chosen units value, hides old value (just compulsory) 
        TotalValue2.Visible = true;
        TotalValue.Visible = false;

        //If 120 units accumulated, remove option to add more modules (prevents over 120 units occuring)
        if (finalTotal == 120)
        {
            Selection.Visible = false;
            NoSelect.Visible = true;
        }

    }

    //Method runs when user clicks confirm, checks for correct amount of units & confirms or rejects
    protected void ConfirmBtn_Click(object sender, EventArgs e)
    {
        TotalValue.DataBind();
        TotalValue2.DataBind();
        int units1 = Convert.ToInt32(TotalValue.Text);
        int units2 = Convert.ToInt32(TotalValue2.Text);

        string uID = Request.QueryString["userID"];
        string sID = Request.QueryString["studentID"];
        string level = Request.QueryString["level"];

        //If either unit count is fulfilled, redirect back to main wizard
        if (units1 == 120 || units2 == 120)
        {
            //Redirect to add compulsory modules:
            Response.Redirect("RegWizardCompMod.aspx?UserID=" + uID + "&studentID=" + sID + "&level=" + level);
        }
        else
        {
            //Alert user they have insufficient units
            Response.Write("<script>alert('Please ensure you have selected 120 units.');</script>");
        }
    }

}





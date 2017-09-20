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

public partial class Student_RegWizardFinance : System.Web.UI.Page
{
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

        //It is not a postback / on page load / do not perform when save button pressed
        if (!IsPostBack)
        {


            //Getting userID from URL
            int userID = Convert.ToInt32(Request.QueryString["UserID"]);

            //RMU - DB Connection:
            string connectionString = WebConfigurationManager.ConnectionStrings
                ["dbconnect"].ConnectionString;

            SqlConnection myConnection = new SqlConnection(connectionString);

            myConnection.Open();

            string query = "SELECT * FROM SIS_FINANCE WHERE studentID=@Id";


            SqlCommand myCommand = new SqlCommand(query, myConnection);


            myCommand.Parameters.AddWithValue("@Id", userID);

            SqlDataReader rdr = myCommand.ExecuteReader();

            while (rdr.Read())
            {

                string other = rdr["other"].ToString();
                Other.Text = other;
                bool sfni = Convert.ToBoolean(rdr["SFNI"]);
                SFNIBox.Checked = sfni;
                bool othermethod = Convert.ToBoolean(rdr["otherPaymentMethod"]);
                OtherBox.Checked = othermethod;

            }

            Other.DataBind();
            SFNIBox.DataBind();
            OtherBox.DataBind();

            myConnection.Close();

        }
    }


    protected void EditBtn_Click(object sender, EventArgs e)
    {

        if (SFNIBox.Checked == false && OtherBox.Checked == false)
        {

            Response.Write("<script>alert('Please tick one of the payment methods.');</script>");

        }
        else
        {

            string other = Other.Text;
            string SFNI = Convert.ToString(SFNIBox.Checked);
            string OtherMethod = Convert.ToString(OtherBox.Checked);

            int row = int.Parse(Request.QueryString["UserID"]);
            int sID = int.Parse(Request.QueryString["studentID"]);
            string level = Request.QueryString["Level"];

            //Fix link:
            //RMU - Redirect back to FinanceUpdate with new updated details
            Response.Redirect("RegWizardFinanceUpdate.aspx?Other=" + other + "&SFNI=" + SFNI + "&OtherMethod=" + OtherMethod + "&UserID=" + row + "&studentID=" + sID + "&Level=" + level);
        }
    }
}

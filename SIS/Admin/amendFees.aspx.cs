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

public partial class Admin_amendFees : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            //JC- Method used to read data from database table and insert into listview
            //JC - Open DB connection
            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            //JC - Pull correct details via StudentID in querystring
            string row = Request.QueryString["StudentID"];

            myConnection.Open();

            string query = "SELECT * FROM SIS_FINANCE WHERE studentID=@rowid";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@rowid", row);

            //JC - Using reader to assign DB info to textboxes
            SqlDataReader rdr = myCommand.ExecuteReader();


            while (rdr.Read())
            {

                string fee1 = rdr["amountPaid"].ToString();
                string fee2 = rdr["feesOutstanding"].ToString();

                pfee.Text = fee1;

                ofee.Text = fee2;



            }
        }
    }

    protected void updateFee_onClick(object sender, EventArgs e)
    {
        //JC -  method used to update the fees page, data in textbox read and insert in DB for right record using StudentID
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);
        //JC - Open connection
        myConnection.Open();

        string fee1 = pfee.Text;
        string fee2 = ofee.Text;
        int payment = Convert.ToInt32(feedropdown.SelectedValue);

        string row = Request.QueryString["studentID"];
        string query = "UPDATE SIS_FINANCE SET amountPaid = @feepaid, feesOutstanding = @feeout, financeComplete = @done WHERE studentID = @id";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@feepaid", fee1);
        myCommand.Parameters.AddWithValue("@feeout", fee2);
        myCommand.Parameters.AddWithValue("@done", payment);
        myCommand.Parameters.AddWithValue("@id", row);

        myCommand.ExecuteNonQuery();

        myConnection.Close();
        //JC - Javascript message used to inform user with message
        ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Student Finance Successfully Amended');", true);
    }





}


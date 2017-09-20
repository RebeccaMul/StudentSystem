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

public partial class Lecturer_uploadresults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {



            if (Session["user"] == null || (Convert.ToInt32(Session["typeID"]) != 6))//deny users with no access
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
        int assignment = Convert.ToInt32(Request.QueryString["assignmentID"]);
        int student = Convert.ToInt32(Request.QueryString["studentID"]);
        int moduleid = Convert.ToInt32(Request.QueryString["moduleid"]);
        int lecturerID = Convert.ToInt32(Request.QueryString["lecturerID"]);

        int markno = Convert.ToInt32(Request.QueryString["input"]);
        decimal marknum = Convert.ToDecimal(markno);
        decimal weightvalue;
      
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;//connection to db

        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();//open connection to db

        

              string query = "SELECT * FROM SIS_ASSIGNMENT WHERE assignmentID = @aid";

              SqlCommand myCommand = new SqlCommand(query, myConnection);

                myCommand.Parameters.AddWithValue("@aid", assignment);

            SqlDataReader rdr = myCommand.ExecuteReader();

            while (rdr.Read())
            {
                string weight = rdr["assignmentWeight"].ToString();
                Weight.Text = weight;
               
            }


            Weight.DataBind();
            weightvalue = Convert.ToDecimal(Weight.Text);


        decimal total = 100;
        decimal percentOne = marknum / total * weightvalue;
        string linkPercent = percentOne.ToString();

        percentageLabel.Text = percentOne.ToString("n2");
        markvalue.Text = markno.ToString();
        Totalvalue.Text = total.ToString();
        Weight2.Text = weightvalue.ToString();
        percentagevalue.Text = linkPercent;


        Response.Redirect("uploadResultsAdd2.aspx?moduleid=" + moduleid + "&lecturerID=" + lecturerID + "&percent=" + linkPercent + "&assignmentID=" + assignment + "&studentID=" + student);
    



        }
    }

    

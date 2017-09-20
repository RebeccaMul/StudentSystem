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

public partial class Admin_Edit_Link : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["user"] == null)
        {
            Response.Redirect("../Default.aspx");
        }
        else if ((Convert.ToInt32(Session["typeID"]) != 1))
        {

        }
        else
        {
            string user = Session["user"].ToString();
            username.Text = user;
            username1.Text = user;
        }

        if (!IsPostBack)
        {

            int row = 0;
            if (Request.QueryString["linkID"] != null)
            {
                row = int.Parse(Request.QueryString["linkID"]);
            }
            else
            {
                Response.Redirect("Edit_Link.aspx");
            }

                //set-up object to use the web.config file


                string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection myConnection = new SqlConnection(connectionString);

                myConnection.Open();

                string query = "SELECT * FROM SIS_EXTERNAL_LINKS WHERE linkID = @rowID";

                string date = DateTime.Now.ToString("dd/MM/yyyy");

                SqlCommand myCommand = new SqlCommand(query, myConnection);

                myCommand.Parameters.AddWithValue("@rowID", row);


                SqlDataReader rdr = myCommand.ExecuteReader();


                while (rdr.Read())
                {

                    string sLinkName1Update = rdr["linkName"].ToString();
                    string sLinkNameUpdate = rdr["linkMessage"].ToString();





                    linkMessage.Text = sLinkNameUpdate;
                    linkName.Text = sLinkName1Update;


                }
            }

        }
    
    
    

    protected void saveBtn_Click(object sender, EventArgs e)
    {


            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            // myConnection.ConnectionString is now set to connectionString.
            myConnection.Open();

            string sLinkNameUpdate = linkMessage.Text;
            string sLinkNameUpdate1 = linkName.Text;
                
                
            string userType = usertypeList.SelectedValue;
            int typeID = Convert.ToInt32(userType);

           
                int row = Convert.ToInt32(Request.QueryString["linkID"]);
               
        string query = "UPDATE SIS_EXTERNAL_LINKS SET linkType = @newlinkDetailsID, linkMessage = @newLinkMessage, linkName = @newLinkName WHERE linkID = @rowid";

                SqlCommand myCommand = new SqlCommand(query, myConnection);

                myCommand.Parameters.AddWithValue("@newlinkDetailsID", userType);
                myCommand.Parameters.AddWithValue("@newLinkMessage", sLinkNameUpdate);
                myCommand.Parameters.AddWithValue("@newLinkName", sLinkNameUpdate1);
                myCommand.Parameters.AddWithValue("@rowid", row);

                myCommand.ExecuteNonQuery();

                myConnection.Close();
    

                displayLabel.Text = "The changes that have been made are now saved to the database.";
}

           
        
    

    protected void cancelBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Edit_Link.aspx");
    }
    protected void deleteBtn_Click(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);

        //myconnection.ConnectionString is now set to connectionString
        myConnection.Open();

        int row = int.Parse(Request.QueryString["linkID"]);

        string query = "DELETE FROM SIS_EXTERNAL_LINKS WHERE (linkID = @rowid)";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@rowID", row);


        myCommand.ExecuteNonQuery();

        myConnection.Close();

        Response.Redirect("Edit_Link.aspx");
    }
}

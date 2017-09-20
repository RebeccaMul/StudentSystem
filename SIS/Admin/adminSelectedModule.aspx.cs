using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_adminSelectedModule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
   
    protected void sendresults_Click(object sender, EventArgs e)
    {
        string moduleid = Request.QueryString["moduleid"];//request the query string
        string lecturerid = Request.QueryString["lecturerID"];//request the query string
        Response.Redirect("adminuploadresults.aspx?moduleid=" + moduleid + "&lecturerID=" + lecturerid);//redirect user with querystring assigned to url
    }
    

}
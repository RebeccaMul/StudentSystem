using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lecturer_selectedModule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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
    protected void sendemail_Click(object sender, EventArgs e)
    {
        string moduleid = Request.QueryString["moduleid"];
        Response.Redirect("groupemail.aspx?moduleid=" + moduleid);
    }
    protected void sendresults_Click(object sender, EventArgs e)
    {
        string moduleid = Request.QueryString["moduleid"];//request the query string
        string lecturerid = Request.QueryString["lecturerID"];//request the query string
        Response.Redirect("uploadresults.aspx?moduleid=" + moduleid + "&lecturerID=" + lecturerid);//redirect user with querystring assigned to url
    }
    protected void editdesc_Click(object sender, EventArgs e)
    {
        string moduleid = Request.QueryString["moduleid"];//request the query string
        Response.Redirect("editmodule.aspx?moduleid=" + moduleid);//redirect user with querystring assigned to url

    }
    protected void viewlist_Click(object sender, EventArgs e)
    {
        string moduleid = Request.QueryString["moduleid"];//request the query string
        Response.Redirect("classList.aspx?moduleid=" + moduleid);//redirect user with querystring assigned to url

    }
   
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lecturer_resultsModule : System.Web.UI.Page
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

            displayuser.Text = usern;
        }
    }
    protected void sendresults_Click(object sender, EventArgs e)
    {
        string moduleid = Request.QueryString["moduleid"];//request query string from url
        Response.Redirect("submitresults.aspx?moduleid=" + moduleid);//rediret user with query string assigned
    }
}
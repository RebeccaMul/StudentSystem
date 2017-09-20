using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SeniorUniversityManager_lecturerSearchCalendar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null || (Convert.ToInt32(Session["typeID"]) != 3))
        {
            Response.Redirect("../Default.aspx");

        }
        else
        {
            string user = Session["user"].ToString();
            username.Text = user;
            username1.Text = user;

        }
        DateLabel.Text = Request.QueryString["eventID"];
        DateLabel2.Text = Request.QueryString["event2ID"];
        DateLabel3.Text = Request.QueryString["event3ID"];
        DateLabel4.Text = Request.QueryString["event4ID"];
        DateLabel5.Text = Request.QueryString["event5ID"];

    }
}
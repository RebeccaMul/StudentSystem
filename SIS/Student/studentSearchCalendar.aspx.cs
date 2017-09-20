using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_studentSearchCalendar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateLabel.Text = Request.QueryString["eventID"];
        DateLabel2.Text = Request.QueryString["event2ID"];
        DateLabel3.Text = Request.QueryString["event3ID"];
        DateLabel4.Text = Request.QueryString["event4ID"];
        DateLabel5.Text = Request.QueryString["event5ID"];

        string user = Session["user"].ToString();
      

    }
}
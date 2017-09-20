using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lecturer_lecturerDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //If not logged in, or user is not a student, redirect to default page
        if (Session["user"] == null || (Convert.ToInt32(Session["typeID"]) != 6))
        {
            Response.Redirect("../Default.aspx");

        }
        else
        {
            //Otherwise assign session to username field
            string user = Session["user"].ToString();
            username.Text = user;
            username1.Text = user;
        }
    }
}
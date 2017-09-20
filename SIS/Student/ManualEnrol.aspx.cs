using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SIS2_Student_ManualEnrol : System.Web.UI.Page
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

        }


    }
}
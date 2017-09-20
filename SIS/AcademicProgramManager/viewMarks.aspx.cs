using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SIS2_AcademicProgramManager_viewMarks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["user"] == null)
        {
            Response.Redirect("../Default.aspx");

        }
        else if ((Convert.ToInt32(Session["typeID"]) != 4))
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
}
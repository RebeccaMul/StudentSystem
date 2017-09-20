using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SENIORUNIVERSITYMANAGER_Lecturers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null || (Convert.ToInt32(Session["typeID"]) != 1))
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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SeniorUniversityManager_viewModuleSUM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["user"] == null || (Convert.ToInt32(Session["typeID"]) != 3))//deny users with no access
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

}
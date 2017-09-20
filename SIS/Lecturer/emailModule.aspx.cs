using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lecturer_emailModule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //JC - If statment to allow or deny users to page based on typeID
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

}
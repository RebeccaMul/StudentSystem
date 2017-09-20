using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SeniorUniversityManager_ClassListSUM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("../Default.aspx");

        }
        else if ((Convert.ToInt32(Session["typeID"]) != 3))
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
    protected void Searchbtn_Click(object sender, EventArgs e)
    {
        String stext = searchtitle.Text;

        Response.Redirect("classListSUM.aspx?searchquery=" + stext);
        //    SearchResults.Visible = true;

    }
    protected void sendemail_Click(object sender, EventArgs e)
    {
        string moduleid = Request.QueryString["moduleid"];
        Response.Redirect("groupemail.aspx?moduleid=" + moduleid);
    }

    protected void viewContact_Click(object sender, EventArgs e)
    {
        string moduleid = Request.QueryString["moduleid"];//request the query string
        Response.Redirect("classListContactDetailsSUM.aspx?moduleid=" + moduleid);//redirect user with querystring assigned to url

    }


}
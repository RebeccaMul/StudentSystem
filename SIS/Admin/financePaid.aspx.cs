using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_financePaid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //JC - If statement to allow or deny access to page based on typeID
        if (Session["user"] == null)
        {
            Response.Redirect("../Default.aspx");

        }
        else if ((Convert.ToInt32(Session["typeID"]) != 1))
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
        //JC - Simple method to allow user to search for student, a SQL search is used in front end using the stext
        String stext = searchtitle.Text;

        Response.Redirect("financepaid.aspx?searchquery=" + stext);
        //    SearchResults.Visible = true;

    }
}
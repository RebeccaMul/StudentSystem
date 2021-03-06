using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lecturer_viewModules : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("../Default.aspx");

        }
        else if ((Convert.ToInt32(Session["typeID"]) != 6))
        {
            Response.Redirect("../Default.aspx");
        }
        else
        {

            string user = Session["user"].ToString();
            username.Text = user;
            username1.Text = user;

        }

        string search = Request.QueryString["searchquery"];

        if (search != null)
        {
            defaultDetails.Visible = false;
            searchresults.Visible = true;
        }
    }

    protected void Searchbtn_Click(object sender, EventArgs e)
    {
        String stext = searchbox.Text;

        string pathway = Request.QueryString["pathwayName"];

        Response.Redirect("viewModules.aspx?pathwayName=" + pathway + "&searchquery=" + stext);

        //SearchResults.Visible = true;

    }

}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Admin_Edit_Notification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["user"] == null)
            Response.Redirect("../Default.aspx");
        else
        {
            string user = Session["user"].ToString();
            username.Text = user;
            username1.Text = user;
        }
       
    }
}
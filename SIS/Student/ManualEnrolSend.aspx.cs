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

using System.Net.Mail;
using System.Net;

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


        string aEmail = Request.QueryString["email"];
        string aName = Request.QueryString["fname"];
        string alName = Request.QueryString["lName"];
        string sNum = Request.QueryString["sNum"];
        string sName = Request.QueryString["sName"];
        string sLName = Request.QueryString["sLName"];


        try
        {
            //Mail message set-up
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("agiletester057@gmail.com");
            msg.To.Add(aEmail);
            msg.Subject = "Manual Enrolment Request for " + sName + " " + sLName + " (" + sNum + ")";
            msg.Body = "Dear " + aName + " " + alName + ", \n \n" + "You have received a Manual enrolment request from " + sName + " " + sLName + " (" + sNum + ")" + "\n \nAs Advisor of Studies, please contact this student to begin the process.";
            SmtpClient smt = new SmtpClient("smtp.gmail.com", 587);
            smt.Credentials = new System.Net.NetworkCredential("agiletester057@gmail.com", "(password)");
            smt.EnableSsl = true;
            smt.Send(msg);
        }
        catch (Exception ex)
        {
            Response.Write("Could not send the e-mail - error: " + ex.Message);
        }
        

    }
}
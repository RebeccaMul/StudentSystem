using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail;
using System.Net;
using System.Collections;

public partial class Lecturer_emailTutee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
    protected void send_Click(object sender, EventArgs e)
    {


        
            //Array list to hold selected email ids
            ArrayList emailArray = new ArrayList();
            //Looping through rows of GridView
            foreach (GridViewRow item in GridView1.Rows)
            {
                //Creating checkbox object using the find control method
                CheckBox cb = (CheckBox)item.Cells[1].FindControl("CheckBox1");
                //CheckBox cb = (CheckBox)item.FindControl("CheckBox1");
                //Checking whether checkbox is checked or not
                if (cb.Checked)
                {
                    //If checked Adding email id to Arraylist

                    emailArray.Add(GridView1.DataKeys[item.RowIndex]["email"].ToString());
                }
            }
            //Looping through the email id list
            foreach (string email in emailArray)
            {
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("siscsc3047@gmail.com");
                msg.To.Add(email);

                msg.Subject = subjecttext.Text;
                msg.Body = TextBox1.Text;
                SmtpClient smt = new SmtpClient("smtp.gmail.com", 587);
                smt.Credentials = new System.Net.NetworkCredential("siscsc3047@gmail.com", "queensbelfast");
                smt.EnableSsl = true;
                smt.Send(msg);
                ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Email Sent');", true);
                //}
            }
            subjecttext.Text = "";
            TextBox1.Text = "";
          
        }

    protected void clearCheck_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow item in GridView1.Rows)
        {
            CheckBox cb = (CheckBox)item.Cells[1].FindControl("CheckBox1");
            if (cb != null)
                cb.Checked = false;

        }
    }
}

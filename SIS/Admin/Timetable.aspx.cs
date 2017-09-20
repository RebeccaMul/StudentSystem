using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Timetable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
    protected void CalendarSelect_SelectionChanged(object sender, EventArgs e)
    {


        date.Text = CalendarSelect.SelectedDates[0].ToShortDateString();
        date2.Text = CalendarSelect.SelectedDates[1].ToShortDateString();
        date3.Text = CalendarSelect.SelectedDates[2].ToShortDateString();
        date4.Text = CalendarSelect.SelectedDates[3].ToShortDateString();
        date5.Text = CalendarSelect.SelectedDates[4].ToShortDateString();

    }
    protected void CalendarSelect_DayRender(object sender, DayRenderEventArgs e)
    {

        e.Day.IsSelectable = false;

    }
    protected void search_Click(object sender, EventArgs e)
    {
        Response.Redirect("searchcalendar.aspx?eventid=" + date);
    }
    protected void search_Click1(object sender, EventArgs e)
    {
        Response.Redirect("searchcalendar.aspx?eventid=" + date.Text + "&event2id=" + date2.Text + "&event3id=" + date3.Text + "&event4id=" + date4.Text + "&event5id=" + date5.Text);
    }


}

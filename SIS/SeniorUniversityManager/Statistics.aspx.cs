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
using System.Drawing;

public partial class SENIORUNIVERSITYMANAGER_Statistics : System.Web.UI.Page
{

    int feeTotal = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

       
        //Rebecca - If no session exists, or if  not a Senior University Manager, redirect to default page.
        if (Session["user"] == null || (Convert.ToInt32(Session["typeID"]) != 3))
        {
            Response.Redirect("../Default.aspx");

        }
        else
        {
            //Otherwise, store session in username field.
            string user = Session["user"].ToString();
            username.Text = user;
            username1.Text = user;

            // Rebecca:
            //////////////////////////////////////////////// CALCULATIONS /////////////////////////////////////////////////

            //1 Student Count
            //Databinding the completed listview
            StudentList.DataBind();

            //Counting number of students
            int sum = StudentList.Items.Count();

            //Placing student count in label
            if (sum == 0)
            {
                studentCount.Text = "No students on record";
            }
            else
            {
                studentCount.Text = Convert.ToString(sum);
            }

            //2 Dropped Out Count
            //Databinding the completed listview
            DroppedOutStudents.DataBind();
            //Counting number of students dropped out
            int droppedOut = DroppedOutStudents.Items.Count();

            //If no students are dropped out set the label to 0, otherwise put the number of students counted in the label.
            if (droppedOut == 0)
            {
                studentDropped.Text = "0";
            }
            else
            {
                studentDropped.Text = Convert.ToString(droppedOut) + " students have left a course.";
            }

            //Calculating drop out rate:
            decimal DropOut = Decimal.Divide(droppedOut, sum) * 100;
            double dropOutRate = Convert.ToInt32(DropOut);
            PercentageDroppedOut.Text = Convert.ToString(dropOutRate) + "%";


            //3 Caculating Retention:
            int retention = sum - droppedOut;
            Retention.Text = Convert.ToString(retention) + " students have remained on course.";

            //Retention Rate:
            decimal retent = Decimal.Divide(retention, sum) * 100;
            double RetentionRate = Convert.ToInt32(retent);
            retentionRate.Text = Convert.ToString(RetentionRate) + "%";

            //4 Enrolled Count
            //Databinding the completed listview
            EnrolledStudents.DataBind();
            //Counting number of students enrolled
            int enrolled = EnrolledStudents.Items.Count();

            //If no students are counted set the label to 0, otherwise put the number of students counted in the label.
            if (enrolled == 0)
            {
                studentEnrolled.Text = "0";
            }
            else
            {
                studentEnrolled.Text = Convert.ToString(enrolled);
            }

            //Calculating enrolled rate:
            decimal Enrolled = Decimal.Divide(enrolled, sum) * 100;
            double EnrolledRate = Convert.ToInt32(Enrolled);
            enrolledRate.Text = Convert.ToString(EnrolledRate) + "%";

            //5 Counting all results on record
            results.DataBind();
            int resultnum = results.Items.Count();

            //6 Results Passed Count
            //Databinding the completed listview
            Passed.DataBind();

            //Counting number of pass results
            int passnum = Passed.Items.Count();

            //Placing pass count in label
            if (passnum == 0)
            {
                pass.Text = "No pass results on record.";
            }
            else
            {
                pass.Text = Convert.ToString(passnum) + " students have pass results.";
            }

            //Calculating pass rate:
            decimal PassedRate = Decimal.Divide(passnum, resultnum) * 100;
            double PassRate = Convert.ToInt32(PassedRate);
            passrate.Text = Convert.ToString(PassRate) + "%";


            //7 Results Failed Count
            //Databinding the completed listview
            Failed.DataBind();

            //Counting number of fail results
            int failnum = Failed.Items.Count();

            //Placing pass count in label
            if (failnum == 0)
            {
                fail.Text = "No fail results on record.";
            }
            else
            {
                fail.Text = Convert.ToString(failnum) + " students have fail results.";
            }

            //Calculating pass rate:
            decimal FailedRate = Decimal.Divide(failnum, resultnum) * 100;
            double FailRate = Convert.ToInt32(FailedRate);
            failrate.Text = Convert.ToString(FailRate) + "%";

            //8 Fees Unpaid Count
            //Databinding the completed listview
            unpaidlist.DataBind();

            //Counting number of unpaid fees
            int unpaidnum = unpaidlist.Items.Count();

            //Placing unpaid fee count in label
            if (unpaidnum == 0)
            {
                feesunpaid.Text = "No records";
            }
            else
            {
                feesunpaid.Text = Convert.ToString(unpaidnum) + " students have no payments.";
            }

            //Calculating unpaid rate:
            decimal UnpaidRate = Decimal.Divide(unpaidnum, sum) * 100;
            double unpaidrate = Convert.ToInt32(UnpaidRate);
            feesunpaidrate.Text = Convert.ToString(unpaidrate) + "%";

            //9 Fees Paid Count
            //Databinding the completed listview
            paidlist.DataBind();

            //Counting number of fail results
            int paidnum = paidlist.Items.Count();

            //Placing paid count in label
            if (unpaidnum == 0)
            {
                feespaid.Text = "No records";
            }
            else
            {
                feespaid.Text = Convert.ToString(paidnum) + " students have paid off their fees.";
            }

            //Calculating paid rate:
            decimal PaidRate = Decimal.Divide(paidnum, sum) * 100;
            double paidrate = Convert.ToInt32(PaidRate);
            feespaidrate.Text = Convert.ToString(paidrate) + "%";

            //10 Payments Made Count
            //Databinding the completed listview
            paymentlist.DataBind();

            //Counting number of payments
            int paymentnum = paymentlist.Items.Count();

            //Placing payments count in label
            if (paymentnum == 0)
            {
                paymade.Text = "No records";
            }
            else
            {
                paymade.Text = Convert.ToString(paymentnum) + " students have made a payment.";
            }

            //Calculating payments rate:
            decimal paymentRate = Decimal.Divide(paymentnum, sum) * 100;
            double Payrate = Convert.ToInt32(paymentRate);
            paymentsrate.Text = Convert.ToString(Payrate) + "%";

            //4 Progression Count
            //Databinding the completed listview
            firstyearlist.DataBind();
            //Counting number of students dropped out
            int first = firstyearlist.Items.Count();

            if (first == 0)
            {
                FirstPercent.Text = "0";
            }
            else
            {
                FirstPercent.Text = Convert.ToString(first) + " first years.";
            }

            //Calculating first year rate:
            decimal firstP = Decimal.Divide(first, sum) * 100;
            double firstRate = Convert.ToInt32(firstP);
            FirstCount.Text = Convert.ToString(firstRate) + "%";

            //Databinding the completed listview
            secondyearlist.DataBind();
            //Counting number of students dropped out
            int second = secondyearlist.Items.Count();
        
            if (second == 0)
            {
                SecondPercent.Text = "0";
            }
            else
            {
                SecondPercent.Text = Convert.ToString(second) + " second years.";
            }

            //Calculating second year rate:
            decimal secondP = Decimal.Divide(second, sum) * 100;
            double secondRate = Convert.ToInt32(secondP);
            SecondCount.Text = Convert.ToString(secondRate) + "%";

            //Databinding the completed listview
            thirdyearlist.DataBind();
            //Counting number of students dropped out
            int third = thirdyearlist.Items.Count();

            if (third == 0)
            {
                ThirdPercent.Text = "0";
            }
            else
            {
                ThirdPercent.Text = Convert.ToString(third) + " third years.";
            }


            //Calculating third year rate:
            decimal thirdP = Decimal.Divide(third, sum) * 100;
            double thirdRate = Convert.ToInt32(thirdP);
            ThirdCount.Text = Convert.ToString(thirdRate) + "%";





            ////////////////////////////////// CHARTS: ///////////////////////////////////////////////

            //Chart 1 - Enrolled & not enrolled student values for x & y axis:
            int notenrolled = sum - enrolled;
            int[] chart1yValues = { notenrolled, enrolled };
            string[] chart1xValues = { "Unregistered", "Enrolled" };
            //Adding values above to chart:
            Chart1.Series["Series1"].Points.DataBindXY(chart1xValues, chart1yValues);
            //Styling Chart:
            Chart1.Series["Series1"].Font = new Font("Calibri", 11, FontStyle.Bold);
            Chart1.Series["Series1"]["PointWidth"] = "5";
            Chart1.Series["Series1"].Points[0].Color = Color.CadetBlue;
            Chart1.Series["Series1"].Points[1].Color = Color.DarkCyan;


            //Chart 2 - Student Results values for x & y axis:
            int[] resultyValues = { passnum, failnum };
            string[] resultxValues = { "Passed", "Failed" };
            //Adding values above to chart:
            ResultsChart.Series["Series1"].Points.DataBindXY(resultxValues, resultyValues);
            //Styling Chart:
            ResultsChart.Series["Series1"].Font = new Font("Calibri", 11, FontStyle.Bold);
            ResultsChart.Series["Series1"]["PointWidth"] = "0.1";
            ResultsChart.Series["Series1"].Points[0].Color = Color.MediumSeaGreen;
            ResultsChart.Series["Series1"].Points[1].Color = Color.Firebrick;


            //Chart 3 - bar chart drop out/retention values for x & y axis:
            int[] dropyValues = { sum, retention, droppedOut };
            string[] dropxValues = { "Total Students", "Retention", "Dropped out" };
            //Adding values above to chart:
            DropChart.Series["Series1"].Points.DataBindXY(dropxValues, dropyValues);
            //Styling Chart:
            DropChart.Series["Series1"].Font = new Font("Calibri", 11, FontStyle.Bold);
            DropChart.Series["Series1"].Points[0].Color = Color.Goldenrod;
            DropChart.Series["Series1"].Points[1].Color = Color.DarkGray;
            DropChart.Series["Series1"].Points[2].Color = Color.Peru;


            //Chart 4 - Finance values for x & y axis:
            int[] financeyValues = { paidnum, unpaidnum, paymentnum };
            string[] financexValues = { "Fees Paid", "Fees Unpaid", "Payments Made" };
            //Adding values above to chart:
            FinanceChart.Series["Series1"].Points.DataBindXY(financexValues, financeyValues);
            //Styling Chart:
            FinanceChart.Series["Series1"].Font = new Font("Calibri", 11, FontStyle.Bold);
            FinanceChart.Series["Series1"]["PointWidth"] = "0.1";
            FinanceChart.Series["Series1"].Points[0].Color = Color.Thistle;
            FinanceChart.Series["Series1"].Points[1].Color = Color.RosyBrown;
            FinanceChart.Series["Series1"].Points[2].Color = Color.LightGoldenrodYellow;

            //Chart 5 - Progression values for x & y axis:
            int[] progressyValues = { first, second, third };
            string[] progressxValues = { "First", "Second", "Third" };
            //Adding values above to chart:
            ProgressChart.Series["Series1"].Points.DataBindXY(progressxValues, progressyValues);
            //Styling Chart:
            ProgressChart.Series["Series1"].Font = new Font("Calibri", 11, FontStyle.Bold);
            ProgressChart.Series["Series1"]["PointWidth"] = "0.1";
            ProgressChart.Series["Series1"].Points[0].Color = Color.SlateGray;
            ProgressChart.Series["Series1"].Points[1].Color = Color.DarkSlateBlue;
            ProgressChart.Series["Series1"].Points[2].Color = Color.Lavender;

        }


    }

    //Counting up amountPaid values in the listview and displaying the total value in a literal text
    protected void feescount_DataBinding(object sender, System.EventArgs e)
    {
        Literal lt = (Literal)(sender);
        int quantity = Convert.ToInt32((Eval("amountPaid")));
        feeTotal += quantity;
        lt.Text = quantity.ToString();

        //Display total fees paid calculated:
        TotalValue.Text = feeTotal.ToString();
        TotalValue.Visible = true;


    
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Web.Configuration;



public partial class Student_Transcript : System.Web.UI.Page
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
            //Otherwise assign session to username field
            string user = Session["user"].ToString();
  
        }
        if (!IsPostBack)
        {

            int row = 0;
            if (Request.QueryString["studentID"] != null)
            {
                row = int.Parse(Request.QueryString["studentID"]);

                //set-up object to use the web.config file

                string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection myConnection = new SqlConnection(connectionString);

                myConnection.Open();

                string query = "SELECT * FROM SIS_STUDENT INNER JOIN SIS_USER ON SIS_STUDENT.userID = SIS_USER.userID INNER JOIN SIS_ADVISOR ON SIS_ADVISOR.advisorID = SIS_STUDENT.advisorID INNER JOIN SIS_LECTURER ON SIS_LECTURER.lecturerID = SIS_STUDENT.tutorID WHERE studentID=@rowid";

                SqlCommand myCommand = new SqlCommand(query, myConnection);



                myCommand.Parameters.AddWithValue("@rowid", row);

                SqlDataReader rdr = myCommand.ExecuteReader();


                //RME - Entering data into textboxes from DB

                while (rdr.Read())
                {
                    string sstudentNumber = rdr["studentNo"].ToString();
                    string sfirstName = rdr["firstName"].ToString();
                    string slastName = rdr["lastName"].ToString();
                    string shomeaddress = rdr["address"].ToString();
                    string stermaddress = rdr["termAddress"].ToString();
                    string scontactNumber = rdr["contactNumber"].ToString();
                    string semail = rdr["Email"].ToString();


                    studentNum.Text = sstudentNumber;
                    fname.Text = sfirstName;
                    lname.Text = slastName;
                    homeAddress.Text = shomeaddress;
                    termAddress.Text = stermaddress;
                    email.Text = semail;
                    contactNumber.Text = scontactNumber;


                }


            }

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
 
        // Create the PDF Table specifying the number of columns
        PdfPTable pdfTable = new PdfPTable(GridView1.HeaderRow.Cells.Count);
        foreach (GridViewRow gridViewRow in GridView1.Rows)

            // Loop thru each cell in GrdiView header row
            foreach (TableCell tableCell in gridViewRow.Cells)
        {
            // Create the Font Object for PDF document
            Font font = new Font();
           

            // Create the PDF cell, specifying the text and font
            PdfPCell pdfCell = new PdfPCell(new Phrase(tableCell.Text, font));

           

            // Add the cell to PDF table
            pdfTable.AddCell(pdfCell);
        }

    
                Document pdfDocument = new Document(new Rectangle(288f, 144f), 10, 10, 10, 10);
                pdfDocument.SetPageSize(iTextSharp.text.PageSize.A4.Rotate());
                pdfTable.WidthPercentage = 100; //table width to 100per
               

                PdfWriter.GetInstance(pdfDocument, Response.OutputStream);

                pdfDocument.Open();
                pdfDocument.Add(pdfTable);
                pdfDocument.Close();

                Response.ContentType = "application/pdf";
                Response.AppendHeader("content-disposition",
                    "attachment;filename=Employees.pdf");
                Response.Write(pdfDocument);
                Response.Flush();
                Response.End();


            }
        }
  
       
    



    



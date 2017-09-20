<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AcademicRecord.aspx.cs" Inherits="Student_AcademicRecord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>SIS | Student</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../fonts/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/animate.min.css" rel="stylesheet" />

    <!-- Custom styling plus plugins -->
    <link href="../css/custom.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../css/maps/jquery-jvectormap-2.0.3.css" />
    <link href="../css/icheck/flat/green.css" rel="stylesheet" />
    <link href="../css/floatexamples.css" rel="stylesheet" type="text/css" />

    <script src="../js/jquery.min.js"></script>
    <script src="../js/nprogress.js"></script>

</head>

<body class="nav-md">
    <form id="form1" runat="server">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">

                         <div class="clearfix"></div>

                        <asp:SqlDataSource ID="profileDetailsNav" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT imagepath, firstName, lastName FROM SIS_STUDENT WHERE SIS_STUDENT.userID = @userID">
                            <SelectParameters>
                                <asp:SessionParameter Name="userID" SessionField="userID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:ListView ID="profileDetailsNavView" runat="server" DataSourceID="profileDetailsNav">
                            <ItemTemplate>

                                <!-- Profile Menu -->
                                <div class="profile">
                                    <div class="profile_pic">
                                        <asp:Image ID="profilePicMenu" runat="server" alt="User" class="img-circle profile_img" ImageUrl='<%# "../../files/" + Eval("imagepath")  %>' />
                                    </div>
                                    <div class="profile_info">
                                        <span>Welcome!</span>
                                        <h2>
                                            <asp:Label ID="userFirstName" runat="server" Text='<%# Eval("firstName") %>'></asp:Label>
                                            <asp:Label ID="userlastName" runat="server" Text='<%# Eval("lastName") %>'></asp:Label>
                                        </h2>
                                    </div>
                                </div>
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:ListView>
                        <!-- sidebar menu -->
                           <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                            <div class="menu_section">
                                <h3>Student</h3>
                                <ul class="nav side-menu">
                                    <li><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                                    <li><a href="Timetable.aspx"><i class="fa fa-table"></i>Timetable</a></li>
                                    <li><a href="Modules.aspx"><i class="fa fa-list"></i>Modules</a></li>
                                  <asp:ListView ID="ListView2" runat="server" DataSourceID="StudentDetails">
                                    <ItemTemplate>
                                    <li><asp:HyperLink ID="link" runat="server" NavigateUrl='<%# "Transcript.aspx?studentID=" + Eval("studentID")%>'><i class="fa fa-file-text-o"></i>Transcript</asp:HyperLink></li>
                                            
                                    </ItemTemplate>
                                    </asp:ListView>
                                     <asp:ListView ID="ListView5" runat="server" DataSourceID="StudentDetails">
                                    <ItemTemplate>
                                    <li class="licurrent"><asp:HyperLink ID="link" runat="server" NavigateUrl='<%# "AcademicRecord.aspx?studentID=" + Eval("studentID")%>'><i class="fa fa-list-alt"></i>Academic Record</asp:HyperLink></li>
                                            
                                    </ItemTemplate>
                                    </asp:ListView>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /sidebar menu -->



                <!-- top navigation -->
                <div class="top_nav">
                    <div class="nav_menu">
                        <nav class="" role="navigation">
                            <div class="nav toggle">
                                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                            </div>

                            <ul class="nav navbar-nav navbar-right">
                                <li class="">
                                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">

                                        <asp:ListView ID="profileDetailsTopView" runat="server" DataSourceID="profileDetailsNav">
                                            <ItemTemplate>
                                                <asp:Image ID="image" runat="server" alt="User" ImageUrl='<%# "../../files/" + Eval("imagepath")  %>' />
                                                <asp:Label ID="useruser" runat="server" Text='<%# Eval("firstName") %>'></asp:Label>

                                            </ItemTemplate>
                                        </asp:ListView>
                                        <span class=" fa fa-angle-down"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                        <li><a href="Profile.aspx">Profile</a>
                                        </li>
                                        <li><a href="Change_Password.aspx">Change Password</a>
                                        </li>
                                        <li><a href="Help.aspx">Help</a>
                                        </li>
                                        <li><a href="../Default.aspx"><i class="fa fa-sign-out pull-right"></i>Log Out</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div id="HTMLtoPDF">
                        <div class="row">

                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h1>Academic Record</h1>

                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">

                                        <div class="row">

                                            <!-- RME ACADEMIC RECORD DATA -->



                                            <div class="x_content" style="width: 100%">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        Personal Details:
                                       
                                                    </div>


                                                    <asp:SqlDataSource ID="readfromimage" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT imagepath FROM SIS_STUDENT WHERE SIS_STUDENT.studentID = @studentID">
                                                        <SelectParameters>
                                                            <asp:QueryStringParameter Name="studentID" QueryStringField="studentID" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                                    <div class="panel-body">
                                                        <div class="col-lg-4 col-sm-12 col-xs-12">

                                                            <br />
                                                            <div class="text-center">
                                                                <asp:ListView ID="readfromimageview" runat="server" DataSourceID="readfromimage">
                                                                    <ItemTemplate>
                                                                        <asp:Image ID="Image1" runat="server" Style="width: 250px; height: 200px; margin: auto;" ImageUrl='<%# "../../files/" + Eval("imagepath") %>' />
                                                                        </div>
                                              <br />

                                                                    </ItemTemplate>
                                                                </asp:ListView>


                                                                <br />

                                                                <asp:SqlDataSource ID="readDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                                                    SelectCommand="SELECT * FROM SIS_STUDENT 
                  INNER JOIN SIS_USER ON SIS_STUDENT.userID = SIS_USER.userID INNER JOIN SIS_ADVISOR ON SIS_ADVISOR.advisorID = SIS_STUDENT.advisorID INNER JOIN SIS_LECTURER ON SIS_LECTURER.lecturerID = SIS_STUDENT.tutorID
                  WHERE SIS_STUDENT.userID=@ID ">

                                                                    <SelectParameters>
                                                                        <asp:SessionParameter Name="ID" SessionField="userid" Type="string" />
                                                                    </SelectParameters>

                                                                </asp:SqlDataSource>

                                                                <asp:ListView ID="readDetailsView" runat="server" DataSourceID="readDetails">
                                                                    <ItemTemplate>


                                                                        <br />
                                                                        <b>Name: </b>
                                                                        <asp:Label ID="firstnameText" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                                                        <asp:Label ID="lastnameText" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                                                        <br />
                                                                        <b>School:</b>
                                                                        <asp:Label ID="schoolText" runat="server" Text='<%# Eval("school")  %>'></asp:Label>
                                                                        <br />
                                                                        <b>Course: </b>
                                                                        <asp:Label ID="courseText" runat="server" Text='<%# Eval("course")  %>'></asp:Label>
                                                                        <br />
                                                                        <b>Level: </b>
                                                                        <asp:Label ID="levelText" runat="server" Text='<%# Eval("level")  %>'></asp:Label>
                                                                        <br />
                                                                        <b>Advisor of Studies:</b>
                                                                        <asp:Label ID="advisorText" runat="server" Text='<%# Eval("fName")  %>'></asp:Label>
                                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("lName")  %>'></asp:Label>
                                                                        <br />
                                                                        <b>Tutor:</b>
                                                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("TITLE") %>'></asp:Label>
                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("lastname") %>'></asp:Label>
                                                                        <br />
                                                                    </ItemTemplate>
                                                                </asp:ListView>
                                                            </div>

                                                            <br />

                                                            <!-- RME STUDENT PROFILE DATA -->
                                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                                <p>Student Number</p>
                                                                <asp:TextBox ID="studentNum" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                                <br />

                                                                <p>First Name</p>
                                                                <asp:TextBox ID="fname" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                                <br />

                                                                <p>Last Name</p>
                                                                <asp:TextBox ID="lname" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>

                                                                <br />
                                                                <p>Home Address</p>
                                                                <asp:TextBox ID="homeAddress" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>

                                                            </div>




                                                            <div class="col-md-3"></div>
                                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                                <p>Term Address</p>
                                                                <asp:TextBox ID="termAddress" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>


                                                                <br />

                                                                <p>Email Address</p>
                                                                <asp:TextBox ID="email" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>

                                                                <br />

                                                                <p>Contact Number</p>
                                                                <asp:TextBox ID="contactNumber" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>

                                                                <br />


                                                                <br />
                                                                <asp:Label ID="displaySaved" runat="server" Text=""></asp:Label>
                                                                <asp:Label ID="myinfo" runat="server" Text="" Enabled="false"></asp:Label>


                                                            </div>
                                                        </div>
                                                    </div>



                                                    <br />


                                                    <asp:SqlDataSource ID="Studentinfo" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_MODULES 
                      INNER JOIN SIS_RESULTS ON SIS_MODULES.moduleID = SIS_RESULTS.moduleID
                      INNER JOIN SIS_STUDENT ON SIS_RESULTS.studentID = SIS_STUDENT.studentID 
                      WHERE SIS_STUDENT.studentID = @studentID">
                                                        <SelectParameters>

                                                            <asp:QueryStringParameter Name="studentID" QueryStringField="studentID" />

                                                        </SelectParameters>


                                                    </asp:SqlDataSource>

                                                    <asp:SqlDataSource ID="StudentName" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT SIS_STUDENT.firstName, SIS_STUDENT.lastName FROM SIS_STUDENT 
                      WHERE SIS_STUDENT.studentID = @studentID">
                                                        <SelectParameters>


                                                            <asp:QueryStringParameter Name="studentID" QueryStringField="studentID" />

                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                                    <div id="HTMLtoPDF">

                                                        <h2 style="margin-left=12px"><b>All Results</b></h2>

                                                        <asp:ListView ID="showmodule" runat="server" DataSourceID="Studentinfo">



                                                            <ItemTemplate>

                                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                                    <div class="panel panel-default">
                                                                        <div class="panel-heading">
                                                                            <b>Module Name:</b>
                                                                            <asp:Label Text='<%# Eval("moduleName") %>' runat="server" ID="Label1" />
                                                                        </div>
                                                                        <div class="panel-body">
                                                                            <br />

                                                                            <b>Course:</b>
                                                                            <asp:Label Text='<%# Eval("course") %>' runat="server" ID="Label2" /><br />

                                                                            <b>Level: </b>
                                                                            <asp:Label Text='<%# Eval("level") %>' runat="server" ID="Label3" /><br />

                                                                            <b>Result:</b>
                                                                            <asp:Label Text='<%# Eval("resultMark") %>' runat="server" ID="Label4"></asp:Label>

                                                                            <asp:Label Text='<%# Eval("pass/fail") %>' runat="server" ID="Label5" />


                                                                            <br />

                                                                        </div>


                                                                    </div>


                                                                </div>
                                                            </ItemTemplate>

                                                        </asp:ListView>

                                                       


                                                            <div class="col-md-12 col-sm-12 col-xs-12 ">
                                                                <b>EBN CODES</b>
                                                                ABS=Absent ABSM=Absent Mitigation CO=Class Attendance Only-No Result DTD=Discounted F=Fail IF=Include Fail MNA=Mark Not Available P=Pass PC1=Pass by Compensation PD=Pass with Distinction PH=Pass with Honours Restriction RN=Resit as First Attempt X=Exempt
                                                            </div>
                                                        </div>
                                                  
                                                    <asp:SqlDataSource ID="viewModules" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                                        SelectCommand="SELECT SIS_MODULES.moduleID, SIS_MODULES.moduleName, SIS_MODULES.moduleDescription, SIS_MODULES.moduleCode 
               FROM SIS_MODULES
               INNER JOIN SIS_STUDENT_MODULES ON SIS_MODULES.moduleID = SIS_STUDENT_MODULES.moduleSelected
               INNER JOIN SIS_STUDENT ON SIS_STUDENT_MODULES.studentID = SIS_STUDENT.studentID
               INNER JOIN SIS_USER ON SIS_STUDENT.userID = SIS_USER.userID
               WHERE SIS_STUDENT_MODULES.Completed=0
               AND SIS_STUDENT.userID = @userid
               ORDER BY SIS_MODULES.moduleCode ">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="userid" SessionField="userid" Type="string" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                               <div class="col-md-12 col-sm-12 col-xs-12"><hr /></div>
                                                    <h2> <b>Modules for this academic year:</b></h2>
                                                    <br />

                                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="viewModules">

                                                        <ItemTemplate>
                                                            <div class="col-md-6">
                                                                <div class="panel panel-default">
                                                                    <div class="panel-heading">


                                                                        <h4>
                                                                            <asp:Label ID="Label1" runat="server" ForeColor="Black" Text='<%# Eval("moduleCode") %>' />: 
                                <asp:Label ID="modulename" runat="server" ForeColor="Black" Text='<%# Eval("moduleName") %>' />
                                                                    </div>
                                                                    </h4>

                                <div class="panel-body">
                                    <asp:Label ID="Label2" runat="server" Text="Description:  "></asp:Label>
                                    <asp:Label ID="desc" runat="server" ForeColor="Black" Text='<%# Eval("moduleDescription") %>' />
                                    </br> 
                                </br>

                                </div>
                                                                </div>
                                                            </div>
                                                              
                                                       
                                                        </ItemTemplate>

                                                    </asp:ListView>
                                                    <br />

                                                    <asp:SqlDataSource ID="viewOldModules1" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                                        SelectCommand="SELECT SIS_MODULES.moduleID, SIS_MODULES.moduleName, SIS_MODULES.moduleDescription, SIS_MODULES.moduleCode 
               FROM SIS_MODULES
               INNER JOIN SIS_STUDENT_MODULES ON SIS_MODULES.moduleID = SIS_STUDENT_MODULES.moduleSelected
               INNER JOIN SIS_STUDENT ON SIS_STUDENT_MODULES.studentID = SIS_STUDENT.studentID
               INNER JOIN SIS_USER ON SIS_STUDENT.userID = SIS_USER.userID
               WHERE SIS_STUDENT_MODULES.Completed=1 AND SIS_MODULES.Level = 1
               AND SIS_STUDENT.userID = @userid
               ORDER BY SIS_MODULES.moduleCode ">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="userid" SessionField="userid" Type="string" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                                    <asp:SqlDataSource ID="viewOldModules2" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                                        SelectCommand="SELECT SIS_MODULES.moduleID, SIS_MODULES.moduleName, SIS_MODULES.moduleDescription, SIS_MODULES.moduleCode 
               FROM SIS_MODULES
               INNER JOIN SIS_STUDENT_MODULES ON SIS_MODULES.moduleID = SIS_STUDENT_MODULES.moduleSelected
               INNER JOIN SIS_STUDENT ON SIS_STUDENT_MODULES.studentID = SIS_STUDENT.studentID
               INNER JOIN SIS_USER ON SIS_STUDENT.userID = SIS_USER.userID
               WHERE SIS_STUDENT_MODULES.Completed=1 AND SIS_MODULES.Level = '2'
               AND SIS_STUDENT.userID = @userid
               ORDER BY SIS_MODULES.moduleCode ">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="userid" SessionField="userid" Type="string" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <br />

                                     <h2 style="margin-left:12px">Modules for previous academic years:</h2>
                                        <br />
                                    
                            <asp:ListView ID="ListView3" runat="server" DataSourceID="viewOldModules1">
                                            
                              <ItemTemplate>
                                   <div class="col-md-4 col-sm-12 col-xs-12">
                                     <div class="panel panel-default">
                                          <div class="panel-heading">

                           
                                    <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Black" NavigateUrl='<%# "viewResources.aspx?moduleID="+Eval("moduleID") %>'>

                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("moduleCode") %>' />: <asp:Label ID="modulename" runat="server" ForeColor="Black"  Text='<%# Eval("moduleName") %>' /></div> </asp:HyperLink>
                                
                                    <div class="panel-body">
                                <asp:Label ID="Label2" runat="server" Text="Description:  "></asp:Label>
                                <asp:Label ID="desc" runat="server" ForeColor="Black" Text='<%# Eval("moduleDescription") %>' />
                                </br>
                                        </div>
                                    </div>
                                              </div>
                                 
                                  
                                        
                                       
                                       
                   
                                                              
                            </ItemTemplate>
                                                    
                            </asp:ListView>
                                     
                            <asp:ListView ID="ListView4" runat="server" DataSourceID="viewOldModules2">
                                            
                              <ItemTemplate>
                                  <div class="col-md-4 col-sm-12 col-xs-12">
                                     <div class="panel panel-default">
                                          <div class="panel-heading">

                              

                              <asp:Label ID="Label1" runat="server" ForeColor="Black" Text='<%# Eval("moduleCode") %>' />: <asp:Label ID="modulename" runat="server" ForeColor="Black"  Text='<%# Eval("moduleName") %>' /></div>

                                     <div class="panel-body">
                                <asp:Label ID="Label2" runat="server" Text="Description:  "></asp:Label>
                                <asp:Label ID="desc" runat="server" ForeColor="Black" Text='<%# Eval("moduleDescription") %>' />
                                </br>
                      
                                     
                                        </div>
                                    </div>
                                              </div>
                                                           
                            </ItemTemplate>
                                                      
                            </asp:ListView>
                                     </div>

                                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_STUDENT WHERE userID=@ID ">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ID" SessionField="userid" Type="string" />
                                    </SelectParameters>

                                </asp:SqlDataSource>
                               
            </div>
        </div>
        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

        <asp:SqlDataSource ID="StudentDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_STUDENT WHERE userID=@ID ">
            <SelectParameters>
                <asp:SessionParameter Name="ID" SessionField="userid" Type="string" />
            </SelectParameters>

        </asp:SqlDataSource>

        <!-- /page content -->


        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/custom.js"></script>
        <script src="../js/nicescroll/jquery.nicescroll.min.js"></script>

        <!-- Barry pdf -->
        <script src="../js/jspdf.js"></script>
        <script src="../js/jquery-2.1.3.js"></script>
        <script src="../js/pdfFromHTML.js"></script>

    </form>
</body>

</html>



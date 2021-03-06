﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManualEnrol.aspx.cs" Inherits="SIS2_Student_ManualEnrol" %>

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
                                    <li class="licurrent"><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                                    <li><a href="Timetable.aspx"><i class="fa fa-table"></i>Timetable</a></li>
                                    <li><a href="Modules.aspx"><i class="fa fa-list"></i>Modules</a></li>
                                    <li><a href="Transcript.aspx"><i class="fa fa-file-text-o"></i>Transcript</a></li>
                                    <li><a href="AcademicRecord.aspx"><i class="fa fa-list-alt"></i>Academic Record</a></li>
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

                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Manual Enrolment Process</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                     <div class="panel panel-default">
                                    <%-- Rebecca: Registration: --%>
                                    <div class="panel-body" margin-left:10%; margin-right:10%;">
                                    <div id="regbuttons" style="margin-left: 15%; margin-right: 10%; padding: 2px;">
                                        <br />
                                        <asp:Label ID="Complete" runat="server" style="margin-left:20%;" Text="Are you sure you want to start the Manual Enrolment process?" Font-Size="Large" ForeColor="Crimson"></asp:Label><br /><br />
                                        <asp:Label ID="Label1" runat="server" Text="Doing so will alert your Advisor of Studies that you require assistance with your enrolment." Font-Size="Medium" ForeColor="DimGray" style="margin-left:10%;"></asp:Label><br /><br />
                                     

                          <asp:SqlDataSource ID="Buttons" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' 
                          SelectCommand="SELECT SIS_ADVISOR.fName, SIS_ADVISOR.lName, SIS_STUDENT.firstName, SIS_STUDENT.lastName, SIS_STUDENT.StudentNo, SIS_USER.Email
                            FROM SIS_ADVISOR 
                            INNER JOIN SIS_USER ON SIS_ADVISOR.userID = SIS_USER.userID
                            INNER JOIN SIS_STUDENT ON SIS_ADVISOR.advisorID = SIS_STUDENT.advisorID
                            WHERE SIS_STUDENT.studentID = @sID">
                          <SelectParameters>
                  <asp:QueryStringParameter QueryStringField="studentID" Name="sID" Type="String"></asp:QueryStringParameter>
               </SelectParameters>
                          </asp:SqlDataSource>

                      <asp:ListView ID="cancelbutton" runat="server" DataSourceID="Buttons">
                          <ItemTemplate>

                                <div id="buttons" style="margin-left: 30%; margin-right: 20%; padding: 2px;">

                    <asp:HyperLink ID="Yes" runat="server" CssClass="btn btn-primary" Style="margin-left: 20%;" NavigateUrl='<%#  "ManualEnrolSend.aspx?email=" + Eval("Email") + "&fname=" + Eval("fName") + "&lName=" + Eval("lname") + "&sName=" + Eval("firstName") + "&sLName=" + Eval("lastName") + "&sNum=" + Eval("StudentNo") %>'>Confirm</asp:HyperLink>

                      <asp:HyperLink ID="No" runat="server" CssClass="btn btn-default" NavigateUrl='<%# "RegWizard.aspx?userID=" + Request.QueryString["userID"] + "&Level=" + Request.QueryString["level"] + "&StudentID=" + Request.QueryString["studentID"]%>'>Cancel</asp:HyperLink>
                                    </div>

                              </ItemTemplate>
                          </asp:ListView>

                                                    </div>

                                        <div id="space" style="height:600px">
                                            <br /><br />

                                        </div>

                                                </div>
                                         </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
       

        <!-- /page content -->


        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/custom.js"></script>
        <script src="../js/nicescroll/jquery.nicescroll.min.js"></script>
    </form>
</body>

</html>



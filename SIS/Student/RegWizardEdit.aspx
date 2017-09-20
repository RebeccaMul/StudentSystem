<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegWizardEdit.aspx.cs" Inherits="Student_RegWizardEdit" %>

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
                                    <h2>Registration Wizard - Step 1</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                     <%-- Rebecca: Registration Wizard Edit Details: --%>

                <asp:SqlDataSource ID="studentinfo" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT SIS_STUDENT.firstName, SIS_STUDENT.lastName, SIS_USER.email, SIS_STUDENT.address, SIS_STUDENT.contactNumber, SIS_STUDENT.course, SIS_STUDENT.level, SIS_USER.UserID, SIS_USER.Email 
                   FROM SIS_STUDENT 
                    INNER JOIN SIS_USER 
                    ON SIS_STUDENT.userID = SIS_USER.userID 
                  
                     WHERE SIS_USER.userID = @userid">
               
                     <SelectParameters>
                <asp:SessionParameter Name="userid" SessionField="userid" Type="string" />
               </SelectParameters>
               </asp:SqlDataSource>

              Please update your current details:<br />
              <br /><div class="panel-body" style="outline:auto; outline-color:lightgray; margin-left:10%; margin-right:10%;"> 
              <u>Personal Details</u>
                  
                    <asp:SqlDataSource ID="manualbtn" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' 
                          SelectCommand="SELECT * FROM SIS_USER WHERE SIS_USER.userID = @UID">
                          <SelectParameters>
                  <asp:QueryStringParameter QueryStringField="userid" Name="UID" Type="String"></asp:QueryStringParameter>
               </SelectParameters>
                          </asp:SqlDataSource>

                      <asp:ListView ID="manual" runat="server" DataSourceID="manualbtn">
                          <ItemTemplate>


                  <div id="manualBtn" style="float:right;">
                          <asp:HyperLink ID="ManualEnrol" runat="server" CssClass="btn btn-primary" NavigateUrl=' <%# "ManualEnrol.aspx?UserID=" + Request.QueryString["userid"] + "&Level=" + Request.QueryString["Level"] + "&StudentID=" + Request.QueryString["StudentID"] %>'>Manual Enrolment</asp:HyperLink>
                              </div>

                              </ItemTemplate>
                          </asp:ListView>
                  
                  <br /><br />
                           <b>First Name:</b>
              <asp:TextBox ID="first" runat="server" style="margin:0 0 0 05px" width="150"></asp:TextBox><br /><br />
                  <b>Last Name:</b> <asp:TextBox ID="last" runat="server" style="margin:0 0 0 05px" width="150"></asp:TextBox><br /><br />

                   <b>Address:</b> <asp:Textbox ID="Addbox" runat="server" style="margin:0 0 0 05px" width="300"></asp:Textbox><br /><br />
                    <b>Contact:</b> <asp:Textbox ID="Contbox" runat="server" style="margin:0 0 0 05px" width="300"></asp:Textbox><br /><br />
                 
              <asp:ListView ID="StudentDetails" runat="server" DataSourceID="studentinfo">

                  <ItemTemplate>
                  <br />
                  
                            <div id="regbuttons" style="margin-left:38%; margin-right:38%; padding:2px;">
                              <b><asp:Label ID="Label5" runat="server" style="margin-left:1%; margin-right:1%;" Text="Are these details up to date?" ForeColor="#1ABB9C"></asp:Label></b></br>

                  </ItemTemplate>
              </asp:ListView>

                    <asp:Button ID="EditBtn" CssClass="btn btn-primary" runat="server" Text="Confirm" OnClick="EditBtn_Click" />
                     <asp:ListView ID="cancelbutton" runat="server" DataSourceID="manualbtn">
                          <ItemTemplate>
                      <asp:HyperLink ID="CancelBtn" runat="server" CssClass="btn btn-default" NavigateUrl='<%# "RegWizard.aspx?userID=" + Request.QueryString["userID"] + "&Level=" + Request.QueryString["level"] + "&StudentID=" + Request.QueryString["studentID"]%>'>Save & Exit</asp:HyperLink>
                              </ItemTemplate>
                          </asp:ListView>
                       
                    </div><br />






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



<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Student_Default" %>

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
                                  <asp:ListView ID="ListView2" runat="server" DataSourceID="StudentDetails">
                                    <ItemTemplate>
                                    <li><asp:HyperLink ID="link" runat="server" NavigateUrl='<%# "Transcript.aspx?studentID=" + Eval("studentID")%>'><i class="fa fa-file-text-o"></i>Transcript</asp:HyperLink></li>
                                            
                                    </ItemTemplate>
                                    </asp:ListView>
                                     <asp:ListView ID="ListView3" runat="server" DataSourceID="StudentDetails">
                                    <ItemTemplate>
                                    <li><asp:HyperLink ID="link" runat="server" NavigateUrl='<%# "AcademicRecord.aspx?studentID=" + Eval("studentID")%>'><i class="fa fa-list-alt"></i>Academic Record</asp:HyperLink></li>
                                            
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

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Home</h2>

                                    <div class="clearfix"></div>
                                </div>


                                    <asp:SqlDataSource ID="configSource" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                    SelectCommand="SELECT * FROM SIS_CONFIG">
                                                </asp:SqlDataSource>

                                   <div class="alert alert-success alert-dismissable">  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <asp:ListView ID="titleDisplay" runat="server" DataSourceID="configSource">
                                    <ItemTemplate>
                           <asp:Label ID="welcomeAlert" runat="server" Font-Size="15px" Text='<%# Eval("welcomeAlert") %>'></asp:Label>
                                 
                                        </ItemTemplate> </asp:ListView>
                                
                                </div>

                                <asp:SqlDataSource ID="StudentDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_STUDENT WHERE userID=@ID ">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ID" SessionField="userid" Type="string" />
                                    </SelectParameters>

                                </asp:SqlDataSource>

                                <asp:Panel ID="Reg" runat="server">
                                    <asp:ListView ID="RegLink" runat="server" DataSourceID="StudentDetails">

                                        <ItemTemplate>

                                            <div class="text-center col-sm-12">
                                                <div id="Registration">
                                                    <asp:HyperLink ID="RegWizardLink" runat="server" NavigateUrl='<%# "RegWizard.aspx?userID=" + Eval("userID") + "&Level=" + Eval("level") + "&StudentID=" + Eval("studentID") %>'>
                                                        <br />
                                                        <asp:Image ID="registerImg" runat="server" ImageUrl="http://i64.tinypic.com/14264va.png" Style="width: 500px; max-width: 100%;" /><br />

                                                    </asp:HyperLink>
                                                </div>
                                                <br />
                                            </div>
                                        </ItemTemplate>

                                    </asp:ListView>


                                    <asp:Label ID="StartDate" runat="server" Text='<%# Eval("startDate") %>' Visible="false"></asp:Label>




                                    <asp:TextBox ID="enrolValue" runat="server" Visible="false"></asp:TextBox>
                                </asp:Panel>

                                <asp:Label ID="deadline" runat="server" Text='' ForeColor="red" Style="float: right;"></asp:Label><br />

                                <asp:SqlDataSource ID="HomeDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                    SelectCommand="SELECT * FROM SIS_STUDENT 
                  INNER JOIN SIS_USER ON SIS_STUDENT.userID = SIS_USER.userID INNER JOIN SIS_ADVISOR ON SIS_ADVISOR.advisorID = SIS_STUDENT.advisorID INNER JOIN SIS_LECTURER ON SIS_LECTURER.lecturerID = SIS_STUDENT.tutorID
                  WHERE SIS_STUDENT.userID=@ID ">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ID" SessionField="userid" Type="string" />
                                    </SelectParameters>

                                </asp:SqlDataSource>

                                  <asp:SqlDataSource ID="tutorSource" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                    SelectCommand="SELECT * FROM SIS_LECTURER INNER JOIN SIS_STUDENT ON SIS_STUDENT.tutorID = SIS_LECTURER.lecturerID WHERE SIS_STUDENT.userID = @ID ">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ID" SessionField="userid" Type="string" />
                                    </SelectParameters>

                                </asp:SqlDataSource>

                                <asp:ListView ID="ListView1" runat="server" DataSourceID="HomeDetails">
                                    <ItemTemplate>
                                        <div class="col-md-6 col-sm-12 col-xs-12">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    Personal Details:
                                       
                                                </div>
                                                <div class="panel-body">
                                                    <div class="text-center">
                                                        <b>Name:</b>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("firstName") %>'></asp:Label>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("lastName") %>'></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>Address:</b>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>Contact Number:</b>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("contactNumber") %>'></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>Email:</b>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("email") %>'></asp:Label>

                                                        <br />
                                                        <br />


                                                        <asp:HyperLink ID="profileLink" runat="server" Text="Make Changes" Font-Underline="true" NavigateUrl='<%# "Profile.aspx" %>'></asp:HyperLink>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="col-md-6 col-sm-12 col-xs-12">
                                            <div class="panel panel-default">

                                                <div class="panel-heading">
                                                    Academic Details
                                                </div>
                                                <div class="panel-body">
                                                    <div class="text-center">
                                                        <b>School:</b>
                                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("school") %>'></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>Course:</b>
                                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("course") %>'></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>Level:</b>
                                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("level") %>'></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>Advisor of studies:</b>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("fName") %>'></asp:Label>
                                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("LName") %>'></asp:Label>
                                                        <br />
                                                        <br />

 </ItemTemplate>
                                </asp:ListView>
                                                        <asp:ListView ID="displayTutor" runat="server" DataSourceID="tutorSource">
                                    <ItemTemplate>
                                                        <b>Tutor:</b>
                                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("lastname") %>'></asp:Label>
                                                    </div>
                                                </div></ItemTemplate></asp:ListView>
                                            </div>
                                        </div>
                                   


                                <br />


                                <asp:SqlDataSource ID="notificationSource" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_NOTIFICATION INNER JOIN SIS_USER ON SIS_USER.typeID = SIS_NOTIFICATION.typeID WHERE userID = @userID ORDER BY notificationID DESC ">

                                    <SelectParameters>
                                        <asp:SessionParameter Name="userID" SessionField="userID" Type="String" />
                                    </SelectParameters>

                                </asp:SqlDataSource>



                                <!-- Notifications Panel -->
                                <div class="col-md-6 col-sm-12 col-xs-12" >

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            Notifications
                                        </div>
                                        <div class="panel-body scroll-notification" style="max-height:372px;">
                                            <asp:ListView ID="displayNotifications" runat="server" DataSourceID="notificationSource">
                                                <EmptyDataTemplate>
                                                    No Notifications
                                                </EmptyDataTemplate>

                                                <ItemTemplate>
                                                    <asp:Image ID="image" runat="server" alt="notificationImage" CssClass="img-notification-thumbnail" ImageUrl='<%# "../../files/" + Eval("imagepath")  %>' />

                                                    <b>
                                                        <asp:Label ID="notificationName" runat="server" Text='<%# Eval("notificationName") %>'></asp:Label>
                                                        <br />

                                                        <asp:Label ID="notificationDate" runat="server" Text='<%# Eval("notificationDate")  %>'></asp:Label>
                                                    </b>
                                                    <br />
                                                    <p></p>

                                                    <asp:Label ID="notificationMessage" runat="server" Text='<%# Eval("notificationMessage")  %>'></asp:Label>
                                                    <hr />
                                                </ItemTemplate>
                                            
                                            </asp:ListView>

                                        </div>
                                    </div>

                                 
                                </div>

                                   <!-- Sarah External Links -->


                                    <asp:SqlDataSource ID="LinkDataSource" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_EXTERNAL_LINKS WHERE linkType = 5">

                                   

                                </asp:SqlDataSource>



                                <!-- External Link Panel -->
                                <div class="col-md-6 col-sm-12 col-xs-12">

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                           External Link
                                        </div>
                                        <div class="panel-body scroll-notification" style="max-height:372px;">
                                            <asp:ListView ID="ListView5" runat="server" DataSourceID="LinkDataSource">
                                                <EmptyDataTemplate>
                                                    No External Links
                                                </EmptyDataTemplate>

                                                <ItemTemplate>

                                                 <asp:HyperLink ID="linkMessage" runat="server" style="text-decoration-line:underline" Text='<%# Eval("linkName")  %>' NavigateUrl='<%# Eval("linkMessage")%>' ></asp:HyperLink>
                                                   
                                                    <hr />
                                                </ItemTemplate>
                                            
                                            </asp:ListView>
                                            </div>
                                    </div>
                                    </div>




                                 <!-- Advertising Panel -->
                                <div class="col-md-6 col-sm-12 col-xs-12" style="float:right;">

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            Advertising
                                        </div>
                                        <div class="panel-body" style="margin:62px">
   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  <asp:Timer ID="Timer1" runat="server" Interval="10" OnTick="Timer1_Tick"> </asp:Timer>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
    </Triggers>
    <ContentTemplate>
      
  <asp:AdRotator ID="AdRotator1" runat="server" Height="220px" Width="100%" AlternateTextField="AlternateText" />
    </ContentTemplate>

</asp:UpdatePanel>
                                            

                                         
                                            
                                          
                                            

                                        </div>
                                    </div>
                            </div>

                                <!-- Maps -->
                                 <div class="col-md-6 col-sm-12 col-xs-12">

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                         Maps
                                        </div>
                                        <div class="panel-body">
                                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2312.108717160183!2d-5.937482629097396!3d54.584458419365404!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x486108ea57227da7%3A0x3cecfa2a15d642e1!2sQueen&#39;s+University+Belfast!5e0!3m2!1sen!2suk!4v1493062669558" width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>

                                        
                                       <asp:HyperLink ID="roomsBtn" runat="server" CssClass="btn btn-default" Text="View Rooms for location" NavigateUrl="Location.aspx"></asp:HyperLink> 
                                            </div> 
                             

                                        </div>
                                    </div>

                                 <asp:ListView ID="ListView4" runat="server" DataSourceID="HomeDetails">
                                        <ItemTemplate>
                                            <asp:HyperLink
                                                ID="exam" runat="Server"
                                                CssClass="btn btn-default"
                                                NavigateUrl='<%# "Exam.aspx?studentID="+Eval("studentID") + "&userID=" + Eval ("userID") %>'>View Recent Exam Session
                                            </asp:HyperLink>

                                        </ItemTemplate>
                                    </asp:ListView>
                            </div>



                            <br />
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


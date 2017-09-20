<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegTimetable.aspx.cs" Inherits="Student_Timetable" %>

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
     <script src="../js/jquery.min.js"></script>

  
<link href="../css/cupertino/jquery-ui-1.7.3.custom.css" rel="stylesheet" type="text/css" />
    <link href="../fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" />
    

    <script src="../jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="../js/moment.min.js" type="text/javascript"></script>

    

    <script src="../jquery/jquery-ui-1.7.3.custom.min.js" type="text/javascript"></script>

    <script src="../jquery/jquery.qtip-1.0.0-rc3.min.js" type="text/javascript"></script>

    <script src="../fullcalendar/fullcalendar.min.js" type="text/javascript"></script>

    <script src="../scripts/calendarscript.js" type="text/javascript"></script>
    
    <script src="../jquery/jquery-ui-timepicker-addon-0.6.2.min.js" type="text/javascript"></script>
    <style type='text/css'>
        body
        {
           

            
        }
        #calendar
        {
            width: 900px;
            margin: 0 auto;
            
            
        }
        /* css for timepicker */
        .ui-timepicker-div dl
        {
            text-align: left;
        }
        .ui-timepicker-div dl dt
        {
            height: 25px;
        }
        .ui-timepicker-div dl dd
        {
            margin: -25px 0 10px 65px;
        }
        .style1
        {
            width: 100%;
        }
        
        /* table fields alignment*/
        .alignRight
        {
        	text-align:right;
        	padding-right:10px;
        	padding-bottom:10px;
        }
        .alignLeft
        {
        	text-align:left;
        	padding-bottom:10px;
        }
    </style>
</head>

<body class="nav-md">
    <form id="form1" runat="server">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">

                        <div class="clearfix"></div>

                       <!-- Profile Menu -->
                        <div class="profile">
                            <div class="profile_pic">
                                <img src="../img/user.jpg" alt="User" class="img-circle profile_img" />
                            </div>
                            <div class="profile_info">
                                <span>Welcome!</span>
                                <h2>
                                    <asp:Label ID="username" runat="server" Text=""></asp:Label></h2>
                            </div>
                        </div>
                        <br />
                        <br />

                        <!-- sidebar menu -->
                        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                            <div class="menu_section">
                                <h3>Student</h3>
                                <ul class="nav side-menu">
                                    <li><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                                    <li class="licurrent"><a href="Timetable.aspx"><i class="fa fa-table"></i>Timetable</a></li>
                                    <li><a href="Modules.aspx"><i class="fa fa-list"></i>Modules</a></li>
                                    <li><a href="Transcript.aspx"><i class="fa fa-file-text-o"></i>Transcript</a></li>
                                    <li><a href="AcademicRecord.aspx"><i class="fa fa-file-text-o"></i>Academic Record</a></li>
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
                                        <img src="../img/user.jpg" alt="User" /><asp:Label ID="username1" runat="server" Text=""></asp:Label>
                                        <span class=" fa fa-angle-down"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                        <li><a href="javascript:;">Profile</a>
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
                                    <h2>Timetable</h2>

                                    <%-- Rebecca - SQL requesting user details (for returning to enrolment) --%>
             <asp:SqlDataSource ID="returnsql" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_USER WHERE userID='1'"> </asp:SqlDataSource>
                                     <%-- Listview to display button with correct link --%>
               <asp:ListView ID="ReturnBtn" runat="server" DataSourceID="returnsql">

                  <ItemTemplate>
                                   <%-- Button which returns to enrolment with correct details --%>
                                      <div id="returnBtn" style="float:right;">
                        <asp:HyperLink ID="Timetable" runat="server" CssClass="btn btn-primary" NavigateUrl='<%# "RegWizard.aspx?userID=" + Request.QueryString["userID"] + "&Level=" + Request.QueryString["Level"] + "&studentID=" + Request.QueryString["StudentID"] %>'>Return to Enrolment</asp:HyperLink>
                                          </div>
                                    
                      </ItemTemplate>
                   </asp:ListView>

                                  
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                 
                                     <%-- SQL checking for clashes in specific user's schedule --%>
                                       <asp:SqlDataSource ID="Clashes" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT event_start, event_end FROM SIS_EVENT WHERE userID=@id GROUP BY event_start, event_end HAVING COUNT(*) > 1"> 
                 <SelectParameters>
                           <asp:QueryStringParameter QueryStringField="userID" Name="id" Type="String"></asp:QueryStringParameter>
               </SelectParameters>
                                       </asp:SqlDataSource>

                                         <%-- Listview to return amount of clashes (hidden) --%>
             <asp:ListView ID="CLASHLIST" runat="server" DataSourceID="Clashes">
                  <ItemTemplate>
                          
                      </ItemTemplate>

             </asp:ListView>
                                    <asp:TextBox ID="titleBox" runat="server" Visible="false"></asp:TextBox>
                                    <asp:TextBox ID="descBox" runat="server" Visible="false"></asp:TextBox>
                                    <asp:TextBox ID="startBox" runat="server" Visible="false"></asp:TextBox>
                                    <asp:TextBox ID="endBox" runat="server" Visible="false"></asp:TextBox>
                                    <asp:TextBox ID="dayBox" runat="server" Visible="false"></asp:TextBox>
                                    
                                       <asp:TextBox ID="idBox" runat="server" Visible="false"></asp:TextBox>

                                       <asp:TextBox ID="ModuleBox" runat="server" Visible="false"></asp:TextBox>

                                       <%-- Label which will display warning message if clashes are detected. (hidden) --%>
                                 
                                    <asp:Label ID="ClashMessage" runat="server" Text=" " ForeColor="red" Font-Size="Medium"></asp:Label><br /><br />

                                   
                                       <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

                   <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    
    <div id="calendar">
    </div>
                                    <div runat="server" id="jsonDiv" />
    <input type="hidden" id="hdClient" runat="server" />
            </div>
      

                                  <div id="space" style="height:1600px">
                                            <br /><br />

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


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewLecturers.aspx.cs" Inherits="SENIORUNIVERSITYMANAGER_viewLecturers" %>

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
                                <h3>Senior University Manager</h3>
                                <ul class="nav side-menu">
                                    <li> <a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                                    <li class="licurrent"><a href="Lecturers.aspx"><i class="fa fa-group"></i>Lecturers</a></li>
                                    <li><a href="Statistics.aspx"><i class="fa fa-bar-chart-o"></i>Statistics</a></li>
                                    <li><a><i class="fa fa-folder"></i>Modules <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="viewModuleSUM.aspx">My Modules</a></li>
                                            <li><a href="searchModuleSUM.aspx">All Modules(Not linked)</a></li>
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-group"></i>Students <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="StudentSUM.aspx">View Students</a></li>
                                            <li><a href="Student_Create.aspx">Create Student</a></li>
                                            <li><a href="Student_Timetable.aspx">View Timetable</a></li>


                                        </ul>
                                    </li>
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

                    <!-- /top tiles -->

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Lecturer</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">



                             <div class="text-center">
                   <asp:SqlDataSource ID="readfromProfile" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_LECTURER WHERE (SIS_LECTURER.lecturerID = @idlecturer)">

                          <SelectParameters>
                <asp:QueryStringParameter Name="idlecturer" Type="Int32" QueryStringField="lectureid" />

            </SelectParameters>

        </asp:SqlDataSource>


              <asp:SqlDataSource ID="readfromDescription" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT SIS_LECTURER.lecturerID, SIS_LECTURER.userID, SIS_LECTURER.title, SIS_LECTURER.firstname, SIS_LECTURER.lastname, SIS_LECTURER.address, SIS_LECTURER.imagepath, SIS_MODULES.lecturerID AS Expr1, SIS_MODULES.moduleCode, SIS_MODULES.moduleName, SIS_MODULES.moduleDescription, SIS_MODULES.units FROM SIS_LECTURER INNER JOIN SIS_MODULES ON SIS_LECTURER.lecturerID = SIS_MODULES.lecturerID WHERE (SIS_LECTURER.lecturerID = @idlecturer) ORDER BY SIS_MODULES.moduleCode ASC">

                          <SelectParameters>
                <asp:QueryStringParameter Name="idlecturer" Type="Int32" QueryStringField="lectureid" />

            </SelectParameters>

        </asp:SqlDataSource>         
                         <div class="col-md-12 col-sm-12 col-xs-12">
                             <div class="panel panel-default">
                       
                            <div class="panel-heading">
                                 <div class="text left">
                        Personal Details
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                               
                                   
                                       <div class="panel-body">

                                  <asp:SqlDataSource ID="readfromLecturers" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_LECTURER INNER JOIN SIS_USER ON SIS_USER.userID = SIS_LECTURER.userID INNER JOIN SIS_ACCOUNT_TYPE ON SIS_USER.typeID = SIS_ACCOUNT_TYPE.typeID WHERE SIS_LECTURER.userID = @userID">
                                     

                                            <SelectParameters>
                                                            <asp:QueryStringParameter Name="userID" QueryStringField="userID" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                       <asp:ListView ID="ListView2" runat="server" DataSourceID="readfromLecturers">
                            <ItemTemplate>
                                 
                                                   
             
                                                       
                                                    <div class="panel-body">
                                                      <div class="col-md-4 col-sm-12 col-xs-12">
                                                     
        <asp:Image ID="image" runat="server"  style="width:150px; height:150px" class="avatar img-circle img-thumbnail" ImageUrl='<%# Eval("imagepath")  %>' />
            
                    <br />
                    <br />
                  
                     <asp:Label ID="Label8" runat="server" Font-Size="20px" Text='<%# Eval ("title") %>'></asp:Label>
                    <asp:Label ID="Label9" runat="server" Font-Size="20px" Text='<%# " " + Eval ("firstname")  %>'></asp:Label>
                     <asp:Label ID="lastnameLabel" runat="server" Font-Size="20px" Text='<%# " " + Eval ("lastname")  %>'></asp:Label>
                    <br />  <asp:Label ID="accountTypeLabel" runat="server"  Font-Size="15px" Text='<%# Eval ("accountName") %>'></asp:Label><br />
                                                            <asp:Label Text='<%# Eval("sNumber") %>' runat="server" ID="Label3" Font-Size="15px" />

                                                          </div>
                   <div class="col-md-8 col-sm-12 col-xs-12">
                       <div class="text-left form-inline">
                   
              <br />  
                                                        <b>Email:</b>
                                                        <asp:Label Text='<%# Eval("email") %>' runat="server" ID="Label4" />
                                                        <br />
                                                           <b>Phone:</b>
                            <asp:Label Text='<%# Eval("contactNumber") %>' runat="server" ID="Label5" /><br />
                                                        
                                                         <b>Room:</b>
                            <asp:Label Text='<%# Eval("room") %>' runat="server" ID="Label6" /><br />
                                                         <b>Postal Address:</b>
                            <asp:Label Text='<%# Eval("Address") %>' runat="server" ID="Label7" /><br /></div></div></div>
</ItemTemplate>
                                                     
                           </asp:ListView>

                        </div>
                                   </div></div></div>


</div>
                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <div class="panel panel-default">
                               
                                      <div class="panel-heading">
                                 
                                  
            Responsibilites 
    </div>
                                     <div class="panel-body"> <asp:ListView ID="itemdata" runat="server" DataSourceID="readfromDescription">
              
                 <ItemTemplate>
            
             
                        <asp:Label ID="codeLabel" runat="server" Text='<%# "<b>" + Eval ("moduleCode") + "</b>"  %>'></asp:Label>
                 
                   <asp:Label ID="moduleTitle" runat="server" Text='<%# " <b> - " + Eval ("moduleName") + "</b>" %>'></asp:Label>
                  
                  <br />
                  <asp:Label ID="moduleDescription" runat="server" Text='<%# Eval ("moduleDescription")  %>'></asp:Label>
                  <br />     
                  <asp:Label ID="unitsLabel" runat="server" Text='<%# "Units: " + Eval ("units")  %>'></asp:Label>
   <br />
                     <br />

                 </ItemTemplate>

                    <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>Lecturer has no taught modules.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
</asp:ListView>
                                         </div>



                                </div>
                            </div>
                                

                         <div class="col-md-6 col-sm-12 col-xs-12">
                             <div class="panel panel-default">
                       
                            <div class="panel-heading">
                                 
                        Timetable
                                    
                                    <div class="clearfix"></div>
                                </div>
                               
                                   
                                       <div class="panel-body"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

                   <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    
    <div id="calendar" style="max-width:100%;">
    </div>
                                    <div runat="server" id="jsonDiv" />
    <input type="hidden" id="hdClient" runat="server" />
            </div>
                              
    </div>
</div></div>
                        </div>
                    </div>
                </div>
            </div>
        
        </div></div>
        
             <script src="../js/bootstrap.min.js"></script>
        <script src="../js/custom.js"></script>
        <script src="../js/nicescroll/jquery.nicescroll.min.js"></script>
    </form>
</body>

</html>

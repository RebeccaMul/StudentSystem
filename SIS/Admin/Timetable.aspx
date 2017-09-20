<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Timetable.aspx.cs" Inherits="Admin_Timetable" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- Meta, title, CSS, favicons, etc. -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>SIS | Admin</title>

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
                                <h3>Admin</h3>
                                <ul class="nav side-menu">
                                    <li><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                                    <li><a><i class="fa fa-group"></i>Students <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="Student.aspx">View Students</a></li>
                                            <li><a href="Student_Create.aspx">Create Student</a></li>
                                          <li><a href="Student_Timetable.aspx">View Timetable</a></li>

                                        </ul>
                                    </li>
                                     <li> <a href="Lecturers.aspx"><i class="fa fa-group"></i>Lecturers</a></li>
                                    <li><a href="usertimetable.aspx"><i class="fa fa-table"></i>Timetables</a></li>
                                    <li><a href="viewStudents.aspx"><i class="fa fa-user"></i>Assign Personal Tutor</a></li>
                                    <li><a><i class="fa fa-folder"></i>Modules <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="adminviewModule.aspx">Modules</a></li>
                                            <li><a href="createmodule.aspx">Create Modules</a></li>
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-arrow-right"></i>Pathway <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="viewprogrammes.aspx">Pathway</a></li>
                                            <li><a href="createpathway.aspx">Create Pathway</a></li>
                                            <li><a href="changeDates.aspx">Change Academic Dates</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="financepaid.aspx"><i class="fa fa-gbp"></i>Student Finance</a></li>
                                    <li><a href="fileupload.aspx"><i class="fa fa-inbox"></i>Upload Resources</a></li>
                                     <li><a href="configuration.aspx"><i class="fa fa-cog"></i>Configuration</a></li>
                                    <li><a href="manageAds.aspx"><i class="fa fa-font"></i>Advertising</a></li>
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

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                     <asp:Calendar ID="CalendarSelect" runat="server" OnDayRender="CalendarSelect_DayRender" OnSelectionChanged="CalendarSelect_SelectionChanged" SelectionMode="DayWeek" BackColor="White" BorderColor="" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="350px" Width="500px">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="red" Height="3px"></DayHeaderStyle>

                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF"></NextPrevStyle>

                    <OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>

                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="red"></SelectedDayStyle>

                    <SelectorStyle BackColor="#99CCCC" ForeColor="white"></SelectorStyle>

                    <TitleStyle BackColor="#c41030" BorderColor="#c41030" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="white" Height="40px"></TitleStyle>

                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White"></TodayDayStyle>

                    <WeekendDayStyle BackColor=""></WeekendDayStyle>
                </asp:Calendar>
              <asp:TextBox ID="date" runat="server" Width="237px"></asp:TextBox>
              
                <asp:TextBox ID="date2" runat="server" Text="01/01/1970"  Visible="true" Height="0px" Width="000px"></asp:TextBox>
              <asp:TextBox ID="date3" runat="server" Text="01/01/1970"  Visible="true" Height="0px" Width="000px"></asp:TextBox>
              <asp:TextBox ID="date4" runat="server" Text="01/01/1970" Visible="true" Height="0px" Width="000px"></asp:TextBox>
                
              
              <asp:TextBox ID="date5" runat="server" Text=""  Visible="true" Width="237px"></asp:TextBox>
              <br />
              <br />  
              
              <asp:Button ID="search" runat="server" Text="Search Timetable Week" CssClass="btn btn-primary" OnClick="search_Click1" />
              <br />
                <br />
                <asp:HyperLink ID="HyperLink6" runat="server" class="btn btn-default" style="background-color:#c41030; color:white;" NavigateUrl="Timetable_Add.aspx">Add Timetable Events</asp:HyperLink>


              <br />

              <h4>All events</h4>
              <br />

  <div class='panel panel-default'>
          <div class='panel-heading'>
            <i class='icon-beer icon-large'></i>
            Timetable Search    

              <asp:Label ID="DateLabel" runat="server" Text="Label"></asp:Label>
              <asp:Label ID="DateLabel2" runat="server" Text="Label"></asp:Label>
              <asp:Label ID="DateLabel3" runat="server" Text="Label"></asp:Label>
              <asp:Label ID="DateLabel4" runat="server" Text="Label"></asp:Label>
              <asp:Label ID="DateLabel5" runat="server" Text="Label"></asp:Label>
              </div>
        
              
              <br />
              </div>




                 <asp:SqlDataSource ID="timetablesource" runat="server" 
         ConnectionString="<%$ ConnectionStrings:dbconnect %>" 
         SelectCommand="SELECT * FROM SIS_TIMETABLE ORDER BY startDate ASC">

     </asp:SqlDataSource>
            <!-- List view to display the content from db--><!-- Hyper link to pass module ID to next page-->
            <asp:ListView ID="tt" runat="server" DataSourceID="timetablesource">
      
                <ItemTemplate>
            <asp:Label ID="Label3" runat="server" Text="Event Name:"></asp:Label>
                <div class="list-group">
                            
                         <h4>   <asp:Label ID="Label2" runat="server" ForeColor="Black" class="list-group-item" Text='<%# Eval("desc") %>' /></h4>    
                         <asp:Label ID="modulename" runat="server" ForeColor="Black"  Text='<%#string.Format("{0:dddd, MMMM d, yyyy}", Eval("startDate")) %>' />
                    <br />
                             <asp:Label ID="Label1" runat="server" ForeColor="Black" Text='<%#string.Format("{0: h:mm tt}", Eval("startDate")) %>' /><asp:Label ID="Label5" runat="server" Text=" - "></asp:Label>
                         <asp:Label ID="Label4" runat="server" ForeColor="Black"  Text='<%#string.Format("{0: h:mm tt}", Eval("endDate")) %>' />
                        </div>
                    
                      <asp:HyperLink ID="HyperLink1" runat="server" 
                                   NavigateUrl='<%# "Timetable_Remove.aspx?timetableID="+Eval("timetableID")%>'>
                  <asp:Label ID="Label6" runat="server" Text="Remove"/>
                   </asp:HyperLink>
                    <br />
                    <br />
                     </ItemTemplate>
                </asp:ListView> 


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


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Timetable_Add.aspx.cs" Inherits="Admin_Timetable_Add" %>

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
                                    <h2>Add Timetable Events</h2>

                                                    
                 <asp:TextBox ID="SelectedLecturer" runat="server" ForeColor="red" Visible="false" Text="1"></asp:TextBox>
                                 <asp:TextBox ID="SelectedUser" runat="server" ForeColor="red" Visible="false" Text="1"></asp:TextBox>
  
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">


                                       <asp:SqlDataSource ID="timetablesource" runat="server"
                ConnectionString="<%$ ConnectionStrings:dbconnect %>"
                SelectCommand="SELECT * FROM SIS_MODULES">

     </asp:SqlDataSource>

          <div class='panel-body'>
          
                <div class="col-md-6">
   Event Name
                <asp:TextBox ID="Name" CssClass="form-control" Width="100%" runat="server"></asp:TextBox>
                </div>
<div class="col-md-6">
    
   Module


              
                <asp:DropDownList ID="DropDownModule" runat="server" AppendDataBoundItems="true" CssClass="form-control" Width="100%" DataSourceID="timetablesource" DataTextField="moduleCode" DataValueField="moduleID" OnSelectedIndexChanged="DropDownModule_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Text="All Users" Value="0"></asp:ListItem>


                </asp:DropDownList>
   
              </div>

              <br />
              <div class="col-md-12"></div>
                <div class="col-md-6">
                    <br />
                    
                    
                   
              Start Date:
            
          <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" OnClick="Button3_Click" Text="Show / Hide Calendar" />
                    <br />
                    <div style="margin-left:auto;margin-right:auto;">
                <asp:Calendar ID="Calendar1" runat="server"  OnDayRender="Calendar1_DayRender" Visible="false" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt"></DayHeaderStyle>

                    <NextPrevStyle VerticalAlign="Bottom" Font-Bold="True" Font-Size="8pt" ForeColor="#333333"></NextPrevStyle>

                    <OtherMonthDayStyle ForeColor="#2a3f54"></OtherMonthDayStyle>

                    <SelectedDayStyle BackColor="#2a3f54" ForeColor="White"></SelectedDayStyle>

                    <TitleStyle BackColor="White" BorderColor="LightSteelBlue" BorderWidth="0px" Font-Bold="True" Font-Size="14pt" ForeColor="#2a3f54"></TitleStyle>

                    <TodayDayStyle BackColor="#CCCCCC"></TodayDayStyle>
                </asp:Calendar>
                    <br />
            <asp:TextBox ID="startDate" runat="server" Visible="false" CssClass="form-control" Width="50%" >  </asp:TextBox>  
            <br />      </div>
            </div>
                    
                <div class="col-md-6">
                    <br />
           End Date:
    
                    <br />
                   <div style="margin-left:auto;margin-right:auto;">
                <asp:Calendar ID="Calendar2" runat="server" OnDayRender="Calendar2_DayRender" Visible="false" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                      <DayHeaderStyle Font-Bold="True" Font-Size="8pt"></DayHeaderStyle>

                    <NextPrevStyle VerticalAlign="Bottom" Font-Bold="True" Font-Size="8pt" ForeColor="#333333"></NextPrevStyle>

                    <OtherMonthDayStyle ForeColor="#2a3f54"></OtherMonthDayStyle>

                    <SelectedDayStyle BackColor="#2a3f54" ForeColor="White"></SelectedDayStyle>

                    <TitleStyle BackColor="White" BorderColor="LightSteelBlue" BorderWidth="0px" Font-Bold="True" Font-Size="14pt" ForeColor="#2a3f54"></TitleStyle>

                    <TodayDayStyle BackColor="#CCCCCC"></TodayDayStyle>
                </asp:Calendar>
                       <br />
             <asp:TextBox ID="endDate" runat="server" Visible="false" text="Select date and time" CssClass="form-control" Width="50%"> </asp:TextBox></div>
                <br />

              

            </>
           
            <br /></div>
                <br />
           <div class="col-md-12">
                Event Run Time:
      

            
                    <asp:DropDownList ID="NumOfWeeks" runat="server" CssClass="form-control" Width="100%">
                    <asp:ListItem Text="1 Week" Value="1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="2 Weeks" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3 Weeks" Value="3" Selected="false"></asp:ListItem>
                    <asp:ListItem Text="4 Weeks" Value="4" Selected="false"></asp:ListItem>
                    <asp:ListItem Text="5 Weeks" Value="5" Selected="false"></asp:ListItem>
                    <asp:ListItem Text="6 Weeks" Value="6" Selected="false"></asp:ListItem>
                    <asp:ListItem Text="7 Weeks" Value="7" Selected="false"></asp:ListItem>
                    <asp:ListItem Text="8 Weeks" Value="8" Selected="false"></asp:ListItem>
                    <asp:ListItem Text="9 Weeks" Value="9" Selected="false"></asp:ListItem>
                    <asp:ListItem Text="10 Weeks" Value="10" Selected="false"></asp:ListItem>
                    <asp:ListItem Text="11 Weeks" Value="11" Selected="false"></asp:ListItem>
                    <asp:ListItem Text="12 Weeks" Value="12" Selected="false"></asp:ListItem>
                </asp:DropDownList>
              
                <br />
                <br />

                   Description
                <asp:TextBox ID="desc" TextMode="MultiLine" CssClass="form-control" Width="100%" runat="server"></asp:TextBox>
            

              <br />

              <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Submit" Onclick="Button1_Click" /> 
               <asp:Label ID="done" runat="server" Text=""></asp:Label>	
              
      </div>
              <asp:TextBox runat="server" ID="week2" Visible="false"></asp:TextBox>
              <asp:TextBox runat="server" ID="week3" Visible="false"></asp:TextBox>
             
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


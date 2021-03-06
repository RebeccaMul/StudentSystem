﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lecturerSearchCalendar.aspx.cs" Inherits="SeniorUniversityManager_lecturerSearchCalendar" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- Meta, title, CSS, favicons, etc. -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>SIS | Senior University Manager</title>

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
                                <h3>Senior University Manager</h3>
                                <ul class="nav side-menu">
                                    <li><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                                     <li class="licurrent"><a href="Lecturers.aspx"><i class="fa fa-group"></i>Lecturers</a></li>
                                    <li><a href="Statistics.aspx"><i class="fa fa-bar-chart-o"></i>Statistics</a></li>
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
                                    <h2>Timetable Search</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">


                                        <div class='panel-heading'>
            <i class='icon-beer icon-large'></i>

              <asp:Label ID="DateLabel" runat="server" Text="Label"></asp:Label>
              <asp:Label ID="DateLabel2" runat="server" Text="Label"></asp:Label>
              <asp:Label ID="DateLabel3" runat="server" Text="Label"></asp:Label>
              <asp:Label ID="DateLabel4" runat="server" Text="Label"></asp:Label>
              <asp:Label ID="DateLabel5" runat="server" Text="Label"></asp:Label>
              </div>
        
              
              <br />
              
              <div class="col-md-2">
                
                  <br />
               
                  <asp:SqlDataSource ID="timetablesource" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnect %>"
                                   





                      SelectCommand="SELECT * FROM SIS_TIMETABLE
                      INNER JOIN SIS_MODULES ON SIS_MODULES.moduleID = SIS_TIMETABLE.moduleID WHERE cast ([startDate] as date) = @Date AND SIS_MODULES.lecturerID = @lecturerid">
 
                          <SelectParameters>
                               <asp:ControlParameter Name="Date" ControlID="DateLabel" Type="DateTime" />
                <asp:QueryStringParameter Name="lecturerid" Type="Int32" QueryStringField="lecturerid" />

            </SelectParameters>
     </asp:SqlDataSource>

                  <asp:Label ID="Label3" runat="server" Text="Monday:"></asp:Label>
            <!-- List view to display the content from db--><!-- Hyper link to pass module ID to next page-->
            <asp:ListView ID="tt" runat="server"  DataSourceID="timetablesource">
                
                <ItemTemplate>
            
               <div class="list-group" style=" border:1px solid black; padding: 5px; margin: -1px">
                         <h6>   <asp:Label ID="Label2" runat="server" ForeColor="Black" class="list-group-item" Text='<%# Eval("desc") %>' /></h6>    
                         <asp:Label ID="modulename" runat="server" ForeColor="Black"  Text='<%#string.Format("{0:dddd, MMMM d, yyyy}", Eval("startDate")) %>' />
                    <br />
                             <asp:Label ID="Label1" runat="server" ForeColor="Black" Text='<%#string.Format("{0: h:mm tt}", Eval("startDate")) %>' /><asp:Label ID="Label5" runat="server" Text=" - "></asp:Label>
                         <asp:Label ID="Label4" runat="server" ForeColor="Black"  Text='<%#string.Format("{0: h:mm tt}", Eval("endDate")) %>' />
                        </div>
                        
                      
                     </ItemTemplate>
                </asp:ListView>
                  </div>
                  </div>
                  
             <div class="col-md-2">
                  

                  <asp:SqlDataSource ID="tt2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnect %>"
                                    SelectCommand="SELECT * FROM SIS_TIMETABLE
                      INNER JOIN SIS_MODULES ON SIS_MODULES.moduleID = SIS_TIMETABLE.moduleID WHERE cast ([startDate] as date) = @Date AND SIS_MODULES.lecturerID = @lecturerid">
                                  
                          <SelectParameters>
                               <asp:ControlParameter Name="Date" ControlID="DateLabel2" Type="DateTime" />
                <asp:QueryStringParameter Name="lecturerid" Type="Int32" QueryStringField="lecturerid" />

            </SelectParameters>
     </asp:SqlDataSource>

                 <asp:Label ID="Label4" runat="server" Text="Tuesday:"></asp:Label>
            <!-- List view to display the content from db--><!-- Hyper link to pass module ID to next page-->
            <asp:ListView ID="ListView1" runat="server" DataSourceID="tt2">
      
                <ItemTemplate>
            
                <div class="list-group" style=" border:1px solid black; padding: 5px; margin: -1px">  
                            
                         <h6>   <asp:Label ID="Label2" runat="server" ForeColor="Black" class="list-group-item" Text='<%# Eval("desc") %>' /></h6>    
                         <asp:Label ID="modulename" runat="server" ForeColor="Black"  Text='<%#string.Format("{0:dddd, MMMM d, yyyy}", Eval("startDate")) %>' />
                    <br />
                             <asp:Label ID="Label1" runat="server" ForeColor="Black" Text='<%#string.Format("{0: h:mm tt}", Eval("startDate")) %>' /><asp:Label ID="Label5" runat="server" Text=" - "></asp:Label>
                         <asp:Label ID="Label4" runat="server" ForeColor="Black"  Text='<%#string.Format("{0: h:mm tt}", Eval("endDate")) %>' />
                        </div>
                        
                      
                     </ItemTemplate>
                </asp:ListView>
                  </div>

                    <div class="col-md-2">
                  

                <asp:SqlDataSource ID="tt3" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnect %>"
                                   SelectCommand="SELECT * FROM SIS_TIMETABLE
                      INNER JOIN SIS_MODULES ON SIS_MODULES.moduleID = SIS_TIMETABLE.moduleID WHERE cast ([startDate] as date) = @Date AND SIS_MODULES.lecturerID = @lecturerid">
                                  
                          <SelectParameters>
                               <asp:ControlParameter Name="Date" ControlID="DateLabel3" Type="DateTime" />
                <asp:QueryStringParameter Name="lecturerid" Type="Int32" QueryStringField="lecturerid" />

            </SelectParameters>
     </asp:SqlDataSource>
                        <asp:Label ID="Label6" runat="server" Text="Wednesday:"></asp:Label>
            <!-- List view to display the content from db--><!-- Hyper link to pass module ID to next page-->
            <asp:ListView ID="ListView2" runat="server" DataSourceID="tt3">
      
                <ItemTemplate>
            
                <div class="list-group" style=" border:1px solid black; padding: 5px; margin: -1px"> 
                            
                         <h6>   <asp:Label ID="Label2" runat="server" ForeColor="Black" class="list-group-item" Text='<%# Eval("desc") %>' /></h6>    
                         <asp:Label ID="modulename" runat="server" ForeColor="Black"  Text='<%#string.Format("{0:dddd, MMMM d, yyyy}", Eval("startDate")) %>' />
                    <br />
                             <asp:Label ID="Label1" runat="server" ForeColor="Black" Text='<%#string.Format("{0: h:mm tt}", Eval("startDate")) %>' /><asp:Label ID="Label5" runat="server" Text=" - "></asp:Label>
                         <asp:Label ID="Label4" runat="server" ForeColor="Black"  Text='<%#string.Format("{0: h:mm tt}", Eval("endDate")) %>' />
                        </div>
                        
                      
                     </ItemTemplate>
                </asp:ListView>
                  </div>

                   <div class="col-md-2">
                  

                 <asp:SqlDataSource ID="tt4" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnect %>"
                                    SelectCommand="SELECT * FROM SIS_TIMETABLE
                      INNER JOIN SIS_MODULES ON SIS_MODULES.moduleID = SIS_TIMETABLE.moduleID WHERE cast ([startDate] as date) = @Date AND SIS_MODULES.lecturerID = @lecturerid">
                                  
                          <SelectParameters>
                               <asp:ControlParameter Name="Date" ControlID="DateLabel4" Type="DateTime" />
                <asp:QueryStringParameter Name="lecturerid" Type="Int32" QueryStringField="lecturerid" />

            </SelectParameters>
     </asp:SqlDataSource>
                       <asp:Label ID="Label7" runat="server" Text="Thursday:"></asp:Label>
            <!-- List view to display the content from db--><!-- Hyper link to pass module ID to next page-->
            <asp:ListView ID="ListView3" runat="server" DataSourceID="tt4">
      
                <ItemTemplate>
            
                <div class="list-group" style=" border:1px solid black; padding: 5px; margin: -1px">   
                            
                         <h6>   <asp:Label ID="Label2" runat="server" ForeColor="Black" class="list-group-item" Text='<%# Eval("desc") %>' /></h6>    
                         <asp:Label ID="modulename" runat="server" ForeColor="Black"  Text='<%#string.Format("{0:dddd, MMMM d, yyyy}", Eval("startDate")) %>' />
                    <br />
                             <asp:Label ID="Label1" runat="server" ForeColor="Black" Text='<%#string.Format("{0: h:mm tt}", Eval("startDate")) %>' /><asp:Label ID="Label5" runat="server" Text=" - "></asp:Label>
                         <asp:Label ID="Label4" runat="server" ForeColor="Black"  Text='<%#string.Format("{0: h:mm tt}", Eval("endDate")) %>' />
                        </div>
                        
                      
                     </ItemTemplate>
                </asp:ListView>
                  </div>

                      
  

          <div class="col-md-2">
                  

              <asp:SqlDataSource ID="tt5" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnect %>"
                                   SelectCommand="SELECT * FROM SIS_TIMETABLE
                      INNER JOIN SIS_MODULES ON SIS_MODULES.moduleID = SIS_TIMETABLE.moduleID WHERE cast ([startDate] as date) = @Date AND SIS_MODULES.lecturerID = @lecturerid">
                                  
                          <SelectParameters>
                               <asp:ControlParameter Name="Date" ControlID="DateLabel5" Type="DateTime" />
                <asp:QueryStringParameter Name="lecturerid" Type="Int32" QueryStringField="lecturerid" />

            </SelectParameters>
     </asp:SqlDataSource>
              <asp:Label ID="Label8" runat="server" Text="Friday:"></asp:Label>
            <!-- List view to display the content from db--><!-- Hyper link to pass module ID to next page-->
            <asp:ListView ID="ListView4" runat="server" DataSourceID="tt5">
      
                <ItemTemplate>
            
                <div class="list-group" style=" border:1px solid black; padding: 5px; margin: -1px">  
                            
                         <h6>   <asp:Label ID="Label2" runat="server" ForeColor="Black" class="list-group-item" Text='<%# Eval("desc") %>' /></h6>    
                         <asp:Label ID="modulename" runat="server" ForeColor="Black"  Text='<%#string.Format("{0:dddd, MMMM d, yyyy}", Eval("startDate")) %>' />
                    <br />
                             <asp:Label ID="Label1" runat="server" ForeColor="Black" Text='<%#string.Format("{0: h:mm tt}", Eval("startDate")) %>' /><asp:Label ID="Label5" runat="server" Text=" - "></asp:Label>
                         <asp:Label ID="Label4" runat="server" ForeColor="Black"  Text='<%#string.Format("{0: h:mm tt}", Eval("endDate")) %>' />
                        </div>
                        
                      
                     </ItemTemplate>
                </asp:ListView>
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

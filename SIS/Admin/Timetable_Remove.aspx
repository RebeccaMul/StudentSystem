<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Timetable_Remove.aspx.cs" Inherits="Admin_Timetable_Remove" %>

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
                                    <li><a href="#"><i class="fa fa-cog"></i>Configuration</a></li>
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
                                    <h2>Remove Events</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                     
                             <asp:TextBox ID="searchbox" CssClass="form-control" runat="server" Text="" style="width:50%; float:left;"></asp:TextBox>
                             <asp:Button ID="Searchbtn" runat="server" Class="btn btn-primary" Text="Search" OnClick="Searchbtn_Click" style="float:left; margin-left:2px;"/>
                                                                                      <br /><br />


          <asp:SqlDataSource ID="removeEvent" runat="server" 
         ConnectionString="<%$ ConnectionStrings:dbconnect %>" 
         SelectCommand="SELECT * FROM SIS_EVENT">

                  
     </asp:SqlDataSource>

                             
                                       <asp:Panel runat="server" ID="defaultevents">          
                <asp:ListView ID="timetable" runat="server" DataSourceID="removeEvent">
      
                <ItemTemplate>
            
                <div class="list-group">

                                          
<div class="col-lg-3 col-md-4  col-sm-12 col-xs-12">
   <div class="panel panel-default">
  <div class="panel-heading">

      <asp:HyperLink ID="deleteBtn" runat="server" text="Delete" class="btn btn-primary" style="float: right;" NavigateUrl='<%#"Timetable_Remove_Update.aspx?eventID=" + Eval("eventID") %>'></asp:HyperLink>  


   

                    <b>Title: </b>
      <br />
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>'></asp:Label>
  
     
      </div>

         <div class="panel-body">
                          
                          <b>Location: </b>
                           <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>'></asp:Label>
      <br />
                            <br />
                           <b>Start</b>
                           <asp:Label ID="event_startLabel" runat="server" Text='<%# Eval("event_start") %>'></asp:Label>
        <br />
             <br />
                         <b>End</b>
                           <asp:Label ID="event_endLable" runat="server" Text='<%# Eval("event_end") %>'></asp:Label>
        <br />
             <br />
                     <b>All Day </b>
                           <asp:Checkbox ID="all_dayLabel" runat="server" Checked='<%# Eval("all_day") %>'  Enabled="false"></asp:Checkbox>
                      
                                    
                                    
                            
                       <br />     
             <br />
            
                      
                    

              </div>
       </div>
    </div>
                      
                     </ItemTemplate>

                </asp:ListView>
                                           </asp:Panel>

                                     <asp:SqlDataSource ID="EventDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_EVENT WHERE ([title] LIKE '%' + @title + '%') OR ([description] LIKE '%' + @Location + '%') OR ([event_start] LIKE '%' + @Date + '%') OR ([event_end] LIKE '%' + @Date + '%')">

                                        <SelectParameters>
                                            <asp:QueryStringParameter QueryStringField="searchquery" Name="title" Type="String"></asp:QueryStringParameter>
                                            <asp:QueryStringParameter QueryStringField="searchquery" Name="location"></asp:QueryStringParameter>

                                            <asp:QueryStringParameter QueryStringField="searchquery" Name="date"></asp:QueryStringParameter>
                                        </SelectParameters>


                                    </asp:SqlDataSource>
                   

                  <asp:Panel runat="server" ID="searchresults" Visible="false">           

                <asp:ListView ID="ListView1" runat="server" DataSourceID="EventDetails">
      
                <ItemTemplate>
            
                <div class="list-group">

                                          
<div class="col-lg-3 col-md-4  col-sm-12 col-xs-12">
   <div class="panel panel-default">
  <div class="panel-heading">

    <asp:HyperLink ID="deleteBtn" runat="server" text="Delete" class="btn btn-primary" style="float: right;" NavigateUrl='<%#"Timetable_Remove_Update.aspx?eventID=" + Eval("eventID") %>'></asp:HyperLink>  

                                    

                    <b>Title: </b>
      <br />
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>'></asp:Label>
     
      </div>

         <div class="panel-body">
                          
                          <b>Location:</b>
                           <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>'></asp:Label>
      <br />
                            <br />
                           <b>Start</b>
                           <asp:Label ID="event_startLabel" runat="server" Text='<%# Eval("event_start") %>'></asp:Label>
        <br />
             <br />
                         <b>End</b>
                           <asp:Label ID="event_endLable" runat="server" Text='<%# Eval("event_end") %>'></asp:Label>
        <br />
             <br />
                     <b>All Day </b>
                           <asp:Checkbox ID="all_dayLabel" runat="server" Checked='<%# Eval("all_day") %>'  Enabled="false"></asp:Checkbox>
                                    
             <br />
             <br />
            


              </div>
       </div>
    </div>
                      
                     </ItemTemplate>

                </asp:ListView>
                      </asp:Panel>
                   






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


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Lecturers.aspx.cs" Inherits="SENIORUNIVERSITYMANAGER_Lecturers" %>

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
                                    <li class="licurrent"><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                                    <li><a href="Lecturers.aspx"><i class="fa fa-group"></i>Lecturers</a></li>
                                    <li><a href="Statistics.aspx"><i class="fa fa-bar-chart-o"></i>Statistics</a></li>
                                    <li><a><i class="fa fa-folder"></i>Modules <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="viewModuleSUM.aspx">My Modules</a></li>
                                            <li><a href="searchModuleSUM.aspx">All Modules</a></li>
                                            <li><a href="degreeProgramSearch.aspx">Other Pathway</a></li>
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
                                    <h2>Lecturers</h2>

                                    <div class="clearfix"></div>
                                </div>

                                <div class="x_content">
                                    <asp:SqlDataSource ID="readfromLecturers" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_LECTURER INNER JOIN SIS_USER ON SIS_USER.userID = SIS_LECTURER.userID"></asp:SqlDataSource>


                                    <asp:ListView ID="ListView2" runat="server" DataSourceID="readfromLecturers">
                                        <ItemTemplate>
                                            <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                       <asp:Label ID="titleLabel" runat="server" Text='<%# " " + Eval ("title")  %>'></asp:Label>

                                                            <asp:Label ID="firstnameLabel" runat="server" Text='<%# " " + Eval ("firstname")  %>'></asp:Label>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# " " + Eval ("lastname")  %>'></asp:Label>
                                                   
                <asp:HyperLink ID="viewLink" runat="Server" Text="Edit Personal Information" float="right" CssClass="btn btn-default" Style="float: right;" NavigateUrl='<%# "viewLecturers.aspx?lectureid="+Eval("lecturerID") + "&userID=" + Eval ("userID") %>'>View</asp:HyperLink>   <br />  <asp:Label Text='<%# Eval("sNumber") %>' runat="server" ID="Label3" />
                                                        </div>
                                                    <div class="panel-body">
                                                      
                                                        <div class="image">
                                                            <asp:Image ID="image" runat="server" style="height:110px;" CssClass="profile_pic_student"  ImageUrl='<%# Eval("imagepath")  %>' />
                                                         </div>
                                                        <b>Email:</b>
                                                        <asp:Label Text='<%# Eval("email") %>' runat="server" ID="Label2" />
                                                        <br />
                                                           <b>Phone:</b>
                            <asp:Label Text='<%# Eval("contactNumber") %>' runat="server" ID="Label5" />
                                                        
                                                        
                                                        </div>
                                                    </div>
                                                
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




        <!-- /page content -->

        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/custom.js"></script>
        <script src="../js/nicescroll/jquery.nicescroll.min.js"></script>
    </form>
</body>

</html>

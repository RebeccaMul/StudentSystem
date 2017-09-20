<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentInfoEdit.aspx.cs" Inherits="AcademicProgramManager_studentInfoEdit" %>

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
                                    <li class="licurrent"><a href="Student.aspx"><i class="fa fa-group"></i>Students</a></li>
                                    <li><a href="Timetable.aspx"><i class="fa fa-table"></i>Timetables</a></li>
                                     <li><a href="viewStudents.aspx"><i class="fa fa-group"></i>Assign Personal Tutor</a></li>
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
                                    <h2>Edit Student Records</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                      <p>Student First Name</p>
                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                <br />
                <br />
                <p>Student Last Name</p>
                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                <br />
                <br />
                <p>Student Address</p>
                <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                <br />
                <br />
                <p>Student Contact No</p>
                <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
                <br />
                <br />
                <p>Student Course</p>
                <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"></asp:TextBox>
                <br />
                <br />
                <p>Level</p>
                <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server"></asp:TextBox>
                <br />
                <br />
                
                                         <asp:Button ID="editInfo" runat="server" Text="Submit" CssClass="primary btn-primary" Onclick="EditButton1_Click" /> 
              
         <asp:Label ID="displayLabel" runat="server" Text=""></asp:Label>

        






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

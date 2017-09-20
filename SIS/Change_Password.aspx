<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Change_Password.aspx.cs" Inherits="Change_Password" %>

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
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="fonts/css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/animate.min.css" rel="stylesheet" />

    <!-- Custom styling plus plugins -->
    <link href="css/custom.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/maps/jquery-jvectormap-2.0.3.css" />
    <link href="css/icheck/flat/green.css" rel="stylesheet" />
    <link href="css/floatexamples.css" rel="stylesheet" type="text/css" />

    <script src="js/jquery.min.js"></script>
    <script src="js/nprogress.js"></script>

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
                                <img src="img/user.jpg" alt="User" class="img-circle profile_img" />
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
                                    <li><a href="Lecturers.aspx"><i class="fa fa-group"></i>Lecturers</a></li>
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
                                        <img src="img/user.jpg" alt="User" /><asp:Label ID="username1" runat="server" Text=""></asp:Label>
                                        <span class=" fa fa-angle-down"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                        <li><a href="javascript:;">Profile</a>
                                        </li>
                                        <li><a href="Default.aspx"><i class="fa fa-sign-out pull-right"></i>Log Out</a>
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
                                    <h2>Change Password</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                     <div class='panel-body'>
           
         
                         <div class="panel panel-default" style="float:left; width:33.333%; margin-left:5%;">
                                   
                               <table>
            <tr>
                <td>Old Password</td><td>:</td>
                <td><asp:TextBox ID="oldPassword" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RFV1" runat="server" 
            ControlToValidate="oldPassword" 
            ErrorMessage="Please enter current password"></asp:RequiredFieldValidator></td>
            </tr>
             <tr>
                <td>New Password</td><td>:</td>
                <td><asp:TextBox ID="newPassword" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RFV2" runat="server" 
            ControlToValidate="newPassword" 
            ErrorMessage="Please enter new password"></asp:RequiredFieldValidator></td>
            </tr>
             <tr>
                <td>Confirm Password</td><td>:</td>
                <td><asp:TextBox ID="confirmPassword" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RFV3" runat="server" 
            ControlToValidate="confirmPassword" 
            ErrorMessage="Please confirm password"></asp:RequiredFieldValidator></td>
            </tr>
            <asp:CompareValidator ID="CV1" runat="server" 
            ControlToCompare="newPassword" ControlToValidate="confirmPassword" 
            ErrorMessage="Please ensure new passwords match"></asp:CompareValidator>    
            <tr><td colspan="3"><asp:label ID="Label1" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:label>
                <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" /></td>
                </tr>
        </table>


                                   <div class="panel-footer" style="background-color:#c41030; color:white;">
                                      
                            </div> 
                           

                       </div>

                        <div class="panel panel-default" style="float:left; width:15%; padding-right:5px; visibility:hidden;">
                              
                                      
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


        <script src="js/bootstrap.min.js"></script>
        <script src="js/custom.js"></script>
        <script src="js/nicescroll/jquery.nicescroll.min.js"></script>
    </form>
</body>

</html>


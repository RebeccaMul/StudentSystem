<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewmodule.aspx.cs" Inherits="AcademicProgramManager_viewmodule" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- Meta, title, CSS, favicons, etc. -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>SIS | Academic Program Manager</title>

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
                                <h3>Academic Program Manager</h3>
                               <ul class="nav side-menu">
                                    <li><a href="dashboard.aspx"><i class="fa fa-home"></i>Home</a></li>

                                    <li><a><i class="fa fa-folder"></i>Modules <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="moduleinfo.aspx"></>Edit Modules</a></li>
                                            <li><a href="assignmodules.aspx">Assign Modules</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="reviewmodulechanges.aspx"><i class="fa fa-thumbs-o-up"></i>Review Changes</a></li>
                                    <li><a><i class="fa fa-group"></i>Students <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="Student.aspx">View Students</a></li>

                                           
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

                                    <!-- SM - where the APM can edit the module chosen --> 
                                    <h2>Edit Module</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                <div class="col-md-6">
                                Module Code
                                    <br />
                                <asp:TextBox ID="module" Text="" CssClass="form-control" runat="server"></asp:TextBox><br />
                                Module Name
                                    <br />
                                <asp:TextBox ID="name" Text="" CssClass="form-control" runat="server"></asp:TextBox><br />
                                Module Description
                                    <br />
                                <asp:TextBox ID="desc" Text="" CssClass="form-control" runat="server"></asp:TextBox><br />
                                Suggested Description Change
                                    <br />
                                <asp:TextBox ID="desc2" Text="" CssClass="form-control" runat="server"></asp:TextBox><br />
                               
                                    Units
                                    <br />
                                <asp:TextBox ID="unit" Text="" CssClass="form-control" runat="server"></asp:TextBox><br />
                                Compulsary
                                    <br />
                                <asp:TextBox ID="comp" Text="" CssClass="form-control" runat="server"></asp:TextBox><br />
                                    </div>
                                     <div class="col-md-6">
                                Lecturer Name
                                    <br />
                              <asp:Textbox ID="lecturerfirst" ReadOnly="true" Text="" CssClass="form-control"  Width="50%" runat="server"></asp:Textbox>
                                
                                <br />
                                Update Teaching Lecturer
                                    <br />
                                    <asp:SqlDataSource ID="lecturerlist" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT lecturerID, firstName +' '+ lastName AS name FROM SIS_LECTURER"></asp:SqlDataSource>
                                    
                                    <asp:DropDownList ID="lecturervalues" runat="server" CssClass="form-control" DataSourceID="lecturerlist" DataTextField="name" DataValueField="lecturerID"></asp:DropDownList>
                                <br />
                                    Level
                                    <br />
                                <asp:TextBox ID="level" Text="" CssClass="form-control" runat="server"></asp:TextBox><br />
                                Semester
                                    <br />
                                <asp:TextBox ID="semester" Text="" CssClass="form-control" runat="server"></asp:TextBox><br />


                                Status
                                         <asp:DropDownList ID="ModuleStatus" runat="server" CssClass="form-control">
                                           
                                         <asp:ListItem Text="Withdrawn" Value="Withdrawn" ></asp:ListItem>
                                        <asp:ListItem Text="Suspended" Value="Suspended" ></asp:ListItem>
                                         <asp:ListItem Text="Running" Value="Running" ></asp:ListItem>


                                         </asp:DropDownList>

                                         <br />
                                           <asp:Button ID="updateModule" runat="server" CssClass="btn btn-primary" Text="Submit Changes" OnClick="updateModule_Click" />

                    

                                          <asp:Button ID="deletebutton1" runat="server" CssClass="btn btn-primary"  Text="Delete" OnClick="deleteModule_Click" />
                       



                                 

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

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manageAds.aspx.cs" Inherits="Admin_manageAds" %>

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
                                    <h2>Advertising</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                    <div class="col-md-12">
                                        <!-- JC - form to add a advetisment to the system, file type validation has been used to increase security -->

                                        <label for="productname">Advertisement Name</label><br />
                                        <asp:TextBox ID="nametext" CssClass="form-control" runat="server" Text=""></asp:TextBox>
                                        <br />



                                        <label for="image">File Upload</label><br />
                                        <asp:FileUpload ID="myimage" runat="server" />
                                        <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="myimage"
                                            runat="server" Display="Dynamic" ForeColor="Red" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.doc|.docx|.pdf|.png|.jpg|.gif|.xls|.xlsx|.aspx|.zip)$"
                                            ControlToValidate="myimage" runat="server" ForeColor="Red" ErrorMessage="Please select a valid Word, PDF, PNG, JPG, GIF, XLS, XLSX, ASPX, ZIP File."
                                            Display="Dynamic" />
                                        <br />
                                        <label for="description">Website URL Link</label><br />
                                        <asp:TextBox ID="link" CssClass="form-control" runat="server" Text=""></asp:TextBox>


                                        <br />

                                        <asp:Button ID="submitbutton" runat="server" Text="Submit" class="btn btn-primary" OnClick="submitbutton_Click"></asp:Button>

                                        <br />

                                        <asp:Label ID="myinfo" runat="server" Text=""></asp:Label>
                                    </div>


                                    <br />
                                    <br />
                                    <div class="x_title">
                                        <br />
                                        <h2>Delete Add</h2>

                                        <div class="clearfix"></div>
                                    </div>


                                    <div class="col-md-12">
                                        <br />
                                        <!--JC - SQL datasource to show current ads on display -->
                                        <asp:SqlDataSource ID="displayads" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:dbconnect %>"
                                            SelectCommand="SELECT * FROM SIS_ADS"></asp:SqlDataSource>
                                        <!--JC - List view to display the content from db-->

                                        <asp:ListView ID="ads" runat="server" DataSourceID="displayads">

                                            <ItemTemplate>
                                                <div class="col-md-6">
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading">


                                                            <asp:HyperLink ID="deleteLink" runat="Server" Text="Delete Ad" float="right" CssClass="btn btn-default" Style="float: right;"
                                                                NavigateUrl='<%# "deleteAd.aspx?adID="+Eval("addID") %>'>Delete</asp:HyperLink>


                                                            <h4>
                                                                <asp:Label ID="adsname" runat="server" ForeColor="Black" Text='<%# Eval("AlternateText") %>' /></h4>
                                                        </div>

                                                        <div class="panel-body">
                                                            <asp:Label ID="Label2" runat="server" Text="URL Link:  "></asp:Label>
                                                            <asp:Label ID="desc" runat="server" ForeColor="Black" Text='<%# Eval("NavigateURL") %>' />
                                                            </br>
                                <asp:Label ID="Label1" runat="server" Text="Image:  "></asp:Label>
                                                            <asp:Image ID="image" runat="server" Height="100px" Width="300px" ImageUrl='<%# "../../files/" + Eval("ImageURL")  %>' />
                                                            <br />
                                                            <br />


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




        </div>


        <!-- /page content -->


        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/custom.js"></script>
        <script src="../js/nicescroll/jquery.nicescroll.min.js"></script>
    </form>
</body>

</html>

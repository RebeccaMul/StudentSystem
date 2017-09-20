<%@ Page Language="C#" AutoEventWireup="true" CodeFile="degreeProgramSearch.aspx.cs" Inherits="Lecturer_degreeProgramSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>SIS | Lecturer</title>

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
                                <h3>Lecturer</h3>
                                <ul class="nav side-menu">

                                    <li class="licurrent"><a href="lecturerDashboard.aspx"><i class="fa fa-home"></i>Home</a></li>
                                    <li><a><i class="fa fa-folder"></i>Modules <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="viewModule.aspx">My Modules</a></li>
                                            <li><a href="searchModule.aspx">All Modules</a></li>
                                            <li><a href="degreeProgramSearch.aspx">Other Pathway</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="personalTutee.aspx"><i class=" fa fa-user"></i>Tutees</a></li>
                                    <li><a><i class="fa fa-group"></i>Students <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="Student.aspx">View Students</a></li>

                                        </ul>
                                    </li>
                                    <li><a href="usertimetable.aspx"><i class="fa fa-table"></i>Timetables</a></li>
                                    <li><a href="fileupload.aspx"><i class="fa fa-inbox"></i>Upload Resources</a></li>


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
                                    <h2>Search for a Pathway</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">


                                    <asp:TextBox ID="searchbox" CssClass="form-control" runat="server" Text="" Style="width: 50%; float: left;"></asp:TextBox>
                                    <asp:Button ID="Searchbtn" runat="server" Class="btn btn-primary" Text="Search" OnClick="Searchbtn_Click" Style="float: left; margin-left: 2px;" />
                                    <br />
                                    <br />
                                    <br />
                                    <br />


                                    <asp:SqlDataSource ID="pathwayDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT pathwayName, pathwayID, pathwayCode, faculty, school, overview FROM SIS_PATHWAY"></asp:SqlDataSource>

                                    <asp:Panel runat="server" ID="defaultDetails">

                                        <asp:SqlDataSource ID="studentI" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_MODULES">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="moduleID" QueryStringField="moduleID" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:ListView ID="ListView2" runat="server" DataSourceID="pathwayDetails">

                                            <ItemTemplate>
                                                <div class="col-lg-4 col-md-4  col-sm-12 col-xs-12">
                                                    <div class="panel panel-default">
                                                        <asp:HyperLink ID="HyperLink1" runat="server" Text="View Modules" class="btn btn-default" Style="float: right;" NavigateUrl='<%# "viewModules.aspx?pathwayName="+Eval("pathwayName") %>'>View Modules</asp:HyperLink>

                                                        <div class="panel-heading">
                                                            <b>Degree Name:</b>
                                                            <asp:Label Text='<%# Eval("pathwayName") %>' runat="server" ID="pathwayName" /><br />

                                                            <b>Pathway Code:</b>
                                                            <asp:Label Text='<%# Eval("pathwayCode") %>' runat="server" ID="pathwayCode" /><br />

                                                        </div>

                                                        <div class="panel-body">



                                                            <b>Faculty:</b>
                                                            <asp:Label Text='<%# Eval("faculty") %>' runat="server" ID="faculty" /><br />

                                                            <b>School:</b>
                                                            <asp:Label Text='<%# Eval("school") %>' runat="server" ID="school" /><br />

                                                            <b>Overview:</b>
                                                            <asp:Label Text='<%# Eval("overview") %>' runat="server" ID="overview" /><br />
                                                            <br />

                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                                <hr />
                                                                <div class="text-center">
                                                                    <ul class="list-group">
                                                                        <li class="list-group-item">
                                                                            <asp:HyperLink ID="HyperLink2" runat="server" Text="Level 1 Class List" NavigateUrl='<%# "DegreeClassList.aspx?pathwayID="+Eval("pathwayID")  + "&level=1"  %>'>Level 1 Class List</asp:HyperLink>


                                                                        </li>
                                                                        <li class="list-group-item">
                                                                            <asp:HyperLink ID="HyperLink3" runat="server" Text="Level 2 Class List" NavigateUrl='<%# "DegreeClassList.aspx?pathwayID="+Eval("pathwayID")  + "&level=2"  %>'>Level 2 Class List </asp:HyperLink>

                                                                        </li>
                                                                        <li class="list-group-item">
                                                                            <asp:HyperLink ID="HyperLink4" runat="server" Text="Level 3 Class List" NavigateUrl='<%# "DegreeClassList.aspx?pathwayID="+Eval("pathwayID")  + "&level=3"  %>'>Level 3 Class List</asp:HyperLink>
                                                                        </li>

                                                                        <li class="list-group-item">


                                                                            <asp:HyperLink ID="HyperLink5" runat="server" Text="Level 4 Class List" NavigateUrl='<%# "DegreeClassList.aspx?pathwayID="+Eval("pathwayID")  + "&level=4"  %>'>Level 4 Class List</asp:HyperLink>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                </div>

                                            </ItemTemplate>
                                        </asp:ListView>
                                    </asp:Panel>

                            

                                    <asp:SqlDataSource ID="pathwayDetails1" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_PATHWAY WHERE ([pathwayName] LIKE '%' + @pathwayName + '%')  OR ([pathwayCode] LIKE '%' + @pathwayCode + '%')">

                                        <SelectParameters>
                                            <asp:QueryStringParameter QueryStringField="searchquery" Name="pathwayName" Type="String"></asp:QueryStringParameter>

                                            <asp:QueryStringParameter QueryStringField="searchquery" Name="pathwayCode" Type="String"></asp:QueryStringParameter>

                 

                                        </SelectParameters>


                                    </asp:SqlDataSource>


                                    <asp:Panel runat="server" ID="searchresults" Visible="false">

                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="pathwayDetails1">

                                            <ItemTemplate>

                                                <div class="col-lg-4 col-md-4  col-sm-12 col-xs-12">
                                                    <div class="panel panel-default">
                                                        <asp:HyperLink ID="HyperLink1" runat="server" Text="View Modules" class="btn btn-default" Style="float: right;" NavigateUrl='<%# "viewModules.aspx?pathwayName="+Eval("pathwayName") %>'>View Modules</asp:HyperLink>

                                                        <div class="panel-heading">
                                                            <b>Degree Name:</b>
                                                            <asp:Label Text='<%# Eval("pathwayName") %>' runat="server" ID="pathwayName" /><br />

                                                            <b>Pathway Code:</b>
                                                            <asp:Label Text='<%# Eval("pathwayCode") %>' runat="server" ID="pathwayCode" /><br />

                                                        </div>

                                                        <div class="panel-body">



                                                            <b>Faculty:</b>
                                                            <asp:Label Text='<%# Eval("faculty") %>' runat="server" ID="faculty" /><br />

                                                            <b>School:</b>
                                                            <asp:Label Text='<%# Eval("school") %>' runat="server" ID="school" /><br />

                                                            <b>Overview:</b>
                                                            <asp:Label Text='<%# Eval("overview") %>' runat="server" ID="overview" /><br />
                                                            <br />

                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                                <hr />
                                                                <div class="text-center">
                                                                    <ul class="list-group">
                                                                        <li class="list-group-item">
                                                                            <asp:HyperLink ID="HyperLink2" runat="server" Text="Level 1 Class List" NavigateUrl='<%# "DegreeClassList.aspx?pathwayID="+Eval("pathwayID")  + "&level=1"  %>'>Level 1 Class List</asp:HyperLink>


                                                                        </li>
                                                                        <li class="list-group-item">
                                                                            <asp:HyperLink ID="HyperLink3" runat="server" Text="Level 2 Class List" NavigateUrl='<%# "DegreeClassList.aspx?pathwayID="+Eval("pathwayID")  + "&level=2"  %>'>Level 2 Class List </asp:HyperLink>

                                                                        </li>
                                                                        <li class="list-group-item">
                                                                            <asp:HyperLink ID="HyperLink4" runat="server" Text="Level 3 Class List" NavigateUrl='<%# "DegreeClassList.aspx?pathwayID="+Eval("pathwayID")  + "&level=3"  %>'>Level 3 Class List</asp:HyperLink>
                                                                        </li>

                                                                        <li class="list-group-item">


                                                                            <asp:HyperLink ID="HyperLink5" runat="server" Text="Level 4 Class List" NavigateUrl='<%# "DegreeClassList.aspx?pathwayID="+Eval("pathwayID")  + "&level=4"  %>'>Level 4 Class List</asp:HyperLink>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
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

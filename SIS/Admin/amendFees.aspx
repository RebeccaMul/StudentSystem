<%@ Page Language="C#" AutoEventWireup="true" CodeFile="amendFees.aspx.cs" Inherits="Admin_amendFees" %>


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
                                <h3>Admin</h3>
                                <ul class="nav side-menu">
                                    <li><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                                    <li><a><i class="fa fa-group"></i>Students <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="Student.aspx">View Students</a></li>
                                            <li><a href="Student_Create.aspx">Create Student</a></li>
                                        </ul>
                                    </li>
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
                                    <h2>Finance Details</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">



                                    <!-- sql data source for one table to pull data from mylittleadmin-->
                                    <!-- Session used as filtering parameter-->
                                    <asp:SqlDataSource ID="displayfinance" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:dbconnect %>"
                                        SelectCommand="SELECT * FROM SIS_FINANCE
               INNER JOIN SIS_STUDENT ON SIS_STUDENT.studentID = SIS_FINANCE.studentID WHERE SIS_FINANCE.studentID = @id ">

                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="id" QueryStringField="studentID" Type="Int32" />
                                        </SelectParameters>

                                    </asp:SqlDataSource>
                                    <!-- List view to display the content from db-->
                                    <!-- Hyper link to pass module ID to next page-->

                                    <asp:ListView ID="paid" runat="server" DataSourceID="displayfinance">

                                        <ItemTemplate>
                                            <div class="col-md-12">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <asp:HyperLink ID="HyperLink1" runat="Server" Text="" NavigateUrl='<%# "amendFees.aspx?studentID=" + Eval("studentID")  %>'>
                                                            <b>
                                                                <asp:Label Text='<%# Eval("firstName") %>' runat="server" ID="firstNameLabel" />


                                                                <asp:Label Text='<%# Eval("lastName") %>' runat="server" ID="lastNameLabel" />
                                                                <br />
                                                                <asp:Label Text='<%# Eval("StudentNo") %>' runat="server" ID="Label3" />
                                                                <br />
                                                            </b>
                                                        </asp:HyperLink>
                                                    </div>
                                                    <div class="panel-body">
                                                        Course <b>
                                                            <asp:Label Text='<%# Eval("course") %>' runat="server" ID="courseLabel" /></b>
                                                        <br />

                                                        Level <b>
                                                            <asp:Label Text='<%# Eval("level") %>' runat="server" ID="levelLabel" /></b><br />

                                                        SFNI <b>
                                                            <asp:Label Text='<%# Eval("SFNI") %>' runat="server" ID="Label4" /></b><br />


                                                        Other Payment Method <b>
                                                            <asp:Label Text='<%# Eval("other") %>' runat="server" ID="Label6" /></b><br />

                                                        Finance Complete <b>
                                                            <asp:Label Text='<%# Eval("financeComplete") %>' runat="server" ID="TextBox1" /><br />
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <br />
                                    Fees Paid 
                                <br />


                                    <asp:TextBox ID="pfee" CssClass="form-control" runat="server"></asp:TextBox>
                                    <br />
                                    Fees Outstanding
      	
                            <asp:TextBox ID="ofee" CssClass="form-control" runat="server"></asp:TextBox>
                                    <br />
                                    Payment Complete
                                    <asp:DropDownList ID="feedropdown" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Fees Outstanding" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Fees Paid" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:Button ID="updateFee" runat="server" CssClass="btn btn-primary" Text="Update Student Finance" OnClick="updateFee_onClick" />
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
            </div>
        </div>


        <!-- /page content -->


        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/custom.js"></script>
        <script src="../js/nicescroll/jquery.nicescroll.min.js"></script>
    </form>
</body>

</html>


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="groupEmail.aspx.cs" Inherits="Lecturer_groupEmail" %>


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
                                    <h2>Email Students</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                    <div class="col-md-3">


                                        <asp:Label ID="Label3" runat="server" Text="Recipients:"></asp:Label><br />

                                        <!--JC -  gridview that holds the email address and displays to user-->


                                        <asp:GridView ID="GridView1" runat="server" CssClass="mydatagrid" EmptyDataText="No Students Enrolled on this Module" EmptyDataRowStyle-BorderWidth="0px" PagerStyle-CssClass="pager"
                                            HeaderStyle-CssClass="header" RowStyle-CssClass="rows" DataKeyNames="email" AutoGenerateColumns="false" BorderColor="White" DataSourceID="displayemail">

                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <!--JC -  Checkbox allows more multiple recepients-->
                                                        <asp:CheckBox ID="CheckBox1" Checked="true" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="email" SortExpression="name" />


                                            </Columns>
                                        </asp:GridView>
                                        <!--JC - sql data source to join two tables, and pull data from mylittleadmin-->
                                        <!--JC -  QueryString used as filtering parameter-->
                                        <asp:SqlDataSource ID="displayemail" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:dbconnect %>"
                                            SelectCommand="SELECT firstname,
             lastname,
             email 
            FROM SIS_USER
             INNER JOIN SIS_STUDENT ON SIS_USER.userID = SIS_STUDENT.userID
             INNER JOIN SIS_STUDENT_MODULES ON SIS_STUDENT.studentID = SIS_STUDENT_MODULES.studentID
            WHERE SIS_STUDENT_MODULES.moduleSelected = @myid AND SIS_STUDENT_MODULES.Completed='true'">


                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="myid" QueryStringField="moduleid" Type="Int32" />
                                            </SelectParameters>

                                        </asp:SqlDataSource>
                                        <br />
                                        <asp:Button ID="clearCheck" CssClass="btn btn-primary" runat="server" Text="Clear Receipents" OnClick="clearCheck_Click" />

                                    </div>

                                    <div class=" col-md-9">
                                          <!--JC -  Simple email form for subject and message-->

                                        <asp:Label ID="Label1" runat="server" Text="Subject:"></asp:Label>
                                        <asp:TextBox ID="subjecttext" CssClass="form-control" Width="100%" runat="server"></asp:TextBox>
                                        <br />
                                        <asp:Label ID="Label2" runat="server" Text="Body: "></asp:Label>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Width="100%" TextMode="MultiLine"></asp:TextBox>
                                        <br />
                                        <asp:Button ID="send" runat="server" CssClass="btn btn-primary" Text="Send Email" OnClick="send_Click" />
                                        <br />

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


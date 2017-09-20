<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExamSUM.aspx.cs" Inherits="SeniorUniversityManager_ExamSUM" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- Meta, title, CSS, favicons, etc. -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>SIS | Student</title>

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

                        <asp:SqlDataSource ID="profileDetailsNav" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT imagepath, firstName, lastName FROM SIS_STUDENT WHERE SIS_STUDENT.userID = @userID">
                            <SelectParameters>
                                <asp:SessionParameter Name="userID" SessionField="userID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:ListView ID="profileDetailsNavView" runat="server" DataSourceID="profileDetailsNav">
                            <ItemTemplate>

                                <!-- Profile Menu -->
                                <div class="profile">
                                    <div class="profile_pic">
                                        <asp:Image ID="profilePicMenu" runat="server" alt="User" class="img-circle profile_img" ImageUrl='<%# "../../files/" + Eval("imagepath")  %>' />
                                    </div>
                                    <div class="profile_info">
                                        <span>Welcome!</span>
                                        <h2>
                                            <asp:Label ID="userFirstName" runat="server" Text='<%# Eval("firstName") %>'></asp:Label>
                                            <asp:Label ID="userlastName" runat="server" Text='<%# Eval("lastName") %>'></asp:Label>
                                        </h2>
                                    </div>
                                </div>
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:ListView>
                        <!-- sidebar menu -->
                        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                            <div class="menu_section">
                                <h3>Student</h3>
                                <ul class="nav side-menu">
                                    <li><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                                    <li><a href="Timetable.aspx"><i class="fa fa-table"></i>Timetable</a></li>
                                    <li><a href="Modules.aspx"><i class="fa fa-list"></i>Modules</a></li>
                                    <li><a href="Transcript.aspx"><i class="fa fa-file-text-o"></i>Transcript</a></li>
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

                                        <asp:ListView ID="profileDetailsTopView" runat="server" DataSourceID="profileDetailsNav">
                                            <ItemTemplate>
                                                <asp:Image ID="image" runat="server" alt="User" ImageUrl='<%# "../../files/" + Eval("imagepath")  %>' />
                                                <asp:Label ID="useruser" runat="server" Text='<%# Eval("firstName") %>'></asp:Label>

                                            </ItemTemplate>
                                        </asp:ListView>
                                        <span class=" fa fa-angle-down"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                        <li><a href="Profile.aspx">Profile</a>
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
                                    <h2>Exams</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                   
                                    <br />

                                    <asp:SqlDataSource ID="Studentinfo" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_MODULES 
                      INNER JOIN SIS_RESULTS ON SIS_MODULES.moduleID = SIS_RESULTS.moduleID
                      INNER JOIN SIS_STUDENT ON SIS_RESULTS.studentID = SIS_STUDENT.studentID 
                      WHERE SIS_STUDENT.studentID = @studentID">
                                        <SelectParameters>
                                            
                                            <asp:QueryStringParameter Name="studentID" QueryStringField ="studentID"/>

                                        </SelectParameters>


                                    </asp:SqlDataSource>

                                      <!-- Barry MAXium result mark-->
                                    <asp:SqlDataSource ID="ResultMax" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT MAX(SIS_RESULTS.resultMark) AS Expr1 FROM SIS_MODULES INNER JOIN SIS_RESULTS ON SIS_MODULES.moduleID = SIS_RESULTS.moduleID INNER JOIN SIS_STUDENT ON SIS_RESULTS.studentID = SIS_STUDENT.studentID">
                                    </asp:SqlDataSource>
                                      

                                    <!-- Barry MIN result mark-->
                                    <asp:SqlDataSource ID="ResultMin" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT MIN(SIS_RESULTS.resultMark) AS Expr1 FROM SIS_MODULES INNER JOIN SIS_RESULTS ON SIS_MODULES.moduleID = SIS_RESULTS.moduleID INNER JOIN SIS_STUDENT ON SIS_RESULTS.studentID = SIS_STUDENT.studentID">
                                    </asp:SqlDataSource>
                                  


                                    <h3>Recent Exam Session</h3>
                                    <br />
                                   
                                    <div id="HTMLtoPDF">
                                    <asp:ListView ID="showmodule" runat="server" DataSourceID="Studentinfo">

                                        <Itemtemplate>

                                            <div class="panel panel-default">


                                                <div class="panel-body">


                                                    <b>Module Name:</b>
                                                    <asp:Label Text='<%# Eval("moduleName") %>' runat="server" ID="Label1" /><br />

                                                    <b>Course:</b>
                                                    <asp:Label Text='<%# Eval("course") %>' runat="server" ID="Label2" /><br />

                                                    <b>Level: </b>
                                                    <asp:Label Text='<%# Eval("level") %>' runat="server" ID="Label3" /><br />

                                                    <b>Result:</b>
                                                    <asp:Label Text='<%# Eval("resultMark") %>' runat="server" ID="Label4"></asp:Label>
                                                    <asp:Label Text='<%# Eval("pass/fail") %>' runat="server" ID="Label5" /><br />

                                                    <b>Min Module Mark</b>
                                                    <asp:Label Text=" " runat="server" ID="Label6" /><br />
                                                     <asp:GridView ID="GV_Min" runat="server" DataSourceID="ResultMin" Visible="true" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="Expr1" HeaderText="" SortExpression="Expr1" ReadOnly="True"></asp:BoundField>
                                        </Columns>
                                    </asp:GridView>

                                                    <b>Max Module Mark</b>
                                                    <asp:Label Text='' runat="server" ID="Label7" /><br />
                                                     <asp:GridView ID="GV_Max" runat="server" DataSourceID="ResultMax" Visible="true" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">

                                        <Columns>
                                            <asp:BoundField DataField="Expr1" HeaderText="" SortExpression="Expr1" ReadOnly="True"></asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                                </div>
                                                <br />
                                                <b>Avg Module Mark</b>
                                                <asp:Label Text='48' runat="server" ID="Label8"></asp:Label>

                                            </div>
                                        </Itemtemplate>

                                    </asp:ListView>
                                </div> <a href="#" class="btn btn-primary"  onclick="HTMLtoPDF()">Generate Report</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- /page content -->


        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/custom.js"></script>
        <script src="../js/jspdf.js"></script>
        <script src="../js/jquery-2.1.3.js"></script>
        <script src="../js/pdfFromHTML.js"></script>
        <script src="../js/nicescroll/jquery.nicescroll.min.js"></script>
    </form>
</body>

</html>

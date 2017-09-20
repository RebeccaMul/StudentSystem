<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewResources.aspx.cs" Inherits="Student_viewResources" %>

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
                                    <li><a href="AcademicRecord.aspx"><i class="fa fa-list-alt"></i>Academic Record</a></li>
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
                                    <h2>Module Resources</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                



                                    <div class="col-md-12" style="align-content:center">




                                        <asp:SqlDataSource ID="resources" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:dbconnect %>"
                                            SelectCommand="SELECT * FROM SIS_RESOURCES WHERE moduleID = @module">


                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="module" QueryStringField="moduleID" Type="Int16" />
                                            </SelectParameters>




                                        </asp:SqlDataSource>

                                        <asp:GridView ID="GridView1" DataSourceID="resources" AutoGenerateColumns="false" runat="server" CellPadding="10" BackColor="White" HorizontalAlign="Center" EmptyDataText="No Resources Available for this Module" GridLines="None">

                                            <Columns>
                                                <asp:BoundField DataField="title" ItemStyle-Width="200px" HeaderText="Title" />

                                                <asp:BoundField DataField="description" ItemStyle-Width="200px" HeaderText="Description" />
                                                <asp:BoundField DataField="datetime" ItemStyle-Width="200px" HeaderText="Date Uploaded" />
                                                <asp:TemplateField>
                                                    <ItemTemplate>

                                                        <asp:LinkButton ID="lnkDownload" Text="Download" CssClass="btn btn-primary" CommandArgument='<%# Eval("filepath") %>' runat="server" ItemStyle-Width="100px" OnClick="DownloadFile"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>





                                            </Columns>
                                            <EditRowStyle BackColor="#999999"></EditRowStyle>

                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                            <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                                            <RowStyle BackColor="#FFFFFF" ForeColor="#333333"></RowStyle>

                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                            <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                                            <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                                            <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                                            <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                                        </asp:GridView>
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

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fileUpload.aspx.cs" Inherits="AcademicProgramManager_fileUpload" %>

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
                                    <h2>File Upload</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                    <div class="col-md-4">
                                        <!-- JC Textboxes for resources details to be input -->

                                        <label for="productname">Name</label><br />
                                        <asp:TextBox ID="nametext" CssClass="form-control" runat="server" Text=""></asp:TextBox>
                                        <br />
                                        <label for="description">Description</label><br />
                                        <asp:TextBox ID="descriptiontext" CssClass="form-control" runat="server" Text=""></asp:TextBox>
                                        <br />

                                        <label for="image">File Upload</label><br />
                                        <asp:FileUpload ID="myimage" runat="server" />
                                        <br />

                                        <label for="price">Module</label><br />
                                        <!-- JC -Dropdown list to select Module -->
                                        <asp:SqlDataSource ID="modlist" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>'
                                            SelectCommand="SELECT * FROM SIS_MODULES"></asp:SqlDataSource>
                                        <asp:DropDownList ID="modulelist1" DataSourceID="modlist" DataTextField="moduleName" DataValueField="moduleID" CssClass="form-control" runat="server"></asp:DropDownList>
                                        <br />

                                        <asp:Button ID="submitbutton" runat="server" Text="Submit" class="btn btn-primary" OnClick="submitbutton_Click"></asp:Button>
                                    </div>
                                    <br />

                                    <asp:Label ID="myinfo" runat="server" Text=""></asp:Label>







                                    <div class="col-md-8">

                                    <!--JC - Here is the resources area, gridview used to stored resources available for download. -->


                                       <asp:SqlDataSource ID="resources" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:dbconnect %>"
                                            SelectCommand="SELECT * FROM SIS_RESOURCES INNER JOIN SIS_MODULES ON SIS_MODULES.moduleID = SIS_RESOURCES.moduleID"></asp:SqlDataSource>

                                        <asp:GridView ID="GridView1" DataSourceID="resources" AutoGenerateColumns="false" runat="server" BorderColor="Black" CellPadding="10" BackColor="White" GridLines="None" Width="100%">

                                            <Columns>
                                                <asp:BoundField DataField="title" ItemStyle-Width="20%" HeaderText="Title" />

                                                <asp:BoundField DataField="description" ItemStyle-Width="20%" HeaderText="Description" />
                                                <asp:BoundField DataField="datetime" ItemStyle-Width="20%" HeaderText="Date Uploaded" />
                                                <asp:BoundField DataField="moduleName" ItemStyle-Width="20%" HeaderText="Module" />
                                                <asp:TemplateField ItemStyle-Width="20%">
                                                    <ItemTemplate>

                                            <!-- JC - Two buttons, first is to link download with code behind command, second is to delete the resources from the system using resourceID-->
                                                        <asp:LinkButton ID="lnkDownload" Text="Download" CssClass="btn btn-primary" CommandArgument='<%# Eval("filepath") %>' runat="server" ItemStyle-Width="100px" OnClick="DownloadFile"></asp:LinkButton>

<asp:HyperLink ID="editLink" runat="Server" Text="Delete" ForeColor="Red"  CssClass="btn btn-default"
                                                            NavigateUrl='<%# "../admin/deletefile.aspx?resourceID="+Eval("resourceID") %>'>Delete</asp:HyperLink>
                                                    </ItemTemplate>
                                                    
                                                    
                                                </asp:TemplateField>



                                        <!-- SQL query to list all reources that are currently available -->

                                            </Columns>
                                            <EditRowStyle BackColor="#999999"></EditRowStyle>

                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                            <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

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

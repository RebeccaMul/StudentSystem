<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editProgramme.aspx.cs" Inherits="Admin_editProgramme" %>

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
                                    <h2>Pathway Details</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">


                                    <!--JC - Form created to gather data for editing programme information -->

                                    <asp:SqlDataSource ID="displayProgrammes" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_PROGRAMME 
                                      INNER JOIN SIS_PATHWAY ON SIS_PATHWAY.pathwayID = SIS_PROGRAMME.pathwayID
                                      INNER JOIN SIS_MODULES ON SIS_MODULES.moduleID = SIS_PROGRAMME.moduleID
                                       WHERE SIS_PROGRAMME.pathwayID = @path ">

                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="path" QueryStringField="pathwayID" Type="string" />

                                        </SelectParameters>

                                    </asp:SqlDataSource>

                                    <asp:SqlDataSource ID="pathway" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_PATHWAY WHERE SIS_PATHWAY.pathwayID = @path ">

                                        <SelectParameters>

                                            <asp:QueryStringParameter Name="path" QueryStringField="pathwayID" Type="string" />

                                        </SelectParameters>

                                    </asp:SqlDataSource>


                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="pathway">

                                        <ItemTemplate>

                                            <div class="col-md-6">


                                                <asp:Label ID="code" runat="server" Text="Pathway Name"> </asp:Label>
                                                <b>
                                                    <asp:Label Text='<%# Eval("pathwayName") %>' runat="server" ID="lastNameLabel" /></b>
                                                <br />
                                                <asp:Label ID="Label6" runat="server" Text="Pathway Code"> </asp:Label>
                                                <b>
                                                    <asp:Label Text='<%# Eval("pathwayCode") %>' runat="server" ID="firstNameLabel" /></b><br />

                                                <asp:Label ID="Label7" runat="server" Text="Pathway Duration"> </asp:Label>
                                                <b>
                                                    <asp:Label Text='<%# Eval("pathwayYears") %>' runat="server" ID="Label2" /></b><br />
                                                <asp:Label ID="Label8" runat="server" Text="Pathway Requirements"> </asp:Label>
                                                <b>
                                                    <asp:Label Text='<%# Eval("entryRequirements") %>' runat="server" ID="Label1" /></b><br />
                                                <asp:Label ID="Label9" runat="server" Text="Pathway Faculty"> </asp:Label>
                                                <b>
                                                    <asp:Label Text='<%# Eval("faculty") %>' runat="server" ID="Label3" /></b><br />

                                                <asp:Label ID="Label10" runat="server" Text="Pathway School"> </asp:Label>
                                                <b>
                                                    <asp:Label Text='<%# Eval("school") %>' runat="server" ID="Label4" /></b><br />
                                            </div>
                                            <asp:Label ID="Label11" runat="server" Text="Pathway Overview"> </asp:Label>

                                            <div class="col-md-6">
                                                <b>
                                                    <asp:Label Text='<%# Eval("overview") %>' runat="server" ID="Label5" /></b><br />



                                            </div>
                                        </ItemTemplate>

                                    </asp:ListView>


                                    <div class="col-md-12">
                                        <br />
                                    </div>
                                    <div class="x_title">
                                        <h2>Pathway Modules</h2>

                                        <div class="clearfix"></div>
                                    </div>

                                    <!--JC - SQL datasource for level 1 modules of programme-->

                                    <asp:SqlDataSource ID="level1" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_PROGRAMME 
                                      INNER JOIN SIS_PATHWAY ON SIS_PATHWAY.pathwayID = SIS_PROGRAMME.pathwayID
                                      INNER JOIN SIS_MODULES ON SIS_MODULES.moduleID = SIS_PROGRAMME.moduleID
                                       WHERE SIS_PROGRAMME.pathwayID = @path AND SIS_PROGRAMME.level = '1' ">

                                        <SelectParameters>


                                            <asp:QueryStringParameter Name="path" QueryStringField="pathwayID" Type="string" />

                                        </SelectParameters>


                                      
                                    </asp:SqlDataSource>  <!--JC - SQL datasource for level 2 modules of programme-->
                                    <asp:SqlDataSource ID="level2" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_PROGRAMME 
                                      INNER JOIN SIS_PATHWAY ON SIS_PATHWAY.pathwayID = SIS_PROGRAMME.pathwayID
                                      INNER JOIN SIS_MODULES ON SIS_MODULES.moduleID = SIS_PROGRAMME.moduleID
                                       WHERE SIS_PROGRAMME.pathwayID = @path AND SIS_PROGRAMME.level = '2' ">

                                        <SelectParameters>

                                            <asp:QueryStringParameter Name="path" QueryStringField="pathwayID" Type="string" />

                                        </SelectParameters>
                                        
                                    </asp:SqlDataSource><!--JC - SQL datasource for placement info of programme-->
                                    <asp:SqlDataSource ID="placement" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_PROGRAMME 
                                      INNER JOIN SIS_PATHWAY ON SIS_PATHWAY.pathwayID = SIS_PROGRAMME.pathwayID
                                      INNER JOIN SIS_MODULES ON SIS_MODULES.moduleID = SIS_PROGRAMME.moduleID
                                       WHERE SIS_PROGRAMME.pathwayID = @path AND SIS_PROGRAMME.level = '3' ">

                                        <SelectParameters>

                                            <asp:QueryStringParameter Name="path" QueryStringField="pathwayID" Type="string" />

                                        </SelectParameters>

                                    </asp:SqlDataSource>

                                    <!--JC - SQL datasource for level 4 modules of programme-->
                                    <asp:SqlDataSource ID="level4" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_PROGRAMME 
                                      INNER JOIN SIS_PATHWAY ON SIS_PATHWAY.pathwayID = SIS_PROGRAMME.pathwayID
                                      INNER JOIN SIS_MODULES ON SIS_MODULES.moduleID = SIS_PROGRAMME.moduleID
                                       WHERE SIS_PROGRAMME.pathwayID = @path AND SIS_PROGRAMME.level = '4' ">

                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="path" QueryStringField="pathwayID" Type="string" />
                                        </SelectParameters>

                                    </asp:SqlDataSource>
                                    <div class="col-md-3">
                                        <h4>
                                            <asp:Label ID="years" runat="server" Text="Level 1"> </asp:Label></h4>
                                        <asp:ListView ID="programmelist" runat="server" DataSourceID="level1">
                                            <ItemTemplate>

                                                <div class="list-group">

                                                    <asp:Label Text='<%# Eval("moduleName") %>' runat="server" ID="lastNameLabel" /><br />

                                                </div>

                                            </ItemTemplate>

                                        </asp:ListView>
                                    </div>

                                    <div class="col-md-3">
                                        <h4>
                                            <asp:Label ID="Label12" runat="server" Text="Level 2"> </asp:Label></h4>

                                        <asp:ListView ID="ListView2" runat="server" DataSourceID="level2">

                                            <ItemTemplate>

                                                <div class="list-group">

                                                    <asp:Label Text='<%# Eval("moduleName") %>' runat="server" ID="lastNameLabel" /><br />

                                                </div>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </div>

                                    <div class="col-md-3">

                                        <h4>
                                            <asp:Label ID="Label13" runat="server" Text="Placement"> </asp:Label></h4>

                                        <asp:ListView ID="ListView3" runat="server" DataSourceID="placement">

                                            <ItemTemplate>

                                                <div class="list-group">

                                                    <asp:Label Text='<%# Eval("moduleName") %>' runat="server" ID="lastNameLabel" /><br />

                                                </div>

                                            </ItemTemplate>
                                        </asp:ListView>
                                    </div>

                                    <div class="col-md-3">
                                        <h4>
                                            <asp:Label ID="Label14" runat="server" Text="Level 3"> </asp:Label></h4>
                                        <asp:ListView ID="ListView4" runat="server" DataSourceID="level4">

                                            <ItemTemplate>

                                                <div class="list-group">

                                                    <asp:Label Text='<%# Eval("moduleName") %>' runat="server" ID="lastNameLabel" /><br />

                                                </div>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="x_title">
                                            <h2>Edit Pathway</h2>

                                            <div class="clearfix"></div>
                                        </div>
                                    </div>

                                    <div class=" col-md-6">
                                        <asp:SqlDataSource ID="modules" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>'
                                            SelectCommand="SELECT * FROM SIS_MODULES">

                                            <SelectParameters>

                                                <asp:QueryStringParameter Name="path" QueryStringField="pathwayID" Type="string" />

                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <!-- JC - Area to add or remove modules-->

                                        Add Module to Pathway<br />
                                        <asp:DropDownList ID="modulelist" DataSourceID="modules" DataTextField="moduleName" DataValueField="moduleID" Width="50%" CssClass="form-control" runat="server"></asp:DropDownList><br />

                                        <asp:DropDownList ID="level" runat="server" CssClass="form-control" Width="50%">
                                            <asp:ListItem Text="Level 1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Level 2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Placement" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Level 3" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                        <br />


                                        <asp:Button ID="addmodule" runat="server" CssClass="btn btn-primary" Text="Add Module to Pathway" OnClick="addmodule_Click" />
                                    </div>

                                    <div class=" col-md-6">
                                        <asp:SqlDataSource ID="removemod" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_PROGRAMME
                                        INNER JOIN SIS_MODULES ON SIS_MODULES.moduleID = SIS_PROGRAMME.moduleID WHERE pathwayID = @path">

                                            <SelectParameters>

                                                <asp:QueryStringParameter Name="path" QueryStringField="pathwayID" Type="string" />

                                            </SelectParameters>
                                        </asp:SqlDataSource>



                                        Remove Module From Pathway<br />
                                        <asp:DropDownList ID="remmod" DataSourceID="removemod" DataTextField="moduleName" DataValueField="moduleID" Width="50%" CssClass="form-control" runat="server"></asp:DropDownList><br />
                                        <asp:Button ID="Remove" runat="server" CssClass="btn btn-primary" Text="Remove Module From Pathway" OnClick="remove_Click" />

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

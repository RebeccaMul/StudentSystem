<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewModules.aspx.cs" Inherits="SeniorUniversityManager_viewModules" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <!-- Meta, title, CSS, favicons, etc. -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>SIS | Academic Record</title>

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
                                    <li><a href="personalTutee.aspx"> <i class =" fa fa-user"></i>Tutees</a></li>
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
                                    <h2>Search for a Module</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">


                                    <asp:TextBox ID="searchbox" CssClass="form-control" runat="server" Text="" Style="width: 50%; float: left;" placeholder="Search by level (1,2,3,4)"></asp:TextBox>
                                    <asp:Button ID="Searchbtn" runat="server" Class="btn btn-primary" Text="Search" OnClick="Searchbtn_Click" Style="float: left; margin-left: 2px;" />
                                    <br />
                                    <br />
                                    <br />


                                    <asp:SqlDataSource ID="moudleDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT SIS_MODULES.moduleID, SIS_MODULES.pathwayName, SIS_MODULES.moduleCode, SIS_MODULES.moduleName, SIS_MODULES.moduleDescription, SIS_MODULES.units, SIS_MODULES.Level, SIS_MODULES.Semester, SIS_MODULES.Mandatory FROM SIS_MODULES INNER JOIN SIS_LECTURER ON SIS_MODULES.lecturerID = SIS_LECTURER.lecturerID WHERE SIS_MODULES.pathwayName = @id AND SIS_MODULES.level = 1">

                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="id" QueryStringField="pathwayName" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>


                                    <asp:SqlDataSource ID="moduleDetailsL2" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT SIS_MODULES.moduleID, SIS_MODULES.pathwayName, SIS_MODULES.moduleCode, SIS_MODULES.moduleName, SIS_MODULES.moduleDescription, SIS_MODULES.units, SIS_MODULES.Level, SIS_MODULES.Semester, SIS_MODULES.Mandatory FROM SIS_MODULES INNER JOIN SIS_LECTURER ON SIS_MODULES.lecturerID = SIS_LECTURER.lecturerID WHERE SIS_MODULES.pathwayName = @id AND SIS_MODULES.level = 2">

                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="id" QueryStringField="pathwayName" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                    <asp:SqlDataSource ID="moduleDetailsL3" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT SIS_MODULES.moduleID, SIS_MODULES.pathwayName, SIS_MODULES.moduleCode, SIS_MODULES.moduleName, SIS_MODULES.moduleDescription, SIS_MODULES.units, SIS_MODULES.Level, SIS_MODULES.Semester, SIS_MODULES.Mandatory FROM SIS_MODULES INNER JOIN SIS_LECTURER ON SIS_MODULES.lecturerID = SIS_LECTURER.lecturerID WHERE SIS_MODULES.pathwayName = @id AND SIS_MODULES.level = 3">

                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="id" QueryStringField="pathwayName" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                    <asp:SqlDataSource ID="moduleDetailsL4" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT SIS_MODULES.moduleID, SIS_MODULES.pathwayName, SIS_MODULES.moduleCode, SIS_MODULES.moduleName, SIS_MODULES.moduleDescription, SIS_MODULES.units, SIS_MODULES.Level, SIS_MODULES.Semester, SIS_MODULES.Mandatory FROM SIS_MODULES INNER JOIN SIS_LECTURER ON SIS_MODULES.lecturerID = SIS_LECTURER.lecturerID WHERE SIS_MODULES.pathwayName = @id AND SIS_MODULES.level = 4">

                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="id" QueryStringField="pathwayName" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                    <asp:Panel runat="server" ID="defaultDetails">

                                        
                                        <h4> Level 1</h4>
                                        <hr />
                                        <asp:ListView ID="level1" runat="server" DataSourceID="moudleDetails">

                                            <ItemTemplate>
                                                <div class="col-lg-4 col-md-4  col-sm-12 col-xs-12">
                                                    <div class="panel panel-default">
                                                       
                                                        <asp:HyperLink ID="editBtn" runat="server" Text="Class List" class="btn btn-primary" Style="float: right;" NavigateUrl='<%# "classlist.aspx?moduleID="+Eval("moduleID") %>'>Class List</asp:HyperLink>


                                                        <div class="panel-heading">
                                                            <b>Module Code:</b>
                                                            <asp:Label Text='<%# Eval("moduleCode") %>' runat="server" ID="moduleCode" /><br />

                                                            <b>lModule Name:</b>
                                                            <asp:Label Text='<%# Eval("moduleName") %>' runat="server" ID="moduleName" /><br />

                                                        </div>

                                                        <div class="panel-body">


                                                            <b>moduleDescription:</b>
                                                            <asp:Label Text='<%# Eval("moduleDescription") %>' runat="server" ID="moduleDescription" /><br />

                                                            <b>units	:</b>
                                                            <asp:Label Text='<%# Eval("units") %>' runat="server" ID="units" /><br />

                                                            <b>Level No:</b>
                                                            <asp:Label Text='<%# Eval("Level") %>' runat="server" ID="Level" /><br />

                                                            <b>Semester</b>
                                                            <asp:Label Text='<%# Eval("Semester") %>' runat="server" ID="Semester" /><br />

                                                            <b>Mandatory</b>
                                                            <asp:Label Text='<%# Eval("Mandatory") %>' runat="server" ID="Mandatory" /><br />

                                                        </div>

                                                    </div>


                                                </div>

                                            </ItemTemplate>
                                        </asp:ListView>
                                        <h4> Level 2</h4>
                                        <hr />
                                        <asp:ListView ID="level2" runat="server" DataSourceID="moduleDetailsL2">

                                            <ItemTemplate>
                                                <div class="col-lg-4 col-md-4  col-sm-12 col-xs-12">
                                                    <div class="panel panel-default">

                                                        <asp:HyperLink ID="editBtn" runat="server" Text="Class List" class="btn btn-primary" Style="float: right;" NavigateUrl='<%# "classlist.aspx?moduleID="+Eval("moduleID") %>'>Class List</asp:HyperLink>


                                                        <div class="panel-heading">
                                                            <b>Module Code:</b>
                                                            <asp:Label Text='<%# Eval("moduleCode") %>' runat="server" ID="moduleCode" /><br />

                                                            <b>lModule Name:</b>
                                                            <asp:Label Text='<%# Eval("moduleName") %>' runat="server" ID="moduleName" /><br />

                                                        </div>

                                                        <div class="panel-body">


                                                            <b>moduleDescription:</b>
                                                            <asp:Label Text='<%# Eval("moduleDescription") %>' runat="server" ID="moduleDescription" /><br />

                                                            <b>units	:</b>
                                                            <asp:Label Text='<%# Eval("units") %>' runat="server" ID="units" /><br />

                                                            <b>Level No:</b>
                                                            <asp:Label Text='<%# Eval("Level") %>' runat="server" ID="Level" /><br />

                                                            <b>Semester</b>
                                                            <asp:Label Text='<%# Eval("Semester") %>' runat="server" ID="Semester" /><br />

                                                             <b>Mandatory</b>
                                                            <asp:Label Text='<%# Eval("Mandatory") %>' runat="server" ID="Mandatory" /><br />


                                                        </div>

                                                    </div>

                                                </div>

                                            </ItemTemplate>
                                        </asp:ListView>

                                        <br />
                                        <h4> Level 3</h4>
                                        <hr />
                                        <asp:ListView ID="level3" runat="server" DataSourceID="moduleDetailsL3">

                                            <ItemTemplate>
                                                <div class="col-lg-4 col-md-4  col-sm-12 col-xs-12">
                                                    <div class="panel panel-default">

                                                        <asp:HyperLink ID="editBtn" runat="server" Text="Class List" class="btn btn-primary" Style="float: right;" NavigateUrl='<%# "classlist.aspx?moduleID="+Eval("moduleID") %>'>Class List</asp:HyperLink>


                                                        <div class="panel-heading">
                                                            <b>Module Code:</b>
                                                            <asp:Label Text='<%# Eval("moduleCode") %>' runat="server" ID="moduleCode" /><br />

                                                            <b>lModule Name:</b>
                                                            <asp:Label Text='<%# Eval("moduleName") %>' runat="server" ID="moduleName" /><br />

                                                        </div>

                                                        <div class="panel-body">


                                                            <b>moduleDescription:</b>
                                                            <asp:Label Text='<%# Eval("moduleDescription") %>' runat="server" ID="moduleDescription" /><br />

                                                            <b>units	:</b>
                                                            <asp:Label Text='<%# Eval("units") %>' runat="server" ID="units" /><br />

                                                            <b>Level No:</b>
                                                            <asp:Label Text='<%# Eval("Level") %>' runat="server" ID="Level" /><br />

                                                            <b>Semester</b>
                                                            <asp:Label Text='<%# Eval("Semester") %>' runat="server" ID="Semester" /><br />
                                                               <b>Mandatory</b>
                                                            <asp:Label Text='<%# Eval("Mandatory") %>' runat="server" ID="Mandatory" /><br />



                                                        </div>

                                                    </div>

                                                </div>

                                            </ItemTemplate>
                                        </asp:ListView>

                                        
                                        <h4> Level 4</h4>
                                        <hr />
                                        <asp:ListView ID="level4" runat="server" DataSourceID="moduleDetailsL4">

                                            <ItemTemplate>
                                                <div class="col-lg-4 col-md-4  col-sm-12 col-xs-12">
                                                    <div class="panel panel-default">

                                                        <asp:HyperLink ID="editBtn" runat="server" Text="Class List" class="btn btn-primary" Style="float: right;" NavigateUrl='<%# "classlist.aspx?moduleID="+Eval("moduleID") %>'>Class List</asp:HyperLink>


                                                        <div class="panel-heading">
                                                            <b>Module Code:</b>
                                                            <asp:Label Text='<%# Eval("moduleCode") %>' runat="server" ID="moduleCode" /><br />

                                                            <b>lModule Name:</b>
                                                            <asp:Label Text='<%# Eval("moduleName") %>' runat="server" ID="moduleName" /><br />

                                                        </div>

                                                        <div class="panel-body">


                                                            <b>moduleDescription:</b>
                                                            <asp:Label Text='<%# Eval("moduleDescription") %>' runat="server" ID="moduleDescription" /><br />

                                                            <b>units	:</b>
                                                            <asp:Label Text='<%# Eval("units") %>' runat="server" ID="units" /><br />

                                                            <b>Level No:</b>
                                                            <asp:Label Text='<%# Eval("Level") %>' runat="server" ID="Level" /><br />

                                                            <b>Semester</b>
                                                            <asp:Label Text='<%# Eval("Semester") %>' runat="server" ID="Semester" /><br />

                                                               <b>Mandatory</b>
                                                            <asp:Label Text='<%# Eval("Mandatory") %>' runat="server" ID="Mandatory" /><br />


                                                        </div>

                                                    </div>

                                                </div>

                                            </ItemTemplate>
                                        </asp:ListView>
                                    </asp:Panel>



                                    <asp:SqlDataSource ID="moduleDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_MODULES WHERE ([Level] LIKE '%' + @Level + '%') AND ([pathwayName] LIKE '%' + @pathwayName + '%') ">

                                        <SelectParameters>
                                     
                                            <asp:QueryStringParameter QueryStringField="searchquery" Name="Level" Type="String"></asp:QueryStringParameter>
                                            <asp:QueryStringParameter QueryStringField="pathwayName" Name="pathwayName" Type="String"></asp:QueryStringParameter>

                                           

                                        </SelectParameters>


                                    </asp:SqlDataSource>
                                   

                                    <asp:Panel runat="server" ID="searchresults" Visible="false">

                                        <div id="HTMLtoPDF">

                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="moduleDetails">

                                            <ItemTemplate>

                                             <div class="col-lg-4 col-md-4  col-sm-12 col-xs-12">
                                                     <div class="panel panel-default">

                                                        <asp:HyperLink ID="editBtn" runat="server" Text="Class List" class="btn btn-primary" Style="float: right;" NavigateUrl='<%# "classlist.aspx?moduleID="+Eval("moduleID") %>'>Class List</asp:HyperLink>
                                                        

                                                        <div class="panel-heading">
                                                            <b>Module Code:</b>
                                                            <asp:Label Text='<%# Eval("moduleCode") %>' runat="server" ID="moduleCode" /><br />

                                                            <b>lModule Name:</b>
                                                            <asp:Label Text='<%# Eval("moduleName") %>' runat="server" ID="moduleName" /><br />

                                                        </div>

                                                        <div class="panel-body">
                                                            

                                                            <b>moduleDescription:</b>
                                                            <asp:Label Text='<%# Eval("moduleDescription") %>' runat="server" ID="moduleDescription" /><br />

                                                            <b>units	:</b>
                                                            <asp:Label Text='<%# Eval("units") %>' runat="server" ID="units" /><br />

                                                            <b>Level No:</b>
                                                            <asp:Label Text='<%# Eval("Level") %>' runat="server" ID="Level" /><br />

                                                            <b>Semester</b>
                                                            <asp:Label Text='<%# Eval("Semester") %>' runat="server" ID="Semester" /><br />

                                                               <b>Mandatory</b>
                                                            <asp:Label Text='<%# Eval("Mandatory") %>' runat="server" ID="Mandatory" /><br />


                                                        </div>

                                                    </div>

                                                </div>
                                                    
                                            </ItemTemplate>

                              </asp:ListView>
                                    </asp:Panel>
                                </div>
                            </div> <a href="#" class="btn btn-primary"  onclick="HTMLtoPDF()">Print PDF</a>
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

        <!-- Barry pdf -->
        <script src="../js/jspdf.js"></script>
        <script src="../js/jquery-2.1.3.js"></script>
        <script src="../js/pdfFromHTML.js"></script>
    </form>
</body>

</html>

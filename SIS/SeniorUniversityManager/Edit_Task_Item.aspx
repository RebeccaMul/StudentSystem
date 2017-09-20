<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit_Task_Item.aspx.cs" Inherits="SeniorUniversityManager_EditTask_Item" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- Meta, title, CSS, favicons, etc. -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>SIS | Senior University Manager</title>

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
                                <h3>Senior University Manager</h3>
                                <ul class="nav side-menu">
                                    <li class="licurrent"><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                                    <li><a href="Lecturers.aspx"><i class="fa fa-group"></i>Lecturers</a></li>
                                    <li><a href="Statistics.aspx"><i class="fa fa-bar-chart-o"></i>Statistics</a></li>
                                    <li><a><i class="fa fa-folder"></i>Modules <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="viewModuleSUM.aspx">My Modules</a></li>
                                            <li><a href="searchModuleSUM.aspx">Search All Modules</a></li>
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-group"></i>Students <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="StudentSUM.aspx">View Students</a></li>
                                            <li><a href="Student_Create.aspx">Create Student</a></li>
                                            <li><a href="Student_Timetable.aspx">View Timetable</a></li>


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
                                    <h2>Edit Task</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                       <div class="panel panel-default">
                                   <div class="panel-heading">
                                    Edit your Tasks below:
                                       
                                       </div>
                                    <div class='panel-body'>
                                   

                                                                      

                                               <div class="col-md-4 col-sm-12 col-xs-12">


                                                      <asp:SqlDataSource ID="readfromTask" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_TASK WHERE taskID = @taskID">
                                            <SelectParameters>
                                             <asp:QueryStringParameter Name="taskID" QueryStringField="taskID" />
                                             
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT username, typeID FROM SIS_USER WHERE (typeID = 1)">

                                    </asp:SqlDataSource>

                                                        
                                                 <hr />
                                                   
                                                        <asp:SqlDataSource ID="proxyDropdown" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT username, typeID FROM SIS_USER WHERE (typeID =1)"></asp:SqlDataSource>

                                                     <asp:Label ID="assignList" runat="server" Text="Assign To A Proxy"></asp:Label>
                                                    <asp:DropDownList ID="proxyList" runat="server" DataSourceID="proxyDropdown" DataTextField="username" CssClass="form-control" DataValueField="username"></asp:DropDownList>
                                                  
                                       
                                                   <br />
                                                   <asp:Label ID="displayLabel" runat="server" Font-Size="Small" Text=""></asp:Label>
</div>
<div class="col-md-8 col-sm-12 col-xs-12">
                                                            <b>Title:</b>
                                                           <asp:TextBox ID="taskName" CssClass="form-control" runat="server"></asp:TextBox><br />

                                                   <asp:ListView ID="displayDate" runat="server" DataSourceID="readfromTask">
                                                        <ItemTemplate>
                                                 
                                             <b>Date:</b>
                                                           <asp:TextBox ID="taskDate" CssClass="form-control" runat="server" Enabled="false" Text='<%# Eval("taskDate")  %>'></asp:TextBox><br />
                                                   </ItemTemplate>
                                                   </asp:ListView>

                                               
                                        <b>Message:</b>
                                                            <asp:TextBox ID="taskMessage" CssClass="form-control" runat="server" TextMode="MultiLine" Height="200px" ></asp:TextBox>
                                        <br />

   
    <button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-danger">Delete</button>
                                                    <asp:Button ID="saveBtn" runat="server" Text="Save Changes" CssClass="btn btn-primary submit" style="float:right;" OnClick="saveBtn_Click" />
     <asp:Button ID="cancelBtn" runat="server" Text="Back" class="btn btn-default" style="float:right;" OnClick="cancelBtn_Click"/>
                                 
                                       </div>

                                          <!-- Modal -->
                                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Confirm Delete</h5>
                                                    </div>
                                                    <div class="modal-body">
                                                       Are you sure you want to delete this task?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="margin-bottom: 0px">Close</button>
                                                        <asp:Button ID="deleteConfirmBtn" runat="server" Text="Delete" class="btn btn-danger" CausesValidation="false" onClick="deleteConfirmBtn_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                                    
                             

                                            <br />
                                       
                                        </div>
                                                                    
                               </div>
                           
                        </div>
                        
                        </div>
                    </div> </div>
                    </div>

        <!-- /page content -->


        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/custom.js"></script>
        <script src="../js/nicescroll/jquery.nicescroll.min.js"></script>
    </form>
</body>

</html>

﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewMarks.aspx.cs" Inherits="SIS2_AcademicProgramManager_viewMarks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- Meta, title, CSS, favicons, etc. -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>SIS | Academic Program Manager</title>

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
                <div class="right_col" role="main" style="min-height: 965px;">

                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Edit Assignment Marks</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    
                                      

                                          <asp:SqlDataSource ID="assignMarks" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:dbconnect %>"
                                        SelectCommand="SELECT * FROM SIS_STUDENT 
                  INNER JOIN SIS_RESULTS ON SIS_RESULTS.studentID = SIS_STUDENT.studentID
                  INNER JOIN SIS_ASSIGNMENT ON SIS_ASSIGNMENT.assignmentID = SIS_RESULTS.assignmentID
                  INNER JOIN SIS_MODULES ON SIS_RESULTS.moduleID = SIS_MODULES.moduleID  
                  WHERE SIS_STUDENT.studentID=@id ">
                                            
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="id"  QueryStringField="studentID" Type="Int32" />
                                           
                                        </SelectParameters></asp:SqlDataSource>

                                        
            <div class="col-md-12"> </div>
           
                 
                                  

   <asp:ListView ID="assignmentResults" runat="server" DataSourceID="assignMarks">
      
                <ItemTemplate>
            

            <div class="col-lg-3 col-md-4  col-sm-12 col-xs-12">
                <div class="panel panel-default">
  <div class="panel-heading">

     
                            

<asp:HyperLink ID="assignHyper2" runat="Server" Text="Edit Assignment Marks"  CssClass="btn btn-primary submit" float="right" style="float: right;"
           NavigateUrl='<%# "editMarks.aspx?studentID="+Eval("studentID") + "&resultsID=" + Eval ("resultsID") + "&moduleID="+ Eval ("moduleID") %>'>Edit 

</asp:HyperLink>

       
       
           <b>Assignment:</b>
           <br />
           <asp:Label ID="Label1" runat="server" Text='<%# Eval("moduleCode") + "<br/>" +Eval("assignmentName") %>'></asp:Label>

      

      </div>
                  
  <div class="panel-body">
            
                         <b>Mark:</b>
                          <asp:Label ID="Label2" runat="server" Text='<%# Eval("resultMark") %>'></asp:Label>
      <br />
                          <br />
                          <b>Result:</b>
                           <asp:Label ID="Label5" runat="server" Text='<%# Eval("pass/fail") %>'></asp:Label>
      <br />
                            <br />
                           <b>Percentage:</b>
                           <asp:Label ID="percentage" runat="server" Text='<%# Eval("percentage") %>'></asp:Label>%
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

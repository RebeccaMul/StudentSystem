<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="Lecturer_lecturerDashboard" %>


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
                                    <h2>Personal Details</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                         <asp:Label ID="pagetitle" runat="server" Text="Welcome" Font-Size="35px"></asp:Label>
               <asp:ListView ID="ListView2" runat="server" DataSourceID="HomeDetails">
                  <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("firstName") + "!"%>' Font-Size="35px"></asp:Label>
                                       
                  </ItemTemplate>

              </asp:ListView>
              
              <br /><br />

                 <asp:SqlDataSource ID="HomeDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' 
                  SelectCommand="SELECT * FROM SIS_ADMIN
                  INNER JOIN SIS_USER ON SIS_ADMIN.userID = SIS_USER.userID
                  WHERE SIS_ADMIN.userID=@ID ">
                  <SelectParameters>
                   <asp:SessionParameter Name="ID" SessionField="userid" Type="string" />
                </SelectParameters>

              </asp:SqlDataSource>

              <asp:ListView ID="ListView1" runat="server" DataSourceID="HomeDetails">
                                        <ItemTemplate>
                                            <div class="text-center">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        Personal Details:
                                       
                                                    </div>

                                                    <div class="panel-body">
                                                        <b>Name:</b>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("firstName") %>'></asp:Label>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("lastName") %>'></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>Address:</b>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>Contact Number:</b>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("contactNumber") %>'></asp:Label>
                                                        <br />
                                                        <br />
                                                        <b>Email:</b>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                                    </div>
                                                    <br />

                                                    
                                                </div>



                                                
                                            </div>


                                        </ItemTemplate>

                                    </asp:ListView><br />
              
              
              <div id="buttons" style="margin-left:33%; margin-right:0%">
                                   <asp:HyperLink ID="HyperLink5" runat="server" class="btn btn-default" style="background-color:#c41030; color:white;" NavigateUrl="~/SIS/lecturer/viewmodule.aspx">View Modules</asp:HyperLink>

            <asp:HyperLink ID="HyperLink6" runat="server" class="btn btn-default" style="background-color:#c41030; color:white;" NavigateUrl="~/SIS/lecturer/emailmodule.aspx">Email group</asp:HyperLink>
      
                 <asp:HyperLink ID="HyperLink7" runat="server" class="btn btn-default" style="background-color:#c41030; color:white;" NavigateUrl="~/SIS/admin/resultsmodule.aspx">View/Add Results</asp:HyperLink>
       
                  
                   </div><br />


            </div>
                            
                       <br /> 
             
                        

         
               
              
            </div>
          </div>
        </div>
      </div>
   
    <!-- Footer -->
    <!-- Javascripts -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js" type="text/javascript"></script><script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js" type="text/javascript"></script><script src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.6.2/modernizr.min.js" type="text/javascript"></script><script src="../assets/javascripts/application-985b892b.js" type="text/javascript"></script>
    <!-- Google Analytics -->
     <script>
         function logoutconfirm() {
             if (confirm('Are you sure you want to logout?')) {
                 return true;
             } else {
                 return false;
             }
         }</script>
    </form>
</body>
</html>

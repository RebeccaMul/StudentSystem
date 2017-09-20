<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DegreeClassList.aspx.cs" Inherits="Lecturer_DegreeClassList" %>

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
                                    <li><a href="personalTutee.aspx"> <i class =" fa fa-user"></i>Tutees</a></li>
                                    <li><a><i class="fa fa-group"></i>Students <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="Student.aspx">View Students</a></li>
                                            
                                        </ul>
                                    </li>
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
                                    <h2>Class List</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                             
                       


      
                                    <asp:SqlDataSource ID="moudleDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT firstName +' '+ lastName AS name,SIS_STUDENT.studentID, SIS_STUDENT.address, SIS_STUDENT.contactNumber,SIS_STUDENT.course, SIS_STUDENT.level, SIS_STUDENT.kinFirstName, SIS_STUDENT.kinLastName, SIS_STUDENT.kinAddress, SIS_STUDENT.kinContactNumber, SIS_STUDENT.pathwayID, SIS_STUDENT.studentNo FROM SIS_STUDENT INNER JOIN SIS_PATHWAY ON SIS_STUDENT.pathwayID = SIS_PATHWAY.pathwayID WHERE SIS_STUDENT.pathwayID = @id AND SIS_STUDENT.level =@levelID ORDER BY SIS_STUDENT.lastName">

                                                        <SelectParameters>
                                                            <asp:QueryStringParameter Name="id" QueryStringField="pathwayID" />
                                                            <asp:QueryStringParameter Name="levelID" QueryStringField="level" />
                                                        </SelectParameters>
              </asp:SqlDataSource>

                  <asp:Panel runat="server" ID="defaultDetails"> 
                      
                            
                      <div id="HTMLtoPDF">
                <asp:ListView ID="ListView2" runat="server" DataSourceID="moudleDetails">

                                        <ItemTemplate>
                                           <div class="col-lg-3 col-md-4  col-sm-12 col-xs-12">
                                                <div class="panel panel-default">
                                                   
                                                          

                                                        <div class="panel-heading">
                                                            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Black" NavigateUrl='<%# "academicRecord.aspx?studentID="+ Eval("StudentID")%>'>
                                                    <asp:Label Text='<%# Eval("name")+ "-" %>' runat="server" ID="name" /><br />
                                                              
                            <asp:Label Text='<%# Eval("studentNo") %>' runat="server" ID="studentNo" />
                                <br />
                                                                </asp:HyperLink>
                                                    </div>

                                                    <div class="panel-body">
    Course
                            <asp:Label Text='<%# Eval("course") %>' runat="server" ID="pathwayName" />
                                <br />
                            
                            Level
                            <asp:Label Text='<%# Eval("level") %>' runat="server" ID="level" /><br />
                                <br />
                       
  </div>

                                          </div>

                                     </div>

                                  </ItemTemplate>
                                                    </asp:ListView>
                      </asp:Panel>
                                    </div>

                                   

                                      
                                </div><a href="#" class="btn btn-primary"  onclick="HTMLtoPDF()">Print Class List</a>
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
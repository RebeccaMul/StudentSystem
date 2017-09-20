<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClassListSUM.aspx.cs" Inherits="SeniorUniversityManager_ClassListSUM" %>

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
                                <h3>Senior University Manager</h3>
                                <ul class="nav side-menu">
                                    <li class="licurrent"><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                                    <li><a href="Lecturers.aspx"><i class="fa fa-group"></i>Lecturers</a></li>
                                    <li><a href="Statistics.aspx"><i class="fa fa-bar-chart-o"></i>Statistics</a></li>
                                    <li><a><i class="fa fa-folder"></i>Modules <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="viewModuleSUM.aspx">My Modules</a></li>
                                            <li><a href="searchModuleSUM.aspx">All Modules</a></li>
                                            <li><a href="degreeProgramSearch.aspx">Other Pathway</a></li>
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-group"></i>Students <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="StudentSUM.aspx">View Students</a></li>
                                            <li><a href="Student_Create.aspx">Create Student</a></li>
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
                                    <h2>Class List</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                    <asp:SqlDataSource ID="UserDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_FINANCE
               INNER JOIN SIS_STUDENT ON SIS_STUDENT.studentID = SIS_FINANCE.studentID WHERE ([firstName] LIKE '%' + @FName + '%') OR ([lastName] LIKE '%' + @LName + '%') OR ([StudentNo] LIKE '%' + @StudentNo + '%')">

                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="searchquery" Name="Fname" Type="String"></asp:QueryStringParameter>
                        <asp:QueryStringParameter QueryStringField="searchquery" Name="Lname"></asp:QueryStringParameter>
                     
                        <asp:QueryStringParameter QueryStringField="searchquery" Name="StudentNo"></asp:QueryStringParameter>
                    </SelectParameters>


                </asp:SqlDataSource>

                                    <br />
                                    <div class="col-md-4">
                                Search:
                                <br />
                                
                                     <div class="input-group">
     <asp:TextBox ID="searchtitle" CssClass="form-control" runat="server" Text=""></asp:TextBox>
      <span class="input-group-btn">
          <asp:Button ID="Searchbtn" runat="server" Class="btn btn-primary" Text="Search" OnClick="Searchbtn_Click" />
      </span>
    </div><!-- /input-group -->
                                </div>
                                    <div class="col-md-12"> </div>
                






                     <asp:ListView ID="ListView1" runat="server" DataSourceID="userDetails">
      
                <ItemTemplate>
            <div class="col-md-2">
                <div class="panel panel-default">
  <div class="panel-heading">
                                 <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Black" NavigateUrl='<%# "academicRecord.aspx?studentID="+ Eval("StudentID")%>'>
    
                            <asp:Label Text='<%# Eval("firstName") %>' runat="server" ID="firstNameLabel" />
                                
                         
                            <asp:Label Text='<%# Eval("lastName") %>' runat="server" ID="lastNameLabel" />
                                <br />
                            <asp:Label Text='<%# Eval("StudentNo") %>' runat="server" ID="Label3" />
                                <br />
                            </asp:HyperLink>
      
  </div>
  <div class="panel-body">
    Course
                            <asp:Label Text='<%# Eval("course") %>' runat="server" ID="courseLabel" />
                                <br />
                            
                            Level
                            <asp:Label Text='<%# Eval("level") %>' runat="server" ID="levelLabel" /><br />
                                <br />
                          
  </div>
</div>
                           
                            
                            
                        </div>      
                     
                     </ItemTemplate>
                </asp:ListView> 




          
      <!-- RME sql data source for one table to pull data from mylittleadmin-->  <!-- Session used as filtering parameter-->
           <asp:SqlDataSource ID="displayfinance" runat="server" 
         ConnectionString="<%$ ConnectionStrings:dbconnect %>" 
         SelectCommand="SELECT * FROM SIS_STUDENT_MODULES
               INNER JOIN SIS_STUDENT ON SIS_STUDENT.studentID = SIS_STUDENT_MODULES.studentID WHERE SIS_STUDENT_MODULES.moduleSelected = @id AND SIS_STUDENT_MODULES.Completed = 'False'">
        
               <SelectParameters>
                   <asp:QueryStringParameter QueryStringField="moduleid" Name="id"></asp:QueryStringParameter>
               </SelectParameters>
        </asp:SqlDataSource>
              <!-- RME List view to display the content from db--> <!-- Hyper link to pass module ID to next page-->

               <asp:ListView ID="paid" runat="server" DataSourceID="displayfinance">
      
                <ItemTemplate>
            <div class="col-md-2">
                <div class="panel panel-default">
  <div class="panel-heading">

      <!--RME Hyper link to navigate from student number to academic record-->

                            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Black" NavigateUrl='<%# "academicRecord.aspx?studentID="+ Eval("StudentID")%>'>

                            <asp:Label Text='<%# Eval("firstName") %>' runat="server" ID="firstNameLabel" />
                                
                         
                            <asp:Label Text='<%# Eval("lastName") %>' runat="server" ID="lastNameLabel" />
                                <br />
                            <asp:Label Text='<%# Eval("StudentNo") %>' runat="server" ID="Label3" />
                                <br />
                            </asp:HyperLink>
  </div>
  <div class="panel-body">
    Course
                            <asp:Label Text='<%# Eval("course") %>' runat="server" ID="courseLabel" />
                                <br />
                            
                            Level
                            <asp:Label Text='<%# Eval("level") %>' runat="server" ID="levelLabel" /><br />
                                <br />
                       
  </div>
</div>
                           
                            
                            
                        </div>      
                     
                     </ItemTemplate>
                </asp:ListView> 
                                </div>

                                 <asp:Button ID="Sendemail" runat="server" CssClass="btn btn-primary" Text="Email Students" OnClick="sendemail_Click" /> 
                                       
                                    
                             <asp:Button ID="contactDetails" runat="server" Text="Class List - Contact Details" CssClass="btn btn-primary"  OnClick="viewContact_Click" /> 

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


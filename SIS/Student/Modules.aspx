<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Modules.aspx.cs" Inherits="Student_Modules" %>

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

                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT imagepath, firstName, lastName FROM SIS_STUDENT WHERE SIS_STUDENT.userID = @userID">
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
                                  <asp:ListView ID="ListView4" runat="server" DataSourceID="StudentDetails">
                                    <ItemTemplate>
                                    <li><asp:HyperLink ID="link" runat="server" NavigateUrl='<%# "Transcript.aspx?studentID=" + Eval("studentID")%>'><i class="fa fa-file-text-o"></i>Transcript</asp:HyperLink></li>
                                            
                                    </ItemTemplate>
                                    </asp:ListView>
                                     <asp:ListView ID="ListView5" runat="server" DataSourceID="StudentDetails">
                                    <ItemTemplate>
                                    <li><asp:HyperLink ID="link" runat="server" NavigateUrl='<%# "AcademicRecord.aspx?studentID=" + Eval("studentID")%>'><i class="fa fa-list-alt"></i>Academic Record</asp:HyperLink></li>
                                            
                                    </ItemTemplate>
                                    </asp:ListView>
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
                                        <li><a href="Help.aspx">Help</a>
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
                                    <h2>Modules</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                     <asp:SqlDataSource ID="profileDetailsNav" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT imagepath, firstName, lastName FROM SIS_STUDENT WHERE SIS_STUDENT.userID = @userID">
                            <SelectParameters>
                                <asp:SessionParameter Name="userID" SessionField="userID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

<!-- sql data source to join two tables, and pull data from mylittleadmin--><!-- Session used as filtering parameter-->
           <asp:SqlDataSource ID="viewModules" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' 
               SelectCommand="SELECT SIS_MODULES.moduleID, SIS_MODULES.moduleName, SIS_MODULES.moduleDescription, SIS_MODULES.moduleCode 
               FROM SIS_MODULES
               INNER JOIN SIS_STUDENT_MODULES ON SIS_MODULES.moduleID = SIS_STUDENT_MODULES.moduleSelected
               INNER JOIN SIS_STUDENT ON SIS_STUDENT_MODULES.studentID = SIS_STUDENT.studentID
               INNER JOIN SIS_USER ON SIS_STUDENT.userID = SIS_USER.userID
               WHERE SIS_STUDENT_MODULES.Completed=0
               AND SIS_STUDENT.userID = @userid
               ORDER BY SIS_MODULES.moduleCode ">
              <SelectParameters>
                                            <asp:SessionParameter Name="userid" SessionField="userid" Type="string" />
                                        </SelectParameters>
           </asp:SqlDataSource>
                                    
                          <h2 style="margin-left:12px">Modules for current academic year:</h2><hr />

                            <asp:ListView ID="ListView1" runat="server" DataSourceID="viewModules">
                                            
                              <ItemTemplate>
                                 <div class="col-md-4 col-sm-12 col-xs-12">
                                      <div class="panel panel-default">
                                          <div class="panel-heading">

                                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Black" NavigateUrl='<%# "viewResources.aspx?moduleID="+Eval("moduleID") %>'>

                             
                               <asp:Label ID="Label1" runat="server" ForeColor="Black" Text='<%# Eval("moduleCode") %>' />:  
                                <asp:Label ID="modulename" runat="server" ForeColor="Black"  Text='<%# Eval("moduleName") %>' /></div> </asp:HyperLink>

                                <div class="panel-body">
                                <asp:Label ID="Label2" runat="server" Text="Description:  "></asp:Label>
                                <asp:Label ID="desc" runat="server" ForeColor="Black" Text='<%# Eval("moduleDescription") %>' />
                                </br> 
                                </br>

                                </div>
                                       </div>
                                          </div>
                                             
                            </ItemTemplate>
                                                      
                            </asp:ListView>
                                    <br />


               <asp:SqlDataSource ID="viewOldModules1" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' 
               SelectCommand="SELECT SIS_MODULES.moduleID, SIS_MODULES.moduleName, SIS_MODULES.moduleDescription, SIS_MODULES.moduleCode 
               FROM SIS_MODULES
               INNER JOIN SIS_STUDENT_MODULES ON SIS_MODULES.moduleID = SIS_STUDENT_MODULES.moduleSelected
               INNER JOIN SIS_STUDENT ON SIS_STUDENT_MODULES.studentID = SIS_STUDENT.studentID
               INNER JOIN SIS_USER ON SIS_STUDENT.userID = SIS_USER.userID
               WHERE SIS_STUDENT_MODULES.Completed=1 AND SIS_MODULES.Level = 1
               AND SIS_STUDENT.userID = @userid
               ORDER BY SIS_MODULES.moduleCode ">
              <SelectParameters>
                    <asp:SessionParameter Name="userid" SessionField="userid" Type="string" />
             </SelectParameters>
           </asp:SqlDataSource>

                                      <asp:SqlDataSource ID="viewOldModules2" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' 
               SelectCommand="SELECT SIS_MODULES.moduleID, SIS_MODULES.moduleName, SIS_MODULES.moduleDescription, SIS_MODULES.moduleCode 
               FROM SIS_MODULES
               INNER JOIN SIS_STUDENT_MODULES ON SIS_MODULES.moduleID = SIS_STUDENT_MODULES.moduleSelected
               INNER JOIN SIS_STUDENT ON SIS_STUDENT_MODULES.studentID = SIS_STUDENT.studentID
               INNER JOIN SIS_USER ON SIS_STUDENT.userID = SIS_USER.userID
               WHERE SIS_STUDENT_MODULES.Completed=1 AND SIS_MODULES.Level = '2'
               AND SIS_STUDENT.userID = @userid
               ORDER BY SIS_MODULES.moduleCode ">
              <SelectParameters>
                    <asp:SessionParameter Name="userid" SessionField="userid" Type="string" />
             </SelectParameters>
           </asp:SqlDataSource>
                                  
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <br />

                                     <h2 style="margin-left:12px">Modules for previous academic years:</h2>
                                        <br />
                                    
                            <asp:ListView ID="ListView2" runat="server" DataSourceID="viewOldModules1">
                                            
                              <ItemTemplate>
                                   <div class="col-md-4 col-sm-12 col-xs-12">
                                     <div class="panel panel-default">
                                          <div class="panel-heading">

                           
                                    <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Black" NavigateUrl='<%# "viewResources.aspx?moduleID="+Eval("moduleID") %>'>

                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("moduleCode") %>' />: <asp:Label ID="modulename" runat="server" ForeColor="Black"  Text='<%# Eval("moduleName") %>' /></div> </asp:HyperLink>
                                
                                    <div class="panel-body">
                                <asp:Label ID="Label2" runat="server" Text="Description:  "></asp:Label>
                                <asp:Label ID="desc" runat="server" ForeColor="Black" Text='<%# Eval("moduleDescription") %>' />
                                </br>
                                        </div>
                                    </div>
                                              </div>
                                 
                                  
                                        
                                       
                                       
                   
                                                              
                            </ItemTemplate>
                                                    
                            </asp:ListView>
                                     
                            <asp:ListView ID="ListView3" runat="server" DataSourceID="viewOldModules2">
                                            
                              <ItemTemplate>
                                  <div class="col-md-4 col-sm-12 col-xs-12">
                                     <div class="panel panel-default">
                                          <div class="panel-heading">

                              

                              <asp:Label ID="Label1" runat="server" ForeColor="Black" Text='<%# Eval("moduleCode") %>' />: <asp:Label ID="modulename" runat="server" ForeColor="Black"  Text='<%# Eval("moduleName") %>' /></div>

                                     <div class="panel-body">
                                <asp:Label ID="Label2" runat="server" Text="Description:  "></asp:Label>
                                <asp:Label ID="desc" runat="server" ForeColor="Black" Text='<%# Eval("moduleDescription") %>' />
                                </br>
                      
                                     
                                        </div>
                                    </div>
                                              </div>
                                                           
                            </ItemTemplate>
                                                      
                            </asp:ListView>
                                     </div>

                                 <asp:SqlDataSource ID="StudentDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_STUDENT WHERE userID=@ID ">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ID" SessionField="userid" Type="string" />
                                    </SelectParameters>

                                </asp:SqlDataSource>
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


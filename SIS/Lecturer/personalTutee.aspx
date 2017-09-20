<%@ Page Language="C#" AutoEventWireup="true" CodeFile="personalTutee.aspx.cs" Inherits="Lecturer_personalTutee" %>


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
                                    <h2>Tutee List</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
              
           <!-- sql data source to join two tables, and pull data from mylittleadmin--><!-- Session used as filtering parameter-->
                                    <asp:SqlDataSource ID="displaytutee" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:dbconnect %>"
                                        SelectCommand="SELECT SIS_STUDENT.firstName, SIS_STUDENT.lastName, SIS_LECTURER.sNumber, SIS_STUDENT.studentNo, SIS_STUDENT.tutorID, SIS_LECTURER.userID, SIS_STUDENT.studentID, SIS_STUDENT.address, SIS_STUDENT.contactNumber FROM SIS_STUDENT INNER JOIN SIS_LECTURER ON SIS_STUDENT.tutorID = SIS_LECTURER.lecturerID WHERE (SIS_LECTURER.userID = @myid)">



               <SelectParameters>
             <asp:SessionParameter Name="myid" SessionField="userID" Type="Int32" />
         </SelectParameters>

     </asp:SqlDataSource>
                                    <div id="HTMLtoPDF">

                                    <!-- Barry - GridView (Hidden) for PDF Download-->

                                    <asp:GridView ID="GVtutees" runat="server" DataSourceID="displaytutee" CellPadding="4" Visible="false" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="studentID">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                        <Columns>
                                            <asp:BoundField DataField="firstName" HeaderText="Name" SortExpression="firstName"></asp:BoundField>
                                            <asp:BoundField DataField="lastName" HeaderText="" SortExpression="lastName"></asp:BoundField>
                                            <asp:BoundField DataField="studentNo" HeaderText="Student Number" SortExpression="studentNo"></asp:BoundField>
                                            <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address"></asp:BoundField>
                                            <asp:BoundField DataField="contactNumber" HeaderText="Contact Number" SortExpression="contactNumber"></asp:BoundField>
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

                                    <!-- Barry - GridView (Hidden) for PDF Download-->

                                    

     <!-- List view to display the content from db--><!-- Hyper link to pass module ID to next page-->
                                    
            <asp:ListView ID="tutees" runat="server" DataSourceID="displaytutee">
      
                <ItemTemplate>
             <div class="col-lg-3 col-md-4  col-sm-12 col-xs-12">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                        
                            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Black" NavigateUrl='<%# "academicRecord.aspx?studentID="+ Eval("StudentID")%>'>
                                
                         <h4><b><asp:Label ID="firstName" runat="server" ForeColor="Black"  Text='<%# Eval("firstName") %>' />
                                <asp:Label ID="Label2" runat="server" Text="  "> </asp:Label>
                              
                                <asp:Label ID="desc" runat="server" ForeColor="Black" Text='<%# Eval("lastName") + "-" %>' /></b>
                           
                              <asp:Label ID="Label1" runat="server" Text="      "></asp:Label>
                                <asp:Label ID="units" runat="server" ForeColor="Black"  Text='<%# Eval("sNumber") %>' />
                                 </asp:HyperLink> 
                              </div>
                                                  
                 


                                

                             <div class="panel-body">
                               <asp:Label ID="Label3" runat="server" ForeColor="Black"  Text='<%# Eval("contactNumber") %>' />
                                 </br></br>
                             <asp:Label ID="Label4" runat="server" ForeColor="Black"  Text='<%# Eval("address") %>' />
                              </h4>
                             
                            
                             </div>
                        </div>
                <br />
                     </div>
                    
                     </ItemTemplate>
                </asp:ListView> 
                          </div> 
                                    

                   </div>
                                <asp:HyperLink ID="HyperLink2" runat="server" class="btn btn-default"  style="background-color: #73879C; margin-left:1%" NavigateUrl="emailTutee.aspx" ForeColor="White">Email Tutees</asp:HyperLink>
                                
                                
                                <a href="#" class="btn btn-primary"  onclick="HTMLtoPDF()">Generate Report</a>
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
        <script src="../js/pdfFromHTML.js"></script>
         <script src="../js/jspdf.js"></script>
    </form>
</body>

</html>



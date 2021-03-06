﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentSearchCalendar.aspx.cs" Inherits="Student_studentSearchCalendar" %>

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

                          <asp:SqlDataSource ID="profileDetailsNav" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT imagepath, firstName, lastName FROM SIS_STUDENT WHERE SIS_STUDENT.userID = @userID">
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
                                    <li class="licurrent"><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                                    <li><a href="Timetable.aspx"><i class="fa fa-table"></i>Timetable</a></li>
                                    <li><a href="Modules.aspx"><i class="fa fa-list"></i>Modules</a></li>
                                    <li><a href="Transcript.aspx"><i class="fa fa-file-text-o"></i>Transcript</a></li>
                                    <li><a href="AcademicRecord.aspx"><i class="fa fa-list-alt"></i>Academic Record</a></li>
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


              <asp:Label ID="DateLabel" runat="server" Text="Label"></asp:Label>
              <asp:Label ID="DateLabel2" runat="server" Text="Label"></asp:Label>
              <asp:Label ID="DateLabel3" runat="server" Text="Label"></asp:Label>
              <asp:Label ID="DateLabel4" runat="server" Text="Label"></asp:Label>
              <asp:Label ID="DateLabel5" runat="server" Text="Label"></asp:Label>
             
        
              
              <br />
              
              <div class="col-md-2">
                
                  <br />
                 <asp:SqlDataSource ID="timetablesource" runat="server" 
         ConnectionString="<%$ ConnectionStrings:dbconnect %>" 
         SelectCommand="SELECT * FROM SIS_TIMETABLE  WHERE cast ([startDate] as date) = @Date AND userID = @userid ORDER BY startDate ASC">
                    
              
            <SelectParameters>
             <asp:ControlParameter Name="Date" ControlID="DateLabel" Type="DateTime" />
                <asp:SessionParameter Name="userid" SessionField="userID" Type="String" />
         </SelectParameters>

     </asp:SqlDataSource>
                  <asp:Label ID="Label3" runat="server" Text="Monday:"></asp:Label>
            <!-- List view to display the content from db--><!-- Hyper link to pass module ID to next page-->
            <asp:ListView ID="tt" runat="server"  DataSourceID="timetablesource">
                
                <ItemTemplate>
            
               <div class="list-group" style=" border:1px solid black; padding: 5px; margin: -1px">
                         <h6>   <asp:Label ID="Label2" runat="server" ForeColor="Black" class="list-group-item" Text='<%# Eval("desc") %>' /></h6>    
                         <asp:Label ID="modulename" runat="server" ForeColor="Black"  Text='<%#string.Format("{0:dddd, MMMM d, yyyy}", Eval("startDate")) %>' />
                    <br />
                             <asp:Label ID="Label1" runat="server" ForeColor="Black" Text='<%#string.Format("{0: h:mm tt}", Eval("startDate")) %>' /><asp:Label ID="Label5" runat="server" Text=" - "></asp:Label>
                         <asp:Label ID="Label4" runat="server" ForeColor="Black"  Text='<%#string.Format("{0: h:mm tt}", Eval("endDate")) %>' />
                        </div>
                        
                      
                     </ItemTemplate>
                </asp:ListView>
                  </div>
                 
                  
             <div class="col-md-2">
                  

                 <asp:SqlDataSource ID="tt2" runat="server" 
         ConnectionString="<%$ ConnectionStrings:dbconnect %>" 
         SelectCommand="SELECT * FROM SIS_TIMETABLE  WHERE cast ([startDate] as date) = @Date AND userID = @userid ORDER BY startDate ASC">
                    
              
            <SelectParameters>
             <asp:ControlParameter Name="Date" ControlID="DateLabel2" Type="DateTime" />
                <asp:SessionParameter Name="userid" SessionField="userID" Type="String" />
         </SelectParameters>

     </asp:SqlDataSource>
                 <asp:Label ID="Label4" runat="server" Text="Tuesday:"></asp:Label>
            <!-- List view to display the content from db--><!-- Hyper link to pass module ID to next page-->
            <asp:ListView ID="ListView1" runat="server" DataSourceID="tt2">
      
                <ItemTemplate>
            
                <div class="list-group" style=" border:1px solid black; padding: 5px; margin: -1px">  
                            
                         <h6>   <asp:Label ID="Label2" runat="server" ForeColor="Black" class="list-group-item" Text='<%# Eval("desc") %>' /></h6>    
                         <asp:Label ID="modulename" runat="server" ForeColor="Black"  Text='<%#string.Format("{0:dddd, MMMM d, yyyy}", Eval("startDate")) %>' />
                    <br />
                             <asp:Label ID="Label1" runat="server" ForeColor="Black" Text='<%#string.Format("{0: h:mm tt}", Eval("startDate")) %>' /><asp:Label ID="Label5" runat="server" Text=" - "></asp:Label>
                         <asp:Label ID="Label4" runat="server" ForeColor="Black"  Text='<%#string.Format("{0: h:mm tt}", Eval("endDate")) %>' />
                        </div>
                        
                      
                     </ItemTemplate>
                </asp:ListView>
                  </div>

                    <div class="col-md-2">
                  

                 <asp:SqlDataSource ID="tt3" runat="server" 
         ConnectionString="<%$ ConnectionStrings:dbconnect %>" 
         SelectCommand="SELECT * FROM SIS_TIMETABLE  WHERE userID = @userid AND cast ([startDate] as date) = @Date  ORDER BY startDate ASC">
                    
              
            <SelectParameters>
             <asp:ControlParameter Name="Date" ControlID="DateLabel3" Type="DateTime" />
                <asp:SessionParameter Name="userid" SessionField="userID" Type="String" />
         </SelectParameters>

     </asp:SqlDataSource>
                        <asp:Label ID="Label6" runat="server" Text="Wednesday:"></asp:Label>
            <!-- List view to display the content from db--><!-- Hyper link to pass module ID to next page-->
            <asp:ListView ID="ListView2" runat="server" DataSourceID="tt3">
      
                <ItemTemplate>
            
                <div class="list-group" style=" border:1px solid black; padding: 5px; margin: -1px"> 
                            
                         <h6>   <asp:Label ID="Label2" runat="server" ForeColor="Black" class="list-group-item" Text='<%# Eval("desc") %>' /></h6>    
                         <asp:Label ID="modulename" runat="server" ForeColor="Black"  Text='<%#string.Format("{0:dddd, MMMM d, yyyy}", Eval("startDate")) %>' />
                    <br />
                             <asp:Label ID="Label1" runat="server" ForeColor="Black" Text='<%#string.Format("{0: h:mm tt}", Eval("startDate")) %>' /><asp:Label ID="Label5" runat="server" Text=" - "></asp:Label>
                         <asp:Label ID="Label4" runat="server" ForeColor="Black"  Text='<%#string.Format("{0: h:mm tt}", Eval("endDate")) %>' />
                        </div>
                        
                      
                     </ItemTemplate>
                </asp:ListView>
                  </div>

                   <div class="col-md-2">
                  

                 <asp:SqlDataSource ID="tt4" runat="server" 
         ConnectionString="<%$ ConnectionStrings:dbconnect %>" 
        SelectCommand="SELECT * FROM SIS_TIMETABLE  WHERE cast ([startDate] as date) = @Date AND userID = @userid ORDER BY startDate ASC">
                    
              
            <SelectParameters>
             <asp:ControlParameter Name="Date" ControlID="DateLabel4" Type="DateTime" />
                <asp:SessionParameter Name="userid" SessionField="userID" Type="String" />
         </SelectParameters>

     </asp:SqlDataSource>
                       <asp:Label ID="Label7" runat="server" Text="Thursday:"></asp:Label>
            <!-- List view to display the content from db--><!-- Hyper link to pass module ID to next page-->
            <asp:ListView ID="ListView3" runat="server" DataSourceID="tt4">
      
                <ItemTemplate>
            
                <div class="list-group" style=" border:1px solid black; padding: 5px; margin: -1px">   
                            
                         <h6>   <asp:Label ID="Label2" runat="server" ForeColor="Black" class="list-group-item" Text='<%# Eval("desc") %>' /></h6>    
                         <asp:Label ID="modulename" runat="server" ForeColor="Black"  Text='<%#string.Format("{0:dddd, MMMM d, yyyy}", Eval("startDate")) %>' />
                    <br />
                             <asp:Label ID="Label1" runat="server" ForeColor="Black" Text='<%#string.Format("{0: h:mm tt}", Eval("startDate")) %>' /><asp:Label ID="Label5" runat="server" Text=" - "></asp:Label>
                         <asp:Label ID="Label4" runat="server" ForeColor="Black"  Text='<%#string.Format("{0: h:mm tt}", Eval("endDate")) %>' />
                        </div>
                        
                      
                     </ItemTemplate>
                </asp:ListView>
                  </div>

                      
  

          <div class="col-md-2">
                  

                 <asp:SqlDataSource ID="tt5" runat="server" 
         ConnectionString="<%$ ConnectionStrings:dbconnect %>" 
         SelectCommand="SELECT * FROM SIS_TIMETABLE  WHERE cast ([startDate] as date) = @Date AND userID = @userid ORDER BY startDate ASC">
                    
              
            <SelectParameters>
             <asp:ControlParameter Name="Date" ControlID="DateLabel5" Type="DateTime" />
                <asp:SessionParameter Name="userid" SessionField="userID" Type="String" />
         </SelectParameters>

     </asp:SqlDataSource>
              <asp:Label ID="Label8" runat="server" Text="Friday:"></asp:Label>
            <!-- List view to display the content from db--><!-- Hyper link to pass module ID to next page-->
            <asp:ListView ID="ListView4" runat="server" DataSourceID="tt5">
      
                <ItemTemplate>
            
                <div class="list-group" style=" border:1px solid black; padding: 5px; margin: -1px">  
                            
                         <h6>   <asp:Label ID="Label2" runat="server" ForeColor="Black" class="list-group-item" Text='<%# Eval("desc") %>' /></h6>    
                         <asp:Label ID="modulename" runat="server" ForeColor="Black"  Text='<%#string.Format("{0:dddd, MMMM d, yyyy}", Eval("startDate")) %>' />
                    <br />
                             <asp:Label ID="Label1" runat="server" ForeColor="Black" Text='<%#string.Format("{0: h:mm tt}", Eval("startDate")) %>' /><asp:Label ID="Label5" runat="server" Text=" - "></asp:Label>
                         <asp:Label ID="Label4" runat="server" ForeColor="Black"  Text='<%#string.Format("{0: h:mm tt}", Eval("endDate")) %>' />
                        </div>
                        
                      
                     </ItemTemplate>
                </asp:ListView>



               </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> </div>
       

        <!-- /page content -->


        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/custom.js"></script>
        <script src="../js/nicescroll/jquery.nicescroll.min.js"></script>
    </form>
</body>

</html>


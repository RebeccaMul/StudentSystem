<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Rooms.aspx.cs" Inherits="Student_Rooms" %>

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
                        <div id="sidebar-menu" class="main_menu_side shidden-print main_menu">
                            <div class="menu_section">
                                <h3>Student</h3>
                                <ul class="nav side-menu">
                                    <li class="licurrent"><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                                    <li><a href="Timetable.aspx"><i class="fa fa-table"></i>Timetable</a></li>
                                    <li><a href="Modules.aspx"><i class="fa fa-list"></i>Modules</a></li>
                                   <asp:ListView ID="ListView2" runat="server" DataSourceID="StudentDetails">
                                    <ItemTemplate>
                                    <li><asp:HyperLink ID="link" runat="server" NavigateUrl='<%# "Transcript.aspx?studentID=" + Eval("studentID")%>'><i class="fa fa-file-text-o"></i>Transcript</asp:HyperLink></li>
                                            
                                    </ItemTemplate>
                                    </asp:ListView>
                                     <asp:ListView ID="ListView3" runat="server" DataSourceID="StudentDetails">
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

              
                  <asp:SqlDataSource ID="StudentDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_STUDENT WHERE userID=@ID ">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ID" SessionField="userid" Type="string" />
                                    </SelectParameters>

                                </asp:SqlDataSource>

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
                <div class="right_col" role="main" style="height:956px;">

                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Rooms in building</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                          Building
                                       
                                        </div>
                                        <div class='panel-body'>
                                               <asp:SqlDataSource ID="buildingSource" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_BUILDING WHERE SIS_BUILDING.buildingID =@buildingID">
                                                   <SelectParameters>
                                             <asp:QueryStringParameter Name="buildingID" QueryStringField="buildingID" /></SelectParameters>
                                               </asp:SqlDataSource>
                                            <asp:ListView ID="displayBuilding" runat="server" DataSourceID="buildingSource">
                                                <EmptyDataTemplate>
                                                    No Rooms to show
                                                </EmptyDataTemplate>

                                                <ItemTemplate>
                                                                  <div class="col-md-8 col-sm-12 col-xs-12"> <h1>     <asp:Label ID="buildingName" runat="server" Text='<%# Eval("buildingName") %>'></asp:Label></h1> 
<asp:Image ID="image" runat="server" alt="buildingImage" CssClass="img-notification-thumbnail" Style="height: 200px; width:400px;" ImageUrl='<%# "../../files/" + Eval("imagepath")  %>' />
                                      </div>
                                                                   <div class="col-md-4 col-sm-12 col-xs-12">   <h3>Location</h3> <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2312.1847961122817!2d-5.9379459841145446!3d54.58311783025676!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x486108ee869f9ea9%3A0xa9f41c9563d671de!2sComputer+Science+Building!5e0!3m2!1sen!2suk!4v1494180050733" width="100%" height="200" frameborder="0" style="border:0;" allowfullscreen></iframe>  
                                                                 </div> 
                                                                  <div class="col-md-12 col-sm-12 col-xs-12">   <br /><asp:Label ID="buildingAddress" runat="server" Text='<%# Eval("buildingAddress") %>'></asp:Label>
                                                         <br />  <asp:Label ID="Label1" runat="server" Text='<%# Eval("buildingContact") %>'></asp:Label>
</div> 
                                </ItemTemplate></asp:ListView>
                                              <asp:SqlDataSource ID="roomSource" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_ROOMS INNER JOIN SIS_BUILDING ON SIS_BUILDING.buildingID = SIS_ROOMS.buildingID WHERE SIS_BUILDING.buildingID = @buildingID">
                                                
                                                <SelectParameters>
                                             <asp:QueryStringParameter Name="buildingID" QueryStringField="buildingID" />
                                             
                                            </SelectParameters>



                                            </asp:SqlDataSource>
                                             <br />
                                            <br /> <div class="col-md-12 col-sm-12 col-xs-12">
                                          <hr />
                                            <h2>Rooms</h2> </div>
                                            <asp:ListView ID="displayRooms" runat="server" DataSourceID="roomSource">
                                                <EmptyDataTemplate>
                                                    No Rooms to show
                                                </EmptyDataTemplate>

                                                <ItemTemplate>
                                 
                                                    <br />
                                                        <div class="col-md-12 col-sm-12 col-xs-12">   <asp:HyperLink ID="viewRooms" runat="server" Font-Underline="true" NavigateUrl='<%# "viewRoom.aspx?roomID="+Eval("roomID") %>'>  
   <asp:Label ID="roomName" runat="server" Text='<%# Eval("roomName") %>'></asp:Label>
      
                                                            
                                                    <br />
                                                    <br />
                                              </asp:HyperLink> </div>

                                           

                                                </ItemTemplate>
                                            </asp:ListView>
                                        </div>
                                    </div>
                                </div></div>
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



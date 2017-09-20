<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

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
                    <div class="left_col scroll-view" style="cursor: text;">

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
                                <h3>Admin</h3>
                                <ul class="nav side-menu">
                                    <li><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                                    <li><a><i class="fa fa-group"></i>Students <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="Student.aspx">View Students</a></li>
                                            <li><a href="Student_Create.aspx">Create Student</a></li>
                                          <li><a href="Student_Timetable.aspx">View Timetable</a></li>

                                        </ul>
                                    </li>
                                     <li> <a href="Lecturers.aspx"><i class="fa fa-group"></i>Lecturers</a></li>
                                    <li><a href="usertimetable.aspx"><i class="fa fa-table"></i>Timetables</a></li>
                                    <li><a href="viewStudents.aspx"><i class="fa fa-user"></i>Assign Personal Tutor</a></li>
                                    <li><a><i class="fa fa-folder"></i>Modules <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="adminviewModule.aspx">Modules</a></li>
                                            <li><a href="createmodule.aspx">Create Modules</a></li>
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-arrow-right"></i>Pathway <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="viewprogrammes.aspx">Pathway</a></li>
                                            <li><a href="createpathway.aspx">Create Pathway</a></li>
                                            <li><a href="changeDates.aspx">Change Academic Dates</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="financepaid.aspx"><i class="fa fa-gbp"></i>Student Finance</a></li>
                                    <li><a href="fileupload.aspx"><i class="fa fa-inbox"></i>Upload Resources</a></li>
                                     <li><a href="configuration.aspx"><i class="fa fa-cog"></i>Configuration</a></li>
                                    <li><a href="manageAds.aspx"><i class="fa fa-font"></i>Advertising</a></li>
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
                                        <li><a href="Configuration.aspx"><i class="fa fa-cog pull-right"></i>Configuration</a>
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
                                    <h2>Personal Details</h2>

                                    <div class="clearfix"></div>
                                </div>
                           
                                     <asp:SqlDataSource ID="configSource" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                    SelectCommand="SELECT * FROM SIS_CONFIG">
                                                </asp:SqlDataSource>

                                   <div class="alert alert-success alert-dismissable">  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <asp:ListView ID="titleDisplay" runat="server" DataSourceID="configSource">
                                    <ItemTemplate>
                           <asp:Label ID="welcomeAlert" runat="server" Font-Size="15px" Text='<%# Eval("welcomeAlert") %>'></asp:Label>
                                 
                                        </ItemTemplate> </asp:ListView>
                                
                                </div>
                            

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
                                        <div class="col-md-6 col-sm-12 col-xs-12">
                                            <div class="panel panel-default">
                                              <div class="panel-heading">
                                                    Personal Details
                                       
                                                </div>

                                                <div class="panel-body">
                                                    <div class="text-center">
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
                                        </div>

                                    </ItemTemplate>

                                </asp:ListView>


                                <asp:SqlDataSource ID="notificationSource" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_NOTIFICATION INNER JOIN SIS_USER ON SIS_USER.typeID = SIS_NOTIFICATION.typeID WHERE userID = @userID ORDER BY notificationID DESC">

                                    <SelectParameters>
                                        <asp:SessionParameter Name="userID" SessionField="userID" Type="String" />
                                    </SelectParameters>

                                </asp:SqlDataSource>



                                <div class="col-md-6 col-sm-12 col-xs-12">

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            Notifications
                                        </div>


                                        <div class="panel-body scroll-notification">
                                                      <asp:ListView ID="displayNotifications" runat="server" DataSourceID="notificationSource">
                                                <EmptyDataTemplate>
                                                    No Notifications
                                                </EmptyDataTemplate>

                                                <ItemTemplate>
                                                    <asp:Image ID="image" runat="server" alt="notificationImage" CssClass="img-notification-thumbnail" ImageUrl='<%# "../../files/" + Eval("imagepath")  %>' />

                                                    <b>
                                                        <asp:Label ID="notificationName" runat="server" Text='<%# Eval("notificationName") %>'></asp:Label>
                                                        <br />

                                                        <asp:Label ID="notificationDate" runat="server" Text='<%# Eval ("notificationDate")  %>'></asp:Label>
                                                       
                                                    </b>
                                                    <br />
                                                    <p></p>

                                                    <asp:Label ID="notificationMessage" runat="server" Text='<%# Eval("notificationMessage")  %>'></asp:Label>
                                                    <hr />
                                                </ItemTemplate>
                                            
                                            </asp:ListView>

                                            <br />
                                         
                                            <asp:LinkButton ID="postBtn" runat="server" CssClass="btn btn-primary" Text="Post Notification" Style="float: right;" href="#notificationPop" data-toggle="modal"></asp:LinkButton>
                                               <asp:Button ID="editPostBtn" runat="server" CssClass="btn btn-default" Text="Edit Posts" style="float:right;" OnClick="editPostBtn_Click" CausesValidation="false"/>
                                                   
                                            <asp:SqlDataSource ID="userTypeSource" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_ACCOUNT_TYPE"></asp:SqlDataSource>


                                            <div class="modal fade" id="notificationPop" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Push Notification</h4>
                                                        </div>

                                                        <div class="modal-body">
                                                            <p>Select the users you wish to push notifications to:</p>
                                                            <asp:DropDownList ID="userTypeList" runat="server" CssClass="form-control" DataSourceID="userTypeSource" DataTextField="accountName" DataValueField="typeID"></asp:DropDownList>
                                                            <br />
                                                            Image:
                                           <asp:Label ID="myinfo" runat="server" Text="" Enabled="false"></asp:Label>
                                                            <asp:FileUpload ID="myimage" runat="server" CssClass="form-control btn-block" Style="width: 100%;" /><asp:RequiredFieldValidator ID="requiredImage" runat="server" ControlToValidate="myimage" ErrorMessage="Please choose an image file"></asp:RequiredFieldValidator>
                                                            <br />
                                                            <asp:TextBox ID="notificationName" runat="server" placeholder="Notification Title" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="requiredName" runat="server" ControlToValidate="notificationName" ErrorMessage="Please enter a name for the notification"></asp:RequiredFieldValidator>
                                                       
                                                            <br />
                                                            <br />

                                                            <asp:Label ID="messageLabel" runat="server" Text="Message:"></asp:Label>

                                                            <asp:TextBox ID="messageBox" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="requiredMessage" runat="server" ControlToValidate="messageBox" ErrorMessage="Please enter a message for the notification"></asp:RequiredFieldValidator>
                                                       
                                                        </div>

                                                        <div class="clearfix">
                                                            <asp:Label ID="displayLabel" runat="server"> </asp:Label>
                                                        </div>
                                                        <div class="modal-footer">

                                                            <asp:Button ID="cancelBtn" runat="server" CssClass="btn btn-default" Style="margin-bottom: 0px;" Text="Close" data-dismiss="modal" CausesValidation="true" />
                                                            <asp:Button ID="confirmBtn" runat="server" CssClass="btn btn-primary" Text="Confirm" OnClick="confirmBtn_Click" CausesValidation="false" />
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            </div>   </div> </div>
                                            

                                            <!-- - Barry - Task SQL -->
                                     <asp:SqlDataSource ID="taskSQL" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_TASK INNER JOIN 
                                         SIS_ACCOUNT_TYPE ON SIS_ACCOUNT_TYPE.typeID = SIS_TASK.typeID INNER JOIN SIS_USER ON SIS_USER.typeID = SIS_TASK.typeID 
                                         WHERE userID = @userID ORDER BY taskID DESC ">

                                    <SelectParameters>
                                        <asp:SessionParameter Name="userID" SessionField="userID" Type="String" />
                                    </SelectParameters>

                                </asp:SqlDataSource>

                                            <!-- barry Tasks View -->
                                       
                                        <div class="col-md-6 col-sm-12 col-xs-12">

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            Tasks
                                        </div>
                                        <div class="panel-body scroll-notification">
                                            <asp:ListView ID="ListView3" runat="server" DataSourceID="taskSQL">
                                                <EmptyDataTemplate>
                                                    No Notifications
                                                </EmptyDataTemplate>

                                                <ItemTemplate>
                                                 
                                                    <b>
                                                        <asp:Label ID="taskName" runat="server" Text='<%# Eval("taskName") %>'></asp:Label>
                                                        <br />

                                                        <asp:Label ID="taskDate" runat="server" Text='<%# Eval("taskDate")  %>'></asp:Label>
                                                    </b>
                                                    <br />
                                                    <p></p>

                                                    <asp:Label ID="taskMessage" runat="server" Text='<%# Eval("taskMessage")  %>'></asp:Label>
                                                    <hr />
                                                    
                                                  
                                                </ItemTemplate>
                                            
                                            </asp:ListView>

                                        
                                    </div>
                                </div>
                                            </div>

                                <!-- Sarah - External Links Task -->



                             
                                    <asp:SqlDataSource ID="LinkDataSource" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_EXTERNAL_LINKS">

                                   <SelectParameters>
                                        <asp:SessionParameter Name="ID" SessionField="userID" Type="String" />
                                    </SelectParameters>

                                </asp:SqlDataSource>



                                <div class="col-md-6 col-sm-12 col-xs-12">

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                           External Links
                                        </div>


                                        <div class="panel-body scroll-notification">
                                                      <asp:ListView ID="ListView2" runat="server" DataSourceID="LinkDataSource">
                                                <EmptyDataTemplate>
                                                    No External Links
                                                </EmptyDataTemplate>

                                                <ItemTemplate>
                                                   
                                                 
                                                   

                                                    <asp:Label ID="linkMessage" runat="server" Text='<%# Eval("linkMessage")  %>'></asp:Label>
                                                    <hr />
                                                </ItemTemplate>
                                            
                                            </asp:ListView>


                          



                                            <br />
                                         
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary" Text="Post External Link" Style="float: right;" href="#notificationPop1" data-toggle="modal"></asp:LinkButton>

                                               <asp:Button ID="Button1" runat="server" CssClass="btn btn-default" Text="Edit External Link" style="float:right;" OnClick="editLinkPostBtn_Click" CausesValidation="false"/>
                                                   
                               <asp:SqlDataSource ID="linkSource" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_EXTERNAL_LINK_DETAILS"></asp:SqlDataSource>

                              <!-- SM - Modal Dialog class to create the external links pop up feature -->


                              <div class="modal fade" id="notificationPop1" role="dialog">
                              <div class="modal-dialog">

                               <!-- Modal content-->
                               <div class="modal-content">
                               <div class="modal-header">
                               <button type="button" class="close" data-dismiss="modal">&times;</button>
                               <h4 class="modal-title">External Links</h4>
                               </div>

                               <div class="modal-body">
                               <p>Select the users you wish to push external links to:</p>
                               <asp:DropDownList ID="linkTypeList" runat="server" CssClass="form-control" DataSourceID="linkSource" DataTextField="linkUser" DataValueField="linkDetailsID"></asp:DropDownList>
                                                           


                              <asp:Label ID="linkNameLabel" runat="server" Text="Link Name:"></asp:Label>

                              <asp:TextBox ID="linkName" CssClass="form-control"  runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="linkName" ErrorMessage="Please enter a link name for the external link"></asp:RequiredFieldValidator>




                                                      
                                                            <br />
                                                       

                                        <asp:Label ID="Label4" runat="server" Text="Link Detail:"></asp:Label>

                                                            <asp:TextBox ID="linkMessageBox" CssClass="form-control"  runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="linkMessageBox" ErrorMessage="Please enter a link for the external link"></asp:RequiredFieldValidator>
                                                       
                                                        </div>

                                                        <div class="clearfix">
                                                            <asp:Label ID="Label8" runat="server"> </asp:Label>
                                                        </div>
                                                        <div class="modal-footer">

                                                            <asp:Button ID="Button2" runat="server" CssClass="btn btn-default" Style="margin-bottom: 0px;" Text="Close" data-dismiss="modal" CausesValidation="true" />
                                                              <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary" Text="Confirm" OnClick="linktest_Click" CausesValidation="false" />
                                                        



                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            </div>   </div> </div>



                                       

                               

                               
                         
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- /page content -->


        <script src="../js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $(".navbar-nav li.trigger-collapse a").click(function (event) {
                    $(".navbar-collapse").collapse('hide');
                });
            });</script>
        <script src="../js/custom.js"></script>
        <script src="../js/nicescroll/jquery.nicescroll.min.js"></script>

    </form>
</body>

</html>

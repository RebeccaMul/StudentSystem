<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegWizardModules.aspx.cs" Inherits="Student_RegWizardModules" %>

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
                                    <h2>Registration Wizard - Step 3</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                    <%-- Rebecca: Registration Wizard Edit Details: --%>

                      <asp:SqlDataSource ID="CompModules" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' 
                          SelectCommand="SELECT SIS_MODULES.moduleCode, SIS_MODULES.moduleName, SIS_MODULES.moduleDescription, SIS_MODULES.units, SIS_MODULES.Semester
                          FROM SIS_MODULES 
                          WHERE SIS_MODULES.compulsary = 'True' AND SIS_MODULES.level = @Level">
                          <SelectParameters>
                  <asp:QueryStringParameter QueryStringField="Level" Name="Level" Type="String"></asp:QueryStringParameter>
               </SelectParameters>
                          </asp:SqlDataSource>
             
                         <asp:SqlDataSource ID="OptionalModules" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_MODULES
                              WHERE SIS_MODULES.compulsary = 'False' AND SIS_MODULES.level = @Level
                             ORDER BY moduleCode">

                     <SelectParameters>
                  <asp:QueryStringParameter QueryStringField="Level" Name="Level" Type="Int32"></asp:QueryStringParameter>
               </SelectParameters>
               </asp:SqlDataSource>

               <asp:SqlDataSource ID="chosenModules" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT SIS_STUDENT_MODULES.moduleSelected, SIS_STUDENT_MODULES.studentID, SIS_MODULES.moduleCode, SIS_MODULES.moduleDescription, SIS_MODULES.moduleName, SIS_MODULES.units, SIS_MODULES.Semester, SIS_MODULES.moduleID
                   FROM SIS_STUDENT_MODULES
                   INNER JOIN SIS_MODULES
                   ON SIS_STUDENT_MODULES.moduleSelected = SIS_MODULES.moduleID
                           WHERE SIS_STUDENT_MODULES.studentID = @ID AND SIS_STUDENT_MODULES.Completed=0">
                         
                     <SelectParameters>
                  <asp:QueryStringParameter QueryStringField="studentID" Name="ID" Type="Int32"></asp:QueryStringParameter>
               </SelectParameters>
               </asp:SqlDataSource>

              Please see below your module details:<br />
              <br /><div class="panel-body" style="outline:auto; outline-color:gainsboro; margin-left:10%; margin-right:10%;"> 
              <u>Academic Details:</u> 

                   <asp:SqlDataSource ID="manualbtn" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' 
                          SelectCommand="SELECT * FROM SIS_USER WHERE SIS_USER.userID = @UID">
                          <SelectParameters>
                  <asp:QueryStringParameter QueryStringField="userid" Name="UID" Type="String"></asp:QueryStringParameter>
               </SelectParameters>
                          </asp:SqlDataSource>

                      <asp:ListView ID="manual" runat="server" DataSourceID="manualbtn">
                          <ItemTemplate>
                          <div id="manualBtn" style="float:right;">
                          <asp:HyperLink ID="ManualEnrol" runat="server" CssClass="btn btn-primary" NavigateUrl=' <%# "ManualEnrol.aspx?UserID=" + Request.QueryString["userid"] + "&Level=" + Request.QueryString["Level"] + "&StudentID=" + Request.QueryString["StudentID"] %>'>Manual Enrolment</asp:HyperLink>
                              </div>
                            </ItemTemplate>
                          </asp:ListView>

                  <br /><b>You require 120 units to enrol for this academic year, you currently have 
                      <asp:Label ID="TotalValue" runat="server" Text="Label" Visible="true"></asp:Label>
                  <asp:Label ID="TotalValue2" runat="server" Text="Label" Visible="false"></asp:Label></b>

                  <br /><asp:Label ID="NoSelect" runat="server" Visible="false" Text="Please note: As you have 120 units you will not need to select any further modules." style="color:red;"></asp:Label>

                  <br /><br />
           
                  <b><asp:Label ID="CompulsoryTitle" runat="server" Text="Compulsory:" Font-Size="Medium" ForeColor="#1ABB9C"></asp:Label></b><br />
                  These are modules which you have been pre-enrolled in for this academic year.
                  
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="manualbtn">
                          <ItemTemplate>
                  <div id="manualBtn" style="float:right;">
                  <asp:HyperLink ID="Timetable" runat="server" CssClass="btn btn-default" NavigateUrl='<%# "RegTimetable.aspx?userID=" + Request.QueryString["userID"] + "&Level=" + Request.QueryString["Level"] + "&studentID=" + Request.QueryString["StudentID"] %>'>View Timetable</asp:HyperLink>
                        </div>
                       </ItemTemplate>
                          </asp:ListView>
                  <br /><br />
                
                      <asp:ListView ID="showmodule" runat="server" DataSourceID="CompModules">
                              <ItemTemplate>
                                  <div class="panel panel-default" style="float:left; width:33.333%; padding-right:5px;">
                                   <div class="panel-heading" style="background-color:Gainsboro; height:60px;">
                                    <b><asp:Label Text='<%# Eval("moduleCode") %>' runat="server" ID="Label1" />:</b>
                                    <asp:Label Text='<%# Eval("moduleName") %>' runat="server" ID="userIDLabel" /><br />
                                       </div>
                                   
                                    <div class="panel-body" style="height:150px;">
                                        <b>Module Description:</b>
                                    <asp:Label Text='<%# Eval("moduleDescription") %>' runat="server" ID="roleIDLabel" /><br />
                                        </div><br />
                                   <div class="panel-footer" style="background-color:Gainsboro; color:black;">
                                        <b>Units: </b><asp:Label Text=' <%# Eval("units") %>' runat="server" ID="Label3" />
                                       <asp:Label Text='  <%# Eval("Semester") %>' runat="server" style="float:right;" ID="Label11" /><b>
                                           <asp:Label ID="Label12" runat="server" style="float:right;" Text="Semester: "></asp:Label></b><br />
                                       <asp:Literal ID="unitscount" runat="server" OnDataBinding="compcount_DataBinding" Visible="false"></asp:Literal>

                                   
                            </div> </div>
                                  <asp:Label ID="Label2" runat="server" Text="     "></asp:Label>
                            </ItemTemplate>
                            </asp:ListView>

                  <asp:Label ID="compT" runat="server" Text="" Visible="false"></asp:Label>
                 
                  <asp:Panel ID="Selection" runat="server">     
                 <b><asp:Label ID="OptTitle" runat="server" Text="Optional:" Font-Size="Medium" ForeColor="#1ABB9C"></asp:Label></b><br />
                     
                  These are the available modules you may select for this academic year:<br /><br />

                      
                
                     <asp:ListView ID="showoptmodule" runat="server" DataSourceID="OptionalModules">
                              <ItemTemplate>
                                  <div class="panel panel-default" style="float:left; width:33.333%; padding-right:5px;">
                                   <div class="panel-heading" style="background-color:silver; height:60px;">
                                    <b><asp:Label Text='<%# Eval("moduleCode") %>' runat="server" ID="Label1" />:</b>
                                    <asp:Label Text='<%# Eval("moduleName") %>' runat="server" ID="userIDLabel" /><br />
                                       </div>
                                   
                                    <div class="panel-body" style="height:150px;">
                                    <b>Module Description:</b>
                                    <asp:Label Text='<%# Eval("moduleDescription") %>' runat="server" ID="roleIDLabel" /><br />
                                        </div><br />
                                   <div class="panel-footer" style="background-color:silver; color:black;">
                                       <b>Units: </b><asp:Label Text=' <%# Eval("units") %>' runat="server" ID="Label3" />
                                         <asp:Label Text='  <%# Eval("Semester") %>' runat="server" style="float:right;" ID="Label11" /><b>
                                           <asp:Label ID="Label12" runat="server" style="float:right;" Text="Semester: "></asp:Label></b>
                                       <asp:HyperLink ID="HyperLink1" class="btn btn-default" style="margin-left:20%; margin-right:25%; padding:5px;" runat="server" NavigateUrl='<%# "RegWizardModulesUpdate.aspx?StudentID=" + Request.QueryString["studentID"] + "&ModuleID=" + Eval("moduleID") + "&userID=" + Request.QueryString["userID"] + "&level=" + Request.QueryString["level"]%>'>Select this module</asp:HyperLink>
                            </div> </div>
                            </ItemTemplate>
                         <EmptyDataTemplate> There are no optional modules available for you to enrol in this academic year.</EmptyDataTemplate>
                            </asp:ListView>

                      </asp:Panel>  

                        
                  <asp:Label ID="chosenT" runat="server" Text="" Visible="false"></asp:Label>

                  <div id="chosenpanel" style="width:100%;">
                  <b><asp:Label ID="Label4" runat="server" Text="Chosen:" Font-Size="Medium" ForeColor="#1ABB9C"></asp:Label></b><br />
                  These are the optional modules you have enrolled in for this academic year:<br /><br />

                  <asp:ListView ID="showchosenmodule" runat="server" DataSourceID="chosenModules">
                              <ItemTemplate>
                                  <div class="panel panel-default" style="float:left; width:33.333%; padding-right:5px;">
                                   <div class="panel-heading" style="background-color:darkgrey; height:60px;">
                                    <b><asp:Label Text='<%# Eval("moduleCode") %>' runat="server" ID="Label1" />:</b>
                                    <asp:Label Text='<%# Eval("moduleName") %>' runat="server" ID="userIDLabel" /><br />
                                       </div>
                                   
                                    <div class="panel-body" style="height:150px;">
                                    <b>Module Description:</b>
                                    <asp:Label Text='<%# Eval("moduleDescription") %>' runat="server" ID="roleIDLabel" /><br />
                                        </div>
                                   <div class="panel-footer" style="background-color:Darkgrey; color:black;">
                                        <b>Units: </b><asp:Label Text=' <%# Eval("units") %>' runat="server" ID="Label3" />
                                       <asp:Label Text='  <%# Eval("Semester") %>' runat="server" style="float:right;" ID="Label11" /><b>
                                           <asp:Label ID="Label12" runat="server" style="float:right;" Text="Semester: "></asp:Label></b>
                                       <asp:Literal ID="unitscount2" runat="server" OnDataBinding="chosencount_DataBinding" Visible="false"></asp:Literal>
                                       <asp:HyperLink ID="HyperLink1" class="btn btn-default" style="margin-left:18%; margin-right:25%; padding:5px;" runat="server" NavigateUrl='<%# "RegWizardModulesRemove.aspx?StudentID=" + Request.QueryString["studentID"] + "&ModuleID=" + Eval("moduleID") + "&userID=" + Request.QueryString["userID"] + "&level=" + Request.QueryString["level"]%>'>Remove this module</asp:HyperLink>
                                   
                            </div> </div>
                            </ItemTemplate>
                         <EmptyDataTemplate> <i>You have not been enrolled in any optional modules for this academic year.</i></EmptyDataTemplate>
                            </asp:ListView><br /><br />
                      </div>
    
                
                  <div id="regbuttons" style="margin-left:30%; width:60%; padding:10px; float:left;">
             <b><asp:Label ID="Label5" runat="server"  Text="Are these details up to date?" ForeColor="#1ABB9C"></asp:Label></b><br />
                      
                      <asp:SqlDataSource ID="ExitBtn" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' 
                          SelectCommand="SELECT * FROM SIS_USER WHERE SIS_USER.userID = @UID">
                          <SelectParameters>
                  <asp:QueryStringParameter QueryStringField="userid" Name="UID" Type="String"></asp:QueryStringParameter>
               </SelectParameters>
                          </asp:SqlDataSource>

                      <asp:ListView ID="cancelbutton" runat="server" DataSourceID="ExitBtn">
                          <ItemTemplate>

                   <asp:Button ID="ConfirmBtn" CssClass="btn btn-primary"  runat="server" Text="Confirm" OnClick="ConfirmBtn_Click"/>

                      <asp:HyperLink ID="CancelBtn" runat="server" CssClass="btn btn-default" NavigateUrl='<%# "RegWizard.aspx?userID=" + Request.QueryString["userID"] + "&Level=" + Request.QueryString["level"] + "&StudentID=" + Request.QueryString["studentID"]%>'>Save & Exit</asp:HyperLink>

                              </ItemTemplate>
                          </asp:ListView>
                      
                      
                      </div><br />
                    </div>
                        <br />

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


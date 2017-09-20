o<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegWizard.aspx.cs" Inherits="Student_RegWizard" %>

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
                                    <h2>Registration Wizard</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                     <%-- Rebecca: Registration: --%>

              <asp:SqlDataSource ID="studentinfo" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT SIS_STUDENT.studentID, SIS_STUDENT.firstName, SIS_STUDENT.lastName, SIS_USER.email, SIS_STUDENT.address, SIS_STUDENT.contactNumber, SIS_STUDENT.course, SIS_STUDENT.school, SIS_STUDENT.level, SIS_USER.UserID, SIS_USER.Email, SIS_FINANCE.feesOutstanding, SIS_FINANCE.amountPaid, SIS_FINANCE.SFNI, SIS_FINANCE.otherPaymentMethod,SIS_FINANCE.other FROM SIS_STUDENT INNER JOIN SIS_USER ON SIS_STUDENT.userID = SIS_USER.userID 
                  INNER JOIN SIS_FINANCE ON
                  SIS_STUDENT.studentID = SIS_FINANCE.studentID
                  WHERE SIS_USER.userID = @userid">
               
               <SelectParameters>
                   <asp:SessionParameter Name="userid" SessionField="userid" Type="string" />
                </SelectParameters></asp:SqlDataSource>

              <asp:SqlDataSource ID="compmodule" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_MODULES WHERE compulsary='1' AND level = @level">

              <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="Level" Name="level" Type="Int32"></asp:QueryStringParameter>
              </SelectParameters>

              </asp:SqlDataSource>

              <asp:SqlDataSource ID="Selectedmodule" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT SIS_STUDENT_MODULES.moduleSelected, SIS_MODULES.moduleCode, SIS_MODULES.units, SIS_MODULES.moduleName 
                  FROM SIS_STUDENT_MODULES 
                  INNER JOIN SIS_MODULES
                  ON SIS_STUDENT_MODULES.moduleSelected = SIS_MODULES.moduleID
                  WHERE studentID=@SID AND Completed=0">
               <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="StudentID" Name="SID" Type="Int32"></asp:QueryStringParameter>
              </SelectParameters>
              </asp:SqlDataSource>
              
             
              <asp:ListView ID="StudentDetails" runat="server" DataSourceID="studentinfo" OnItemDataBound="StudentDetails_ItemDataBound">

                  <ItemTemplate>
                      <br /><div class="panel-body" style="outline:auto; outline-color:lightgray; margin-left:10%; margin-right:10%;">
                           Please confirm the details we have for you are correct:<br />
                          
                          <div id="manualBtn" style="float:right;">
                          <asp:HyperLink ID="ManualEnrol" runat="server" CssClass="btn btn-primary" NavigateUrl=' <%# "ManualEnrol.aspx?UserID=" + Eval("userID") + "&Level=" + Eval("level") + "&StudentID=" + Eval("studentID") %>'  >Manual Enrolment</asp:HyperLink>
                              </div>
                          
                          <br />
                          <i>Step 1:</i><br />
                      <u>Personal Details</u><br />
                          <b>Name:</b>
                          <asp:Label ID="first" runat="server" Text='<%# Eval("firstName") %>' ForeColor="dimgray"></asp:Label> <asp:Label ID="last" runat="server" Text='<%# Eval("lastName") %>' ForeColor="dimgray"></asp:Label><br />

                         <b> Address:</b> <asp:Label ID="Label1" runat="server" Text='<%# Eval("address") %>' ForeColor="dimgray"></asp:Label><br />
                         <b> Contact Number:</b> <asp:Label ID="Label2" runat="server" Text='<%# Eval("contactNumber") %>' ForeColor="dimgray"></asp:Label><br />
                          <b> Email:</b> <asp:Label ID="Label6" runat="server" Text='<%# Eval("email") %>' ForeColor="dimgray"></asp:Label><br />
                         
                          <div id="editBtn" style="float:right;">
                          <asp:HyperLink ID="HyperLink2" runat="server" CssClass="btn btn-primary" NavigateUrl=' <%# "RegWizardEdit.aspx?UserID=" + Eval("userID") + "&Level=" + Eval("level") + "&StudentID=" + Eval("studentID") %>'>Edit Personal Details</asp:HyperLink>
                              </div>

                          <br /><i>Step 2:</i>
                         <br /> <u>Financial Details</u><br />
                          <b> Fees Outstanding: </b> <asp:Label ID="Label8" runat="server" Text=' <%# "£" + Eval("feesOutstanding") %>' ForeColor="dimgray"></asp:Label><br />
                            <b> Fees Paid: </b> <asp:Label ID="Label9" runat="server" Text=' <%# "£" + Eval("amountPaid") %>' ForeColor="dimgray"></asp:Label><br />
                          <b> SFNI? </b> <asp:CheckBox ID="SFNIBox" runat="server" Enabled="false" Checked='<%# Convert.ToBoolean(Eval("SFNI")) %>' ForeColor="dimgray"/><br />
                         
                          <b> Other payment method? </b> <asp:CheckBox ID="PaymentBox" runat="server" Enabled="false" Checked='<%# Convert.ToBoolean(Eval("otherPaymentMethod")) %>' ForeColor="dimgray"/><br />
                         <b> Other: </b> <asp:Label ID="Label11" runat="server" Text='<%# Eval("other") %>' ForeColor="dimgray"></asp:Label><br />

                          
                            <div id="editBtn2" style="float:right;">
                          <asp:HyperLink ID="HyperLink4" runat="server" CssClass="btn btn-primary" NavigateUrl=' <%# "RegWizardFinance.aspx?UserID=" + Eval("userID") + "&Level=" + Eval("level") + "&studentID=" + Eval("studentID")%>'>Edit Financial Details</asp:HyperLink>
                              </div>
                        
                          <br /><i>Step 3:</i>
                          <br /> <u>Academic Details:</u></br>
                          <b> School: </b><asp:Label ID="Label10" runat="server" Text='<%# Eval("school") %>' ForeColor="dimgray"></asp:Label><br />
                          <b> Pathway:</b><asp:Label ID="Label3" runat="server" Text='<%# Eval("course") %>' ForeColor="dimgray"></asp:Label><br />
                          <b> Level:</b> <asp:Label ID="Label4" runat="server" Text='<%# Eval("level") %>' FouqColor="dimgray"></asp:Label>
                   

                   <div id="editBtn3" style="float:right;">
                          <asp:HyperLink ID="Timetable" runat="server" CssClass="btn btn-primary" NavigateUrl='<%# "RegTimetable.aspx?userID=" + Request.QueryString["userID"] + "&Level=" + Request.QueryString["Level"] + "&studentID=" + Request.QueryString["StudentID"] %>'>View Timetable</asp:HyperLink>

                        </ItemTemplate>
              </asp:ListView>

                       <asp:HyperLink ID="ModLink" runat="server" CssClass="btn btn-primary" >Choose Modules</asp:HyperLink>
                              </div><br /><br />
              
               <b>Compulsory Modules:</b><br />
              <asp:ListView ID="CompModuleInfo" runat="server" DataSourceID="compmodule">
               <ItemTemplate>
                   <ul><b><asp:Label ID="ModuleCode" runat="server" Text='<%# Eval("moduleCode")%>' ForeColor="DimGray"></asp:Label>:</b>
                       <asp:Label ID="moduleName" runat="server" Text=' <%# " " + Eval("moduleName") %>' ForeColor="dimgray"></asp:Label>
                <div style="float:right"><b>  Units: </b><asp:Label ID="Label7" runat="server" Text=' <%# Eval("units") %>' ForeColor="DimGray"></asp:Label>
                    <asp:Literal ID="unitscount" runat="server" OnDataBinding="unitscount_DataBinding" Visible="false"></asp:Literal>

                </div>
                   </ul>
                          
                   </ItemTemplate>
               </asp:ListView>

              <asp:Label ID="comptotal" runat="server" Visible="false"></asp:Label>

                <b>Selected Modules:</b> <br />
              <asp:ListView ID="SelectedModuleInfo" runat="server" DataSourceID="Selectedmodule">
               <ItemTemplate>
                   <ul><b><asp:Label ID="ModuleCode" runat="server" Text='<%# Eval("moduleCode")%>' ForeColor="DimGray"></asp:Label>:</b>
                       <asp:Label ID="moduleName" runat="server" Text=' <%# " " + Eval("moduleName") %>' ForeColor="DimGray"></asp:Label>
                        <div style="float:right"><b>  Units: </b><asp:Label ID="unitLabel" runat="server" Text=' <%# Eval("units") %>' ForeColor="DimGray"></asp:Label>
                             <asp:Literal ID="unitscount2" runat="server" OnDataBinding="unitscount2_DataBinding" Visible="false"></asp:Literal>

                        </div>                   </ul>
                          
                   </ItemTemplate>
                  <EmptyDataTemplate>
                      No optional modules selected.
                  </EmptyDataTemplate>
               </asp:ListView>
              
              <asp:Label ID="opttotal" runat="server" Visible="false" ForeColor="DimGray"></asp:Label>
              <asp:Label ID="TotalValue" runat="server" style="float:right;" Visible="false" ForeColor="DimGray"></asp:Label><asp:Label ID="TotalValue2" runat="server" style="float:right;" Visible="false" ForeColor="DimGray"></asp:Label>
              <b><asp:Label ID="Total" runat="server" Text="Total Units: " style="float:right;"></asp:Label></b><br />
             
              <br />
              
              <div id="regbuttons" style="margin-left:35%; padding:2px;">
                              <b><asp:Label ID="Label5" runat="server" style="margin-left:5%; margin-right:0%;" Text="Are these details up to date?" ForeColor="#1ABB9C"></asp:Label></b><br />

                      <asp:HyperLink ID="ConfirmLink" runat="server" CssClass="btn btn-primary" style="margin-left:0%;" >Confirm & Enrol</asp:HyperLink>
                      
                      <asp:HyperLink ID="Cancel" runat="server" CssClass="btn btn-default" NavigateUrl="Default.aspx">Save & Exit</asp:HyperLink><br /> </div>

                                  <asp:TextBox ID="Modules" runat="server" Visible="false"></asp:TextBox>

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

j
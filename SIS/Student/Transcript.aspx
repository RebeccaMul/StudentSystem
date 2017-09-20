<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Transcript.aspx.cs" Inherits="Student_Transcript" %>

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
                                    <li><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                                    <li><a href="Timetable.aspx"><i class="fa fa-table"></i>Timetable</a></li>
                                    <li><a href="Modules.aspx"><i class="fa fa-list"></i>Modules</a></li>
                                  <asp:ListView ID="ListView1" runat="server" DataSourceID="StudentDetails">
                                    <ItemTemplate>
                                    <li class="licurrent"><asp:HyperLink ID="link" runat="server" NavigateUrl='<%# "Transcript.aspx?studentID=" + Eval("studentID")%>'><i class="fa fa-file-text-o"></i>Transcript</asp:HyperLink></li>
                                            
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
                                    <h1>Transcript</h1>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">




                                    <asp:GridView ID="GridView1" runat="server" DataSourceID="Studentinfo" CellPadding="4" Visible="false" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                        <EditRowStyle BackColor="#999999"></EditRowStyle>

                                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True"></FooterStyle>

                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#284775"></PagerStyle>

                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                        <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                                        <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                                        <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                                    </asp:GridView>


                                    <asp:ListView ID="ListView2" runat="server" DataSourceID="StudentName">
                                        <ItemTemplate>
                                   
                                        </ItemTemplate>

                                    </asp:ListView>
                                    <br />


                                    <div class="row">

                                        <div class="x_content">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    Personal Details:
                                       
                                                </div>


                                                <asp:SqlDataSource ID="readfromimage" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT imagepath FROM SIS_STUDENT WHERE SIS_STUDENT.studentID = @studentID">
                                                    <SelectParameters>
                                                        <asp:QueryStringParameter Name="studentID" QueryStringField="studentID" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                                <div class="panel-body">
                                                    <div class="col-lg-4 col-sm-12 col-xs-12">

                                                        <br />
                                                        <div class="text-center">
                                                            <asp:ListView ID="readfromimageview" runat="server" DataSourceID="readfromimage">
                                                                <ItemTemplate>
                                                                         <asp:Image ID="Image1" runat="server" Style="width: 250px; height: 200px; margin: auto;" ImageUrl='<%# "../../files/" + Eval("imagepath") %>' />
                                                                    </div>
                                              <br />

                                                                </ItemTemplate>
                                                            </asp:ListView>

                                                            <br />


                                                            <asp:SqlDataSource ID="readDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT studentNo, firstName, lastName, school, course, level FROM SIS_STUDENT WHERE SIS_STUDENT.studentID = @studentID">
                                                                <SelectParameters>
                                                                    <asp:QueryStringParameter Name="studentID" QueryStringField="studentID" />

                                                                </SelectParameters>
                                                            </asp:SqlDataSource>

                                                            <asp:ListView ID="readDetailsView" runat="server" DataSourceID="readDetails">
                                                                <ItemTemplate>


                                                                    <br />
                                                                    <b>Name: </b>
                                                                    <asp:Label ID="firstnameText" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                                                    <asp:Label ID="lastnameText" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                                                    <br />
                                                                    <b>School:</b>
                                                                    <asp:Label ID="schoolText" runat="server" Text='<%# Eval("school")  %>'></asp:Label>
                                                                    <br />
                                                                    <b>Course: </b>
                                                                    <asp:Label ID="courseText" runat="server" Text='<%# Eval("course")  %>'></asp:Label>
                                                                    <br />
                                                                    <b>Level: </b>
                                                                    <asp:Label ID="levelText" runat="server" Text='<%# Eval("level")  %>'></asp:Label>

                                                                    <br />
                                                                    <br />
                                                                </ItemTemplate>
                                                            </asp:ListView>
                                                        </div>

                                                        <br />

                                                        <!-- RME STUDENT PROFILE DATA -->



                                                        <div class="col-md-4 col-sm-12 col-xs-12">
                                                            <p>Student Number</p>
                                                            <asp:TextBox ID="studentNum" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                            <br />

                                                            <p>First Name</p>
                                                            <asp:TextBox ID="fname" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                            <br />

                                                            <p>Last Name</p>
                                                            <asp:TextBox ID="lname" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>

                                                            <br />
                                                            <p>Home Address</p>
                                                            <asp:TextBox ID="homeAddress" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>

                                                        </div>




                                                        <div class="col-md-3"></div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12">
                                                            <p>Term Address</p>
                                                            <asp:TextBox ID="termAddress" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>


                                                            <br />

                                                            <p>Email Address</p>
                                                            <asp:TextBox ID="email" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>

                                                            <br />

                                                            <p>Contact Number</p>
                                                            <asp:TextBox ID="contactNumber" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>

                                                            <br />


                                                            <br />
                                                            <asp:Label ID="displaySaved" runat="server" Text=""></asp:Label>
                                                            <asp:Label ID="myinfo" runat="server" Text="" Enabled="false"></asp:Label>


                                                        </div>



                                                    </div>

                                                    </div>
                                                </div>
                                       
                                                            <div class="panel-body">




                                                            <!-- RME TRANSCRIPT DATA -->


                                                            <asp:SqlDataSource ID="Studentinfo" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT SIS_MODULES.moduleID, SIS_USER.UserID, SIS_MODULES.moduleName, SIS_STUDENT.studentID, SIS_STUDENT.firstName, SIS_STUDENT.lastName, SIS_STUDENT.course, SIS_STUDENT.level, SIS_RESULTS.resultMark, SIS_RESULTS.[pass/fail] FROM SIS_MODULES 
                      INNER JOIN SIS_RESULTS ON SIS_MODULES.moduleID = SIS_RESULTS.moduleID
                      INNER JOIN SIS_STUDENT ON SIS_RESULTS.studentID = SIS_STUDENT.studentID 
                      INNER JOIN SIS_USER ON SIS_STUDENT.userID = SIS_USER.UserID
                      WHERE SIS_USER.userID = @userid">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="userid" SessionField="userid" Type="string" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>

                                                            <asp:SqlDataSource ID="StudentName" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT SIS_STUDENT.firstName, SIS_STUDENT.lastName FROM SIS_STUDENT 
                      WHERE SIS_STUDENT.userID = @userid">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="userid" SessionField="userid" Type="string" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                                 <h3>Current Academic Results</h3>
                                                            <asp:ListView ID="showmodule" runat="server" DataSourceID="Studentinfo">

                                                               

                                                                <ItemTemplate>
                                                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading">
                                                                                <b>Module Name:</b>
                                                                                <asp:Label Text='<%# Eval("moduleName") %>' runat="server" ID="Label1" /><br />
                                                                            </div>

                                                                            <div class="panel-body">




                                                                                <b>Course:</b>
                                                                                <asp:Label Text='<%# Eval("course") %>' runat="server" ID="Label2" /><br />

                                                                                <b>Level: </b>
                                                                                <asp:Label Text='<%# Eval("level") %>' runat="server" ID="Label3" /><br />

                                                                                <b>Result:</b>
                                                                                <asp:Label Text='<%# Eval("resultMark") %>' runat="server" ID="Label4"></asp:Label>
                                                                                <asp:Label Text='<%# Eval("pass/fail") %>' runat="server" ID="Label5" /><br />

                                                                            </div>


                                                                        </div>
                                                                    </div>



                                                                </ItemTemplate>

                                                            </asp:ListView>



                                                            </div>
                                                </div>
<asp:Button ID="Button1" runat="server" CssClass="btn btn-default" Text="Download in PDF Format" OnClick="Button1_Click" style="float:right;" /> 
                                    </div>   
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                      </div>
                    </div>
                                          
                </div>
            
        
        <asp:SqlDataSource ID="StudentDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_STUDENT WHERE userID=@ID ">
            <SelectParameters>
                <asp:SessionParameter Name="ID" SessionField="userid" Type="string" />
            </SelectParameters>

        </asp:SqlDataSource>
        <!-- /page content -->


        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/custom.js"></script>
        <script src="../js/nicescroll/jquery.nicescroll.min.js"></script>
    </form>
</body>

</html>


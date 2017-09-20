<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Student_Profile" %>

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
                <div class="right_col" role="main" style="height: 100%;">

                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Profile</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            Personal Details:
                                       
                                        </div>


                                        <asp:SqlDataSource ID="readfromimage" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT imagepath FROM SIS_STUDENT WHERE SIS_STUDENT.userID = @userID">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="userID" SessionField="userID" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <div class="panel-body">
                                            <div class="col-lg-4 col-sm-12 col-xs-12">

                                                <br />
                                                <div class="text-center">
                                                    <asp:ListView ID="readfromimageview" runat="server" DataSourceID="readfromimage">
                                                        <ItemTemplate>
                                                            <asp:Image ID="image" runat="server" class="avatar img-circle img-thumbnail" Style="width: 250px; height: 200px; margin: auto;" ImageUrl='<%# "../../files/" + Eval("imagepath")  %>' />
                                                            </div>
                                              <br />

                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                    <asp:FileUpload ID="myimage" runat="server" CssClass="form-control" Style="width: 100%;" />
                                                    <br />


                                                    <asp:SqlDataSource ID="readDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT studentNo, firstName, lastName, school, course, level FROM SIS_STUDENT WHERE SIS_STUDENT.userID = @userID">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="userID" SessionField="userID" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                                    <asp:ListView ID="readDetailsView" runat="server" DataSourceID="readDetails">
                                                        <ItemTemplate>

                                                            <b>Student Number:</b>
                                                            <asp:Label ID="studentNo" runat="server" Text='<%# Eval("studentNo")  %>'></asp:Label>
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
                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                     <p>Student Number</p>
                                                    <asp:TextBox ID="studentNumber" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    <br />
                                                    <p>First Name</p>
                                                    <asp:TextBox ID="fnameText"  Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                                    <br />

                                                    <p>Last Name</p>
                                                    <asp:TextBox ID="lnameText"  Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <br />
                                                    <p>Home Address</p>
                                                    <asp:TextBox ID="homeaddressText" CssClass="form-control" runat="server"></asp:TextBox>
                                                     </div>
                                                <div class="col-md-3"></div>
                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                 
                                                    <p>Term Address</p>
                                                    <asp:TextBox ID="termaddressText" CssClass="form-control" runat="server"></asp:TextBox>
                                               
                                                    <br />
                                                    <p>Email Address</p>
                                                    <asp:TextBox ID="emailText" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>

                                                    <br />

                                                    <p>Contact Number</p>
                                                    <asp:TextBox ID="contactnumberText" CssClass="form-control" runat="server"></asp:TextBox>

                                                    <br />





                                                    <asp:HyperLink ID="cancelBtn" runat="server" Text="Cancel" CssClass="btn btn-default" NavigateUrl="Default.aspx" />
                                                    <asp:Button ID="saveBtn" runat="server" Text="Save Changes" type="submit" class="btn btn-primary submit" OnClick="saveBtn_Click" />

                                                    <br />
                                                    <asp:Label ID="displaySaved" runat="server" Text=""></asp:Label>
                                                    <asp:Label ID="myinfo" runat="server" Text="" Enabled="false"></asp:Label>

                                                </div>

                                            </div>
                                        </div>
                                    </div>



                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                <div class="x_content">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            Next of Kin Details:                                       
                                        </div>


                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT imagepath FROM SIS_STUDENT WHERE SIS_STUDENT.userID = @userID">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="userID" SessionField="userID" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <div class="panel-body">
                                            <div class="col-md-12 col-sm-12 col-xs-12">



                                                <asp:ListView ID="ListView1" runat="server" DataSourceID="readfromimage">
                                                    <ItemTemplate>
                                                    </ItemTemplate>
                                                </asp:ListView>



                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT studentNo, firstName, lastName, school, course, level FROM SIS_STUDENT WHERE SIS_STUDENT.userID = @userID">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="userID" SessionField="userID" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>




                                            

                                                    <p>First Name</p>
                                                    <asp:TextBox ID="kinFirstNameText" CssClass="form-control" runat="server"></asp:TextBox>
                                                <br />

                                                    <p>Last Name</p>
                                                    <asp:TextBox ID="kinLastNameText" CssClass="form-control" runat="server"></asp:TextBox>
                                              <br />


                                       
                                                    <p>Address</p>
                                                    <asp:TextBox ID="kinAddressText" CssClass="form-control" runat="server"></asp:TextBox>
                                            

                                      
                                              
                                                    <br />
                                                    <p>Contact Number</p>
                                                    <asp:TextBox ID="kinContactText" CssClass="form-control" runat="server"></asp:TextBox>

                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <div class="x_content">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    Academic Details:                                       
                                                </div>


                                                <div class="panel-body">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">





                                                        <p>Student School</p>
                                                        <asp:TextBox ID="schoolText" CssClass="form-control" runat="server"  Enabled="false"></asp:TextBox>
                                                        <br />

                                                        <p>Student Course</p>
                                                        <asp:TextBox ID="courseText" CssClass="form-control" runat="server"  Enabled="false"></asp:TextBox>
                                                        <br />

                                                        <p>Level</p>
                                                        <asp:TextBox ID="levelText" CssClass="form-control" runat="server"  Enabled="false"></asp:TextBox>



                                                        <asp:SqlDataSource ID="advisorSource" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_ADVISOR"></asp:SqlDataSource>


                                                        <p>Advisor of studies</p>


                                                        <asp:DropDownList ID="advisorList" runat="server" CssClass="form-control" DataSourceID="advisorSource" DataTextField="fullName" DataValueField="advisorID"  Enabled="false"></asp:DropDownList><asp:RequiredFieldValidator ID="requiredAdvisor" runat="server" ControlToValidate="advisorList" ErrorMessage="Please assign advisor to student" ForeColor="#73879C"></asp:RequiredFieldValidator>


                                                        <asp:SqlDataSource ID="tutorSource" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_LECTURER"></asp:SqlDataSource>

                                                        <br />
                                                        <p>Tutor</p>

                                                        <asp:DropDownList ID="tutorList" runat="server" CssClass="form-control" DataSourceID="tutorSource" DataTextField="fullName" DataValueField="lecturerID"  Enabled="false"></asp:DropDownList><asp:RequiredFieldValidator ID="requiredTutor" runat="server" ControlToValidate="tutorList" ErrorMessage="Please assign tutor to student" ForeColor="#73879C"></asp:RequiredFieldValidator>

                                                    </div>
                                                </div>
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


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student_Create.aspx.cs" Inherits="Admin_Student_Create" %>

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
    <form id="form2" runat="server">
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
                                    <li><a href="Lecturers.aspx"><i class="fa fa-group"></i>Lecturers</a></li>
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
                                    <li><a href="#"><i class="fa fa-cog"></i>Configuration</a></li>
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
                                    <h2>Create Student</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            Personal Details:
                                       
                                        </div>


                                        <asp:SqlDataSource ID="readfromimage" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT imagepath FROM SIS_USER WHERE SIS_USER.userID = @userID">
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
                                                    <asp:Label ID="displayLabel" runat="server" Text=""></asp:Label>
                                                      <asp:Label ID="myinfo" runat="server" Text="" Enabled="false"></asp:Label>
                                                </div>

                                                <br />
                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                    <p>Student Number</p>
                                                    <asp:TextBox ID="studentNoText" CssClass="form-control" runat="server" MaxLength="8" minlength="8" onchange="UserAvailability()"></asp:TextBox><asp:RequiredFieldValidator ID="requiredStudentNumber" runat="server" ControlToValidate="studentNoText" ErrorMessage="Please Enter Student Number" ForeColor="#73879C"></asp:RequiredFieldValidator>
                                                    <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                                    <br />
                                                    <p>Password</p>
                                                    <asp:TextBox ID="passwordText" CssClass="form-control" runat="server" TextMode="Password" Onkeyup="CheckPasswordStrength(this.value)"></asp:TextBox><asp:RequiredFieldValidator ID="requiredStudentPassword" runat="server" ControlToValidate="passwordText" ErrorMessage="Please Enter Student Password" ForeColor="#73879C"></asp:RequiredFieldValidator>
                                                    <span id="password_strength"></span>
                                                    <br />
                                                    <p>First Name</p>
                                                    <asp:TextBox ID="fnameText" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="requiredStudentFName" runat="server" ControlToValidate="fnameText" ErrorMessage="Please Enter Student First Name" ForeColor="#73879C"></asp:RequiredFieldValidator>
                                                    <br />

                                                    <p>Last Name</p>
                                                    <asp:TextBox ID="lnameText" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="requiredStudentLName" runat="server" ControlToValidate="lnameText" ErrorMessage="Please Enter Student Last Name" ForeColor="#73879C"></asp:RequiredFieldValidator>

                                                    <br />
                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                    <p>Home Address</p>
                                                    <asp:TextBox ID="homeaddressText" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="requiredStudentHomeAddress" runat="server" ControlToValidate="homeaddressText" ErrorMessage="Please Enter Student Home Address" ForeColor="#73879C"></asp:RequiredFieldValidator>

                                                    <br />
                                                    <p>Term Address</p>
                                                    <asp:TextBox ID="termaddressText" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="requiredStudentTermAddress" runat="server" ControlToValidate="termaddressText" ErrorMessage="Please Enter Student Term Address" ForeColor="#73879C"></asp:RequiredFieldValidator>


                                                    <br />

                                                    <p>Email Address</p>
                                                    <asp:TextBox ID="emailText" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox><asp:RequiredFieldValidator ID="requreiredStudentEmailAddress" runat="server" ControlToValidate="emailText" ErrorMessage="Please Enter Student Email Address" ForeColor="#73879C"></asp:RequiredFieldValidator>

                                                    <br />

                                                    <p>Contact Number</p>
                                                    <asp:TextBox ID="contactnumberText" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="requiredContactNumber" runat="server" ControlToValidate="contactnumberText" ErrorMessage="Please Enter Contact Number" ForeColor="#73879C"></asp:RequiredFieldValidator>

                                                    <br />




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
                                                        <asp:TextBox ID="kinFirstNameText" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="requiredkinFirstName" runat="server" ControlToValidate="kinFirstNameText" ErrorMessage="Please Enter the next of kin First Name" ForeColor="#73879C"></asp:RequiredFieldValidator>


                                                        <p>Last Name</p>
                                                        <asp:TextBox ID="kinLastNameText" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="requiredkinLastName" runat="server" ControlToValidate="kinLastNameText" ErrorMessage="Please Enter the next of kin Last Name" ForeColor="#73879C"></asp:RequiredFieldValidator>



                                                        <p>Address</p>
                                                        <asp:TextBox ID="kinAddressText" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="requiredkinAddress" runat="server" ControlToValidate="kinAddressText" ErrorMessage="Please Enter the next of kin Address" ForeColor="#73879C"></asp:RequiredFieldValidator>




                                                        <br />
                                                        <p>Contact Number</p>
                                                        <asp:TextBox ID="kinContactnoBox" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="requiredkinContact" runat="server" ControlToValidate="kinContactnoBox" ErrorMessage="Please Enter the next of kin Contact Number" ForeColor="#73879C"></asp:RequiredFieldValidator>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <div class="x_content">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    Academics:                                       
                                                </div>



                                                <div class="panel-body">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">


                                                        <p>Student School</p>
                                                  

                                                        
                                                        <asp:DropDownList ID="schoolBox" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                                                             <asp:ListItem Text="" Value="" />
                                                            <asp:ListItem Text="Chemistry and Chemical Engineering" Value="CCE" />
                                                            <asp:ListItem Text="Electronics, Electrical Engineering and Computer Science" Value="EEECS"></asp:ListItem>
                                                            <asp:ListItem Text="Mathematics and Physics" Value="MP"></asp:ListItem>
                                                            <asp:ListItem Text="Mechanical and Aerospace Engineering" Value="MAE"></asp:ListItem>


                                                        </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="schoolBox" ErrorMessage="Please Enter the School" ForeColor="#73879C"></asp:RequiredFieldValidator>

                                                        <br />

                                                        <p>Student Course</p>
                                  


                                                        <asp:DropDownList ID="courseBox" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                                                             <asp:ListItem Text="" Value="" />
                                                            <asp:ListItem Text="Computing and Information Technology" Value="CIT" />
                                                            <asp:ListItem Text="Computer Science" Value="CS"></asp:ListItem>
                                                            <asp:ListItem Text="Software Engineering" Value="SE"></asp:ListItem>
                                                            <asp:ListItem Text="Mathematics" Value="2"></asp:ListItem>


                                                        </asp:DropDownList><asp:RequiredFieldValidator ID="requiredCourse" runat="server" ControlToValidate="courseBox" ErrorMessage="Please Enter the Course" ForeColor="#73879C"></asp:RequiredFieldValidator>
                                                        <br />

                                                        <p>Level</p>

                                                        <asp:DropDownList ID="levelBox" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                                                            <asp:ListItem Text="" Value="" />
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                            <asp:ListItem Text="4" Value="4"></asp:ListItem>

                                                        </asp:DropDownList><asp:RequiredFieldValidator ID="requiredLevelBox" runat="server" ControlToValidate="levelBox" ErrorMessage="Please Enter the Level of Entry" ForeColor="#73879C"></asp:RequiredFieldValidator>

                                                        <asp:SqlDataSource ID="advisorSource" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_ADVISOR"></asp:SqlDataSource>


                                                        <p>Advisor of studies:</p>

                                                        <asp:DropDownList ID="advisorList" runat="server" CssClass="form-control" DataSourceID="advisorSource" DataTextField="fullName" DataValueField="advisorID" AppendDataBoundItems="True">
                                                            <asp:ListItem Text="" Value="" />
                                                        </asp:DropDownList><asp:RequiredFieldValidator ID="requiredAdvisor" runat="server" ControlToValidate="advisorList" ErrorMessage="Please assign advisor to student" ForeColor="#73879C"></asp:RequiredFieldValidator>


                                                        <asp:SqlDataSource ID="tutorSource" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_LECTURER"></asp:SqlDataSource>

                                                        <br />
                                                        <p>Tutor</p>

                                                        <asp:DropDownList ID="tutorList" runat="server" CssClass="form-control" DataSourceID="tutorSource" DataTextField="fullName" DataValueField="lecturerID" AppendDataBoundItems="True">
                                                            <asp:ListItem Text="" Value="" />
                                                        </asp:DropDownList><asp:RequiredFieldValidator ID="requiredTutor" runat="server" ControlToValidate="tutorList" ErrorMessage="Please assign tutor to student" ForeColor="#73879C"></asp:RequiredFieldValidator>

                                                        <br />
                                                        <asp:Button ID="cancelBtn" runat="server" Text="Cancel" class="btn btn-default" CausesValidation="false" OnClick="cancelBtn_Click" />
                                                        <asp:Button ID="createBtn" runat="server" Text="Create" CssClass="btn btn-primary submit" OnClick="createBtn_Click" />


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
            </div>
        </div>


        <!-- /page content -->


        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/custom.js"></script>
        <script src="../js/nicescroll/jquery.nicescroll.min.js"></script>

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <script src="js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript">
            function UserAvailability() { //This function call on text change.             
                $.ajax({
                    type: "POST",
                    url: "Student_Create.aspx/CheckName", // this for calling the web method function in cs code.  
                    data: '{username: "' + $("#<%=studentNoText.ClientID%>")[0].value + '" }',// username value  
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccess,
                    failure: function (response) {
                        alert(response);
                    }
                });
            }

            // function OnSuccess
            function OnSuccess(response) {
                var msg = $("#<%=lblStatus.ClientID%>")[0];
                switch (response.d) {
                    case "true":
                        msg.style.display = "block";
                        msg.style.color = "red";
                        msg.innerHTML = "Student Number already exist.";
                        document.getElementById("createBtn").disabled = true;
                        break;
                    case "false":
                        msg.style.display = "block";
                        msg.style.color = "green";
                        msg.innerHTML = "Student Number Available.";
                        document.getElementById("createBtn").disabled = false;
                        break;
                }
            }

        </script>

        <script type="text/javascript">
            function CheckPasswordStrength(password) {
                var password_strength = document.getElementById("password_strength");

                //TextBox left blank.
                if (password.length == 0) {
                    password_strength.innerHTML = "";
                    return;
                }

                //Regular Expressions.
                var regex = new Array();
                regex.push("[A-Z]"); //Uppercase Alphabet.
                regex.push("[a-z]"); //Lowercase Alphabet.
                regex.push("[0-9]"); //Digit.
                regex.push("[$@$!%*#?&]"); //Special Character.

                var passed = 0;

                //Validate for each Regular Expression.
                for (var i = 0; i < regex.length; i++) {
                    if (new RegExp(regex[i]).test(password)) {
                        passed++;
                    }
                }

                //Validate for length of Password.
                if (passed > 2 && password.length > 8) {
                    passed++;
                }

                //Display status.
                var color = "";
                var strength = "";
                switch (passed) {
                    case 0:
                    case 1:
                        strength = "Weak Password";
                        color = "red";
                        break;
                    case 2:
                        strength = "Good Password";
                        color = "darkorange";
                        break;
                    case 3:
                    case 4:
                        strength = "Strong Password";
                        color = "green";
                        break;
                    case 5:
                        strength = "Very Strong Password";
                        color = "darkgreen";
                        break;
                }
                password_strength.innerHTML = strength;
                password_strength.style.color = color;
            }
        </script>
    </form>
</body>

</html>


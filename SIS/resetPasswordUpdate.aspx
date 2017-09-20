<%@ Page Language="C#" AutoEventWireup="true" CodeFile="resetPasswordUpdate.aspx.cs" Inherits="resetPasswordUpdate" %>

<!DOCTYPE html>
<html lang="en">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Student Information Systems | </title>

    <!-- Bootstrap core CSS -->

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">

    <!-- Custom styling plus plugins -->
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/icheck/flat/green.css" rel="stylesheet">

    <link rel="icon" href="img/uni.png" />

    <script src="js/jquery.min.js"></script>

    <!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

</head>
<body>
    <form id="form1" runat="server">

        <body style="background: #F7F7F7;">

            <div class="">

                <div id="wrapper">
                    <div id="login" class="animate form">
                        <section class="login_content">
                              <asp:SqlDataSource ID="readfromConfig" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_CONFIG"></asp:SqlDataSource>

                        <asp:ListView ID="readfromimageview" runat="server" DataSourceID="readfromConfig">
                            <ItemTemplate>
                                <asp:Image ID="uniImg" runat="server" Width="50px" Height="50px" ImageUrl='<%# "../files/" + Eval("logoImagepath")  %>' />
                            </ItemTemplate>
                        </asp:ListView>
                        <br />

                        <asp:ListView ID="systemName" runat="server" DataSourceID="readfromConfig">
                            <ItemTemplate>
                                <h1>
                            <asp:Label ID="systemLabel" runat="server" Text='<%# Eval("systemName")  %>'></asp:Label></h1>
                            </ItemTemplate>
                        </asp:ListView>
                        <hr />

                               <asp:Label ID="username" runat="server" Text=""></asp:Label>
                        <br />
                        <br />
                            <asp:Panel ID="passwordPanel" runat="server">
								 <div style="margin-bottom: 0px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span><asp:TextBox ID="newPassword" runat="server" input class="form-control" placeholder="enter new password" style="margin:auto;" autofocus="" TextMode="Password" ></asp:TextBox></div><asp:RequiredFieldValidator ID="RFV1" runat="server" 
            ControlToValidate="newPassword" ErrorMessage="Please enter new password" ForeColor="#73879C"></asp:RequiredFieldValidator>
							<br />
                             <div style="margin-bottom: 0px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    	<asp:TextBox ID="confirmPassword" runat="server" input class="form-control"  placeholder="confirm new password" style="margin:auto;" autofocus="" TextMode="Password"></asp:TextBox>
                                 </div><asp:RequiredFieldValidator ID="RVF2" runat="server" ControlToValidate="confirmPassword" ErrorMessage="Please confirm new password" ForeColor="#73879C"></asp:RequiredFieldValidator>
 <br />
            <asp:CompareValidator ID="CV1" runat="server" 
            ControlToCompare="newPassword" ControlToValidate="confirmPassword" 
            ErrorMessage="Please ensure new passwords match" ForeColor="#73879C"></asp:CompareValidator>    
					<div class="text-center">						
							<asp:Button ID="confirmBtn" runat="server" Text="Confirm" class="btn btn-default submit" style="width: 100px; margin:auto;" OnClick="confirmBtn_Click"  /></div>		
</asp:Panel>
                            <asp:Label ID="updateLabel" runat="server" Text=""><a href="Default.aspx"></a></asp:Label>
                        <br />
                        <div class="text-center">
                    <asp:Button ID="loginBtn" runat="server" Text="Log in" class="btn btn-default submit" style="width: 100px; margin:auto;" OnClick="loginBtn_Click"  /></div>

                        </section>  </div>
                </div>

        </div>

    </form>
</body>
</html>

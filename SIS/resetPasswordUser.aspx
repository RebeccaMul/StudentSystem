<%@ Page Language="C#" AutoEventWireup="true" CodeFile="resetPasswordUser.aspx.cs" Inherits="resetPasswordUser" %>

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

    <link rel="icon" href="../img/uni.png" />

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

       <body style="background: #F7F7F7; background-image: url(img/IMG_BG.JPG.svg); background-size:cover; background-position:bottom; background-repeat:no-repeat; background-attachment:fixed;">
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
                            <asp:Label ID="warningLabel" runat="server" Text="To change your password, answer your security question." Font-Bold="true"></asp:Label>
                            <br />
                            <br />

                            <asp:SqlDataSource ID="dropdown" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_SECURITYQ INNER JOIN SIS_USER ON SIS_USER.questionID = SIS_SECURITYQ.questionID WHERE SIS_USER.userID = @userid">

                                <SelectParameters>

                                    <asp:SessionParameter Name="userid" SessionField="userid" Type="string" />

                                </SelectParameters>

                            </asp:SqlDataSource>


                        
    <asp:DropDownList ID="securityList" runat="server" style="width: 300px; margin:auto;" CssClass="form-control" DataSourceID="dropdown" DataTextField="questionName" DataValueField="questionID"></asp:DropDownList>
    <br />
                  <asp:TextBox ID="answerBox" runat="server" input class="form-control" style="width: 300px; margin:auto;" autofocus="" placeholder="Answer"></asp:TextBox><asp:RequiredFieldValidator ID="RFV1" runat="server" 
            ControlToValidate="answerBox" 
            ErrorMessage="Please enter an Answer." ForeColor="#73879C"></asp:RequiredFieldValidator>
            <br />
       <div class="text-center">                       
         <asp:Button ID="continueBtn" runat="server" Text="Continue" CssClass="btn btn-default submit" class="text-center" style="width: 100px; margin:auto;" OnClick="continueBtn_Click" />
               
             <br />
             <br />
       <asp:Label ID="Label1" runat="server" Text="Else, click below to navigate to email link reset option."></asp:Label>
                    <br />
                    <br />
                    <asp:HyperLink ID="emailLink" runat="server" Text="Email" CssClass="btn btn-default submit" style="width: 100px; margin:auto;" NavigateUrl="resetPasswordEmail.aspx"></asp:HyperLink>

           <br />   
           </div>  
                     <asp:Label ID="sentLabel" runat="server" Text=""></asp:Label>
     </section>
             <a href="resetPassword.aspx">Go back</a>
</div>   </div></div> 
    </form>
</body>
</html>

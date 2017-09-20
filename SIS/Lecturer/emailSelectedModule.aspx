<%@ Page Language="C#" AutoEventWireup="true" CodeFile="emailSelectedModule.aspx.cs" Inherits="Lecturer_emailSelectedModule" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset='utf-8'/>
    <meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible'/>
    <title>SIS | Lecturer</title>
    <meta content='lab2023' name='author'/>
    <meta content='' name='description'/>
    <meta content='' name='keywords'/>
    <link href="../assets/stylesheets/application-a07755f5.css" rel="stylesheet" type="text/css" /><link href="//netdna.bootstrapcdn.com/font-awesome/3.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="../img/Q1.png"/>
    
</head>
<body class="main page">
    <form id="form1" runat="server">
    <!-- Navbar -->
     <div class='navbar navbar-default' id='navbar'>
      
      <a class='navbar-brand' href='#'>
            
            <img src="../img/Q1.png" height="27px" width="26px"/>
       Student Information Systems
      </a>
      <ul class='nav navbar-nav pull-right'>
        
       <li class='dropdown user'>
          <a class='dropdown-toggle' data-toggle='dropdown' href='#'>
            <i class='icon-user'></i>
           <asp:Label ID="username" runat="server" Text=""></asp:Label>
         
            <b class='caret'></b>
          </a>
          <ul class='dropdown-menu'>
            <li>
              <a href='#'>Edit Profile</a>
            </li>
              <li class='divider'></li>
            <li>
              <a href="Change_Password.aspx">Change Password</a>
            </li>
            <li class='divider'></li>
            <li>
              <a href="../Logout.aspx" onclick="return logoutconfirm();">Logout</a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
    <div id='wrapper'>
      <!-- Sidebar navigation -->
      <section id='sidebar'>
        <i class='icon-align-justify icon-large' id='toggle'></i>
        <ul id='dock'>
            <li class='launcher'>
            <i class='icon-dashboard'></i>
            <a href="lecturerdashboard.aspx">Dashboard</a>
          </li>
          <li class='launcher'>
            <i class='icon-file-text-alt'></i>
            <a href="viewmodule.aspx">Modules</a>
          </li>
          <li class='active launcher'>
            <i class='icon-envelope'></i>
            <a href="emailmodule.aspx">Email Group</a>
          </li>
          <li class='launcher dropdown hover'>
            <i class='icon-briefcase'></i>
              
            <a href='resultsmodule.aspx'>Results</a>
           
          </li>
         
        </ul>
        <div></div>
      </section>
      <!-- breadcrumb bar -->
      <section id='tools'>
        <ul class='breadcrumb' id='breadcrumb'>
          <li class='title'><a href="emailmodule.aspx">Email</a></li>
          <li class='active'><a href="#"> Email Students</a></li>
          
        </ul>
        <div id='toolbar'>
          <div class='btn-group'>
            <a>
              
            </a>
            <a>
             
            </a>
            <a>
            
             
            </a>
            <a>
              
            </a>
          </div>
         
         
        </div>
      </section>
      <!-- Main Content -->
      <div id='content'>
        <div class='panel panel-default'>
          <div class='panel-heading'>
            <i class='icon-beer icon-large'></i>
            Modules
              </div>
            <div class="panel-body">
     <!-- sql data source of single table to pull data from mylittleadmin--><!-- Session used as filtering parameter-->
           <asp:SqlDataSource ID="displaymodule" runat="server" 
         ConnectionString="<%$ ConnectionStrings:dbconnect %>" 
         SelectCommand="SELECT * FROM SIS_MODULES WHERE (SIS_MODULES.moduleID = @myid)">
         
         <SelectParameters>
             <asp:QueryStringParameter Name="myid" QueryStringField="moduleid" Type="Int32" />
         </SelectParameters>

        </asp:SqlDataSource>
              <!-- List view to display the content from db--><!-- Hyper link to pass module ID to next page-->
                 <asp:ListView ID="modules" runat="server" DataSourceID="displaymodule">
                    
                     <EmptyDataTemplate>
                         <span>No data was returned.</span>
                     </EmptyDataTemplate>
                    
                     <ItemTemplate>
                      <div class="row">
                      <div class="col-md-8">
                       <h1 class="page-header"><asp:Label ID="Label1" runat="server" Text='<%# Eval("moduleName") %>' /> 
                    
                </h1>
            </div>
                            
                        
                     <div class="col-md-8">
                <h4>Module Description</h4>
                
                
                         <asp:Label ID="descLabel" runat="server" Text='<%# Eval("moduleDescription") %>' />
                         <br />
                         <asp:HyperLink ID="HyperLink1" text="edit" ForeColor="Red" runat="server" NavigateUrl='<%# "editmodule.aspx?moduleid="+Eval("moduleID") %>'></asp:HyperLink>
                         <br />
                         
                        

                        </div>
                         <br />
                        <br /></div>

                        <div class="col-md-8">
                        </div>

                     </ItemTemplate>
                     
                </asp:ListView> 
              <br />
              <asp:Button ID="Sendemail" runat="server" CssClass="btn btn-primary" Text="Send a email to enrolled students" OnClick="sendemail_Click" /> 
             </div>
            </div>
          </div>
        </div>
      </div>
   
    <!-- Footer -->
    <!-- Javascripts -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js" type="text/javascript"></script><script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js" type="text/javascript"></script><script src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.6.2/modernizr.min.js" type="text/javascript"></script><script src="../assets/javascripts/application-985b892b.js" type="text/javascript"></script>
    <!-- Google Analytics -->
    <script>
        function logoutconfirm() {
            if (confirm('Are you sure you want to logout?')) {
                return true;
            } else {
                return false;
            }
        }</script>
    </form>
</body>
</html>

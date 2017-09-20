<%@ Page Language="C#" AutoEventWireup="true" CodeFile="resultsModule.aspx.cs" Inherits="Lecturer_resultsModule" %>


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
           <asp:Label ID="displayuser" runat="server" Text=""></asp:Label>
         
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
          <li class=' launcher'>
            <i class='icon-file-text-alt'></i>
            <a href="viewmodule.aspx">Modules</a>
          </li>
          <li class='launcher'>
            <i class='icon-envelope'></i>
            <a href="emailmodule.aspx">Email Group</a>
          </li>
          <li class='active launcher dropdown hover'>
            <i class='icon-briefcase'></i>
              
            <a href='resultsmodule.aspx'>Results</a>
            
          </li>
         
        </ul>
        <div></div>
      </section>
      <!-- breadcrumb bar -->
      <section id='tools'>
        <ul class='breadcrumb' id='breadcrumb'>
          <li class='title'><a href="resultsmodule.aspx">Results</a></li>
          <li class='active'><a href="#"> Submit Results</a></li>
          
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
            <div class=" panel-body">
              <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
     <!-- sql data source to join two tables, and pull data from mylittleadmin--><!-- Session used as filtering parameter-->
           <asp:SqlDataSource ID="displaymodule" runat="server" 
         ConnectionString="<%$ ConnectionStrings:dbconnect %>" 
         SelectCommand="SELECT * FROM SIS_MODULES INNER JOIN SIS_LECTURER ON SIS_MODULES.lecturerID = SIS_LECTURER.lecturerID WHERE SIS_LECTURER.userID = @myid">
               
               <SelectParameters>
             <asp:SessionParameter Name="myid" SessionField="userID" Type="Int32" />
         </SelectParameters>

     </asp:SqlDataSource>
        <!-- List view to display the content from db--><!-- Hyper link to pass module ID to next page-->
            <asp:ListView ID="modules" runat="server" DataSourceID="displaymodule">
      
                <ItemTemplate>
            
                <div class="list-group">
                            <asp:Label ID="Label3" runat="server" Text="Module Name:"></asp:Label>
                            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Black" NavigateUrl='<%# "resultsselectedModule.aspx?moduleid="+Eval("moduleID") %>'>
                                
                         <h4><asp:Label ID="modulename" runat="server" ForeColor="Black" class="list-group-item" Text='<%# Eval("moduleName") %>' /></h4></asp:HyperLink> 
                                
                             

                        </div>
                      
                     </ItemTemplate>
                </asp:ListView> 
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

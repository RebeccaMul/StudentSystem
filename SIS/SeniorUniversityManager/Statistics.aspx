<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Statistics.aspx.cs" Inherits="SENIORUNIVERSITYMANAGER_Statistics" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- Meta, title, CSS, favicons, etc. -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>SIS | Senior University Manager</title>

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
                                <h3>Senior University Manager</h3>
                                <ul class="nav side-menu">
                                    <li class="licurrent"><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                                    <li><a href="Lecturers.aspx"><i class="fa fa-group"></i>Lecturers</a></li>
                                    <li><a href="Statistics.aspx"><i class="fa fa-bar-chart-o"></i>Statistics</a></li>
                                    <li><a><i class="fa fa-folder"></i>Modules <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="viewModuleSUM.aspx">My Modules</a></li>
                                            <li><a href="searchModuleSUM.aspx">All Modules</a></li>
                                            <li><a href="degreeProgramSearch.aspx">Other Pathway</a></li>
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-group"></i>Students <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none;">
                                            <li><a href="StudentSUM.aspx">View Students</a></li>
                                            <li><a href="Student_Create.aspx">Create Student</a></li>
                                            <li><a href="Student_Timetable.aspx">View Timetable</a></li>


                                        </ul>
                                    </li>
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
            <div id="HTMLtoPDF">
 <div class="col-md-4 col-sm-12 col-xs-12">
            <div class="x_panel tile">
              <div class="x_title">
                <h4>Students</h4>
           <div class="clearfix"></div>
              </div>
              
                   <%-- Rebecca - List of all students--%>
                  <asp:SqlDataSource ID="allStudents" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_STUDENT"></asp:SqlDataSource>
                    
                  <asp:ListView ID="StudentList" runat="server" DataSourceID="allStudents"><ItemTemplate></ItemTemplate></asp:ListView>

               <%-- Rebecca - List of all students dropped out--%>
                  <asp:SqlDataSource ID="DroppedOut" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_STUDENT WHERE (SIS_STUDENT.droppedout = '1')"></asp:SqlDataSource>
                
                  <asp:ListView ID="DroppedOutStudents" runat="server" DataSourceID="DroppedOut"><ItemTemplate></ItemTemplate></asp:ListView>

             <%-- Rebecca - List of all students enrolled--%>
                  <asp:SqlDataSource ID="Enrolled" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_STUDENT WHERE (SIS_STUDENT.enrolled = '1')"></asp:SqlDataSource>
                    
                  <asp:ListView ID="EnrolledStudents" runat="server" DataSourceID="Enrolled"><ItemTemplate></ItemTemplate></asp:ListView>
                
              <%--Column 1:--%>
              <div style="position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 100%; height:100%">
              <div style="margin-left:15%;">
              <asp:label Font-Size="Medium" runat="server" Text="Students on record:" />
          <b><asp:Label ID="studentCount" runat="server" Text="Label" Font-Size="Medium" ForeColor="CadetBlue"></asp:Label></b><br /><br />

             <asp:label Font-Size="Medium" runat="server" Text="Students enrolled:" />
         <b><asp:Label ID="studentEnrolled" runat="server" Text="Label" Font-Size="Medium" ForeColor="CadetBlue"></asp:Label></b><br />

                  <br />
                    <asp:label Font-Size="Medium" runat="server" Text="Enrol Rate: " />
                    <asp:Label ID="enrolledRate" runat="server" Text="Label" Font-Size="Medium" Font-Bold="true"></asp:Label><br /><br />
                  
                <%-- Pie Chart 1 - Enrolled & not enrolled students:--%>
                  <asp:Chart ID="Chart1" runat="server" isValueShownAsLabel="true" Palette="Berry" Label="#PERCENT" Height="165px" Width="165px" style="margin-left:5%;">
                      <Series>
                          <asp:Series Name="Series1" ChartType="Pie"></asp:Series>
                      </Series>
                      <ChartAreas>
                          <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                      </ChartAreas>
                  </asp:Chart>
             
                  
                     </div>
                  </div>    
                 
              </div>
            </div>
          
        
            <div class="col-md-4 col-sm-12 col-xs-12">
            <div class="x_panel tile">
  
               <div class="x_title">
                <h4>Results</h4>
           <div class="clearfix"></div>
              </div>

              <div class="x_content">


                 <%--Column 2--%>
               <div style="position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 100%; height:100%">
            
             <%-- Rebecca - Datasources for Results passed and failed info--%>
              
               <asp:SqlDataSource ID="AllResults" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM [SIS_RESULTS]">
                   </asp:SqlDataSource>
            
               <asp:SqlDataSource ID="ResultsPassed" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM [SIS_RESULTS] WHERE ([pass/fail] = @pass)">
                  <SelectParameters>
                      <asp:Parameter DefaultValue="pass" Name="pass" Type="String"></asp:Parameter>
                  </SelectParameters>
              </asp:SqlDataSource>
         
             <asp:SqlDataSource ID="ResultsFailed" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM [SIS_RESULTS] WHERE ([pass/fail] = @fail)">
                  <SelectParameters>
                      <asp:Parameter DefaultValue="fail" Name="fail" Type="String"></asp:Parameter>
                  </SelectParameters>
              </asp:SqlDataSource>
                 

             <%-- Rebecca - Listview to display results: --%>
              <asp:ListView ID="results" runat="server" DataSourceID="AllResults">
                  <ItemTemplate></ItemTemplate>
              </asp:ListView>
              
                <asp:ListView ID="Passed" runat="server" DataSourceID="ResultsPassed">
                    <ItemTemplate>

                    </ItemTemplate>
                </asp:ListView>
            
                   <div style="margin-left:5%; margin-right:5%;">

                    <asp:label Font-Size="Medium" runat="server" Text="Pass Rate: " />
                   <asp:Label ID="passrate" runat="server" Text="Label" Font-Size="Medium"  Font-Bold="true"></asp:Label><br />

                   <b><asp:Label ID="pass" runat="server" Text="Label" Font-Size="Medium" ForeColor="SeaGreen"></asp:Label></b>
              
              <br /><br />
              
                   
                   <asp:ListView ID="Failed" runat="server" DataSourceID="ResultsFailed">
                       <ItemTemplate></ItemTemplate>
                   </asp:ListView>
               
                   <asp:label Font-Size="Medium" runat="server" Text="Fail Rate: " />
                    <asp:Label ID="failrate" runat="server" Text="Label" Font-Size="Medium"  Font-Bold="true"></asp:Label>
                   
                   <br /><b><asp:Label ID="fail" runat="server" Text="Label" Font-Size="Medium" ForeColor="DarkRed"></asp:Label></b><br />
              

                <%--   Chart 2 - Results chart (pass/fail)--%>
                 <asp:Chart ID="ResultsChart" runat="server" isValueShownAsLabel="true" Palette="SemiTransparent" Label="#PERCENT" Height="165px" Width="165px" style="margin-left:15%;">
                      <Series>
                          <asp:Series Name="Series1" ChartType="Pie"></asp:Series>
                      </Series>
                      <ChartAreas>
                          <asp:ChartArea Name="ChartArea1" ></asp:ChartArea>
                      </ChartAreas>
                  </asp:Chart>
               
               </div>
                   </div>
             
              </div>
            </div>
          </div>
          
                 
            <div class="col-md-4 col-sm-12 col-xs-12">
            <div class="x_panel tile">
              <div class="x_title">
                <h4>Rates</h4>
           <div class="clearfix"></div>
              </div>
              <div class="x_content">


                  <%--Column 3--%>
              <div style="position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 100%">
              <div style="margin-left:8%; margin-right:8%;">
               <asp:label Font-Size="Medium" runat="server" Text="Retention Rate: " />
                  
                  <asp:Label ID="retentionRate" runat="server" Text="Label" Font-Size="Medium" Font-Bold="true"></asp:Label><br />
                  <b><asp:Label ID="Retention" runat="server" Text="Label" Font-Size="Medium" ForeColor="DarkGray"></asp:Label></b> <br />
                  
               <br /> <asp:label Font-Size="Medium" runat="server" Text="Drop Out Rate: " /><asp:Label ID="PercentageDroppedOut" runat="server" Text="Label" Font-Size="Medium"  Font-Bold="true"></asp:Label><br />
                  <b><asp:Label ID="studentDropped" runat="server" Text="Label" Font-Size="Medium" ForeColor="Peru"></asp:Label></b><br /><br />
                      
             </div>
               <%--   Chart 3 - Drop out/retention chart--%>
                  
                  <asp:Chart ID="DropChart" runat="server" isValueShownAsLabel="true" Label="#PERCENT" Height="150px">
                      <Series>
                          <asp:Series Name="Series1" ChartType="Bar"></asp:Series>
                      </Series>
                      <ChartAreas>
                          <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                      </ChartAreas>
                  </asp:Chart>
                      
                  
                 </div> 
             
              </div>
            </div>
          </div>




            <div class="col-md-4 col-sm-12 col-xs-12">
            <div class="x_panel tile">
              <div class="x_title">
                <h4>Fees</h4>
              
             
           
              <%-- Rebecca - Datasources for Finance info--%>
               <asp:SqlDataSource ID="UnpaidFinance" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_Finance WHERE ([amountPaid] = '0')">
                 
               </asp:SqlDataSource>
              
              <asp:SqlDataSource ID="PaidFinance" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_Finance  WHERE ([feesOutstanding] = '0')"></asp:SqlDataSource>

              <asp:SqlDataSource ID="PaymentsFinance" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_Finance  WHERE ([feesOutstanding] > '0') AND ([feesOutstanding] < '9000')"></asp:SqlDataSource>

                <%--Column 4--%>
                
              <%-- Rebecca - Listviews to display data sources above: --%>
              <asp:ListView ID="unpaidlist" runat="server" DataSourceID="UnpaidFinance">
                  <ItemTemplate></ItemTemplate></asp:ListView>

              
               <asp:ListView ID="paidlist" runat="server" DataSourceID="PaidFinance">
                  <ItemTemplate></ItemTemplate></asp:ListView>

              <asp:ListView ID="paymentlist" runat="server" DataSourceID="PaymentsFinance">
                  <ItemTemplate></ItemTemplate></asp:ListView>


                 <div style="position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 100%">

                     <div style="margin-left:1%; margin-right:1%;">
                    <br />

                         <%-- Datasource for the amount of fees paid: --%>
                          <asp:SqlDataSource ID="AmountPaid" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SIS_Finance"></asp:SqlDataSource>
                         
                         <%-- Listview which will calculate the total amount of fees paid --%>
                    <asp:ListView ID="feecalc" runat="server" DataSourceID="AmountPaid">
                             <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text=' <%# Eval("amountPaid") %>'  Visible="false"></asp:Label>
                    <asp:Literal ID="feescount" runat="server" OnDataBinding="feescount_DataBinding" Visible="false"></asp:Literal>
                            </ItemTemplate>
                    </asp:ListView>
                  
                         <%-- Labels which display total fees paid --%>
                         <asp:Label ID="Pound" runat="server" Font-Size="Medium" Text="Fee Income Total: " ForeColor="#73879C"></asp:Label>
                         <b><asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="£" Font-Bold="true" ForeColor="#73879C"></asp:Label><asp:Label ID="TotalValue" runat="server" Font-Size="Medium" Font-Bold="true" ForeColor="#73879C"></asp:Label></b><br /><br />
                        

                         <asp:label Font-Size="Medium" runat="server" Text="Fees Unpaid: " ForeColor="#73879C"/>
               <asp:Label ID="feesunpaidrate" runat="server" Text="Label" Font-Size="Medium" ForeColor="#73879C"  Font-Bold="true"></asp:Label><br />
                         <b><asp:Label ID="feesunpaid" runat="server" Text="Label" Font-Size="Medium" ForeColor="RosyBrown"></asp:Label><br /></b>
              <br />

               <asp:label Font-Size="Medium" runat="server" Text="Fees Paid: " ForeColor="#73879C"/>
               <asp:Label ID="feespaidrate" runat="server" Text="Label" Font-Size="Medium" ForeColor="#73879C"  Font-Bold="true"></asp:Label><br />
                          <b><asp:Label ID="feespaid" runat="server" Text="Label" Font-Size="Medium" ForeColor="#B2839A"></asp:Label></b><br />
             <br />
              
                          <asp:label Font-Size="Medium" runat="server" Text="Payments Made: " ForeColor="#73879C"/>
               <asp:Label ID="paymentsrate" runat="server" Text="Label" Font-Size="Medium" ForeColor="#73879C"  Font-Bold="true"></asp:Label><br />
                          <b><asp:Label ID="paymade" runat="server" Text="Label" Font-Size="Medium" ForeColor="Tan"></asp:Label></b><br />

                          <%--   Chart 4 - finance chart--%>

                <asp:Chart ID="FinanceChart" runat="server" isValueShownAsLabel="true" Label="#PERCENT" Height="170px" Width="170px" style="margin-left:15%">
                      <Series>
                          <asp:Series Name="Series1" ChartType="Pie"></asp:Series>
                      </Series>
                      <ChartAreas>
                          <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                      </ChartAreas>
                  </asp:Chart>
                
                 </div>
                     </div>
                  </div>



             </div>
            </div>

              <div class="col-md-4 col-sm-12 col-xs-12">
            <div class="x_panel tile ">
              <div class="x_title">
                <h2>Progression</h2>
           <div class="clearfix"></div>
              </div>
              <div class="x_content">

                    <asp:SqlDataSource ID="firstyearsql" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' 
                        SelectCommand="SELECT DISTINCT * FROM SIS_STUDENT WHERE SIS_STUDENT.level = 1"></asp:SqlDataSource>

                       <asp:ListView ID="firstyearlist" runat="server" DataSourceID="firstyearsql"><ItemTemplate></ItemTemplate></asp:ListView>

                   <asp:SqlDataSource ID="secondyearsql" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' 
                        SelectCommand="SELECT * FROM SIS_STUDENT WHERE SIS_STUDENT.level = 2"></asp:SqlDataSource>

                       <asp:ListView ID="secondyearlist" runat="server" DataSourceID="secondyearsql"><ItemTemplate></ItemTemplate></asp:ListView>

                   <asp:SqlDataSource ID="thirdyearsql" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' 
                        SelectCommand="SELECT * FROM SIS_STUDENT WHERE SIS_STUDENT.level = 3"></asp:SqlDataSource>

                       <asp:ListView ID="thirdyearlist" runat="server" DataSourceID="thirdyearsql"><ItemTemplate></ItemTemplate></asp:ListView>

                  <%--Column 4--%>
              <div style="position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 100%">
              <div style="margin-left:5%; margin-right:5%;">
             
               <asp:label Font-Size="Medium" runat="server" Text="First Years: " />
                
                  <asp:Label ID="FirstCount" runat="server" Text="Label" Font-Size="Medium"  Font-Bold="true"></asp:Label><br />
                  <b><asp:Label ID="FirstPercent" runat="server" Text="Label" Font-Size="Medium" ForeColor="SlateGray"></asp:Label></b> <br />
                  
               <br /> <asp:label Font-Size="Medium" runat="server" Text="Second Years: " /><asp:Label ID="SecondCount" runat="server" Text="Label" Font-Size="Medium"  Font-Bold="true"></asp:Label><br />
                  <b><asp:Label ID="SecondPercent" runat="server" Text="Label" Font-Size="Medium" ForeColor="DarkSlateBlue"></asp:Label></b>
                  <br />
                   <br /> <asp:label Font-Size="Medium" runat="server" Text="Third Years: " /><asp:Label ID="ThirdCount" runat="server" Text="Label" Font-Size="Medium"  Font-Bold="true"></asp:Label><br />
                  <b><asp:Label ID="ThirdPercent" runat="server" Text="Label" Font-Size="Medium" ForeColor="Indigo"></asp:Label></b>
                      <br />
             </div>
                
               <%--   Chart 5 - progression chart--%>
                  <br />
                  <asp:Chart ID="ProgressChart" runat="server" isValueShownAsLabel="true" Label="#PERCENT" Height="170px" Width="170px" style="margin-left:15%">
                      <Series>
                          <asp:Series Name="Series1" ChartType="Pie"></asp:Series>
                      </Series>
                      <ChartAreas>
                          <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                      </ChartAreas>
                  </asp:Chart>
                      <br />
                 </div> 
     
              </div>
            </div>     
          </div>

                <!-- Final div for printing report -->
                <div class="col-md-4 col-sm-12 col-xs-12">
            <div class="x_panel tile ">
             
              <div class="x_content">

                  <%--Column 6--%>
              <div style="position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 100%">
              <div style="margin-left:5%; margin-right:5%;">
             <a href="#" class="btn btn-primary"  onclick="HTMLtoPDF()" style="margin-left:10%; margin-right:10%;">Generate Statistics Report</a>
              
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

  </div>

  <div id="custom_notifications" class="custom-notifications dsp_none">
    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
    </ul>
    <div class="clearfix"></div>
    <div id="notif-group" class="tabbed_notifications"></div>
  </div>

  <script src="../js/bootstrap.min.js"></script>

  <!-- gauge js -->
  <script type="text/javascript" src="../js/gauge/gauge.min.js"></script>
  <script type="text/javascript" src="../js/gauge/gauge_demo.js"></script>
  <!-- bootstrap progress js -->
  <script src="../js/progressbar/bootstrap-progressbar.min.js"></script>
  <script src="../js/nicescroll/jquery.nicescroll.min.js"></script>
  <!-- icheck -->
  <script src="../js/icheck/icheck.min.js"></script>
  <!-- daterangepicker -->
  <script type="text/javascript" src="../js/moment/moment.min.js"></script>
  <script type="text/javascript" src="../js/datepicker/daterangepicker.js"></script>
  <!-- chart js -->
  <script src="../js/chartjs/chart.min.js"></script>

  <script src="../js/custom.js"></script>

  <!-- flot js -->
  <!--[if lte IE 8]><script type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
  <script type="text/javascript" src="../js/flot/jquery.flot.js"></script>
  <script type="text/javascript" src="../js/flot/jquery.flot.pie.js"></script>
  <script type="text/javascript" src="../js/flot/jquery.flot.orderBars.js"></script>
  <script type="text/javascript" src="../js/flot/jquery.flot.time.min.js"></script>
  <script type="text/javascript" src="../js/flot/date.js"></script>
  <script type="text/javascript" src="../js/flot/jquery.flot.spline.js"></script>
  <script type="text/javascript" src="../js/flot/jquery.flot.stack.js"></script>
  <script type="text/javascript" src="../js/flot/curvedLines.js"></script>
  <script type="text/javascript" src="../js/flot/jquery.flot.resize.js"></script>
  <script>
      $(document).ready(function () {
          // [17, 74, 6, 39, 20, 85, 7]
          //[82, 23, 66, 9, 99, 6, 2]
          var data1 = [
            [gd(2012, 1, 1), 17],
            [gd(2012, 1, 2), 74],
            [gd(2012, 1, 3), 6],
            [gd(2012, 1, 4), 39],
            [gd(2012, 1, 5), 20],
            [gd(2012, 1, 6), 85],
            [gd(2012, 1, 7), 7]
          ];

          var data2 = [
            [gd(2012, 1, 1), 82],
            [gd(2012, 1, 2), 23],
            [gd(2012, 1, 3), 66],
            [gd(2012, 1, 4), 9],
            [gd(2012, 1, 5), 119],
            [gd(2012, 1, 6), 6],
            [gd(2012, 1, 7), 9]
          ];
          $("#canvas_dahs").length && $.plot($("#canvas_dahs"), [
            data1, data2
          ], {
              series: {
                  lines: {
                      show: false,
                      fill: true
                  },
                  splines: {
                      show: true,
                      tension: 0.4,
                      lineWidth: 1,
                      fill: 0.4
                  },
                  points: {
                      radius: 0,
                      show: true
                  },
                  shadowSize: 2
              },
              grid: {
                  verticalLines: true,
                  hoverable: true,
                  clickable: true,
                  tickColor: "#d5d5d5",
                  borderWidth: 1,
                  color: '#fff'
              },
              colors: ["rgba(38, 185, 154, 0.38)", "rgba(3, 88, 106, 0.38)"],
              xaxis: {
                  tickColor: "rgba(51, 51, 51, 0.06)",
                  mode: "time",
                  tickSize: [1, "day"],
                  //tickLength: 10,
                  axisLabel: "Date",
                  axisLabelUseCanvas: true,
                  axisLabelFontSizePixels: 12,
                  axisLabelFontFamily: 'Verdana, Arial',
                  axisLabelPadding: 10
                  //mode: "time", timeformat: "%m/%d/%y", minTickSize: [1, "day"]
              },
              yaxis: {
                  ticks: 8,
                  tickColor: "rgba(51, 51, 51, 0.06)",
              },
              tooltip: false
          });

          function gd(year, month, day) {
              return new Date(year, month - 1, day).getTime();
          }
      });
  </script>

  <!-- worldmap -->
  <script type="text/javascript" src="../js/maps/jquery-jvectormap-2.0.3.min.js"></script>
  <script type="text/javascript" src="../js/maps/gdp-data.js"></script>
  <script type="text/javascript" src="../js/maps/jquery-jvectormap-world-mill-en.js"></script>
  <script type="text/javascript" src="../js/maps/jquery-jvectormap-us-aea-en.js"></script>
  <!-- pace -->
  <script src="../js/pace/pace.min.js"></script>
  <script>
      $(function () {
          $('#world-map-gdp').vectorMap({
              map: 'world_mill_en',
              backgroundColor: 'transparent',
              zoomOnScroll: false,
              series: {
                  regions: [{
                      values: gdpData,
                      scale: ['#E6F2F0', '#149B7E'],
                      normalizeFunction: 'polynomial'
                  }]
              },
              onRegionTipShow: function (e, el, code) {
                  el.html(el.html() + ' (GDP - ' + gdpData[code] + ')');
              }
          });
      });
  </script>
  <!-- skycons -->
  <script src="../js/skycons/skycons.min.js"></script>
  <script>
      var icons = new Skycons({
          "color": "#73879C"
      }),
        list = [
          "clear-day", "clear-night", "partly-cloudy-day",
          "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
          "fog"
        ],
        i;

      for (i = list.length; i--;)
          icons.set(list[i], list[i]);

      icons.play();
  </script>

  <!-- dashbord linegraph -->
  <script>
      Chart.defaults.global.legend = {
          enabled: false
      };

      var data = {
          labels: [
            "Symbian",
            "Blackberry",
            "Other",
            "Android",
            "IOS"
          ],
          datasets: [{
              data: [15, 20, 30, 10, 30],
              backgroundColor: [
                "#BDC3C7",
                "#9B59B6",
                "#455C73",
                "#26B99A",
                "#3498DB"
              ],
              hoverBackgroundColor: [
                "#CFD4D8",
                "#B370CF",
                "#34495E",
                "#36CAAB",
                "#49A9EA"
              ]

          }]
      };

      var canvasDoughnut = new Chart(document.getElementById("canvas1"), {
          type: 'doughnut',
          tooltipFillColor: "rgba(51, 51, 51, 0.55)",
          data: data
      });
  </script>
  <!-- /dashbord linegraph -->
  <!-- datepicker -->
  <script type="text/javascript">
      $(document).ready(function () {

          var cb = function (start, end, label) {
              console.log(start.toISOString(), end.toISOString(), label);
              $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
              //alert("Callback has fired: [" + start.format('MMMM D, YYYY') + " to " + end.format('MMMM D, YYYY') + ", label = " + label + "]");
          }

          var optionSet1 = {
              startDate: moment().subtract(29, 'days'),
              endDate: moment(),
              minDate: '01/01/2012',
              maxDate: '12/31/2015',
              dateLimit: {
                  days: 60
              },
              showDropdowns: true,
              showWeekNumbers: true,
              timePicker: false,
              timePickerIncrement: 1,
              timePicker12Hour: true,
              ranges: {
                  'Today': [moment(), moment()],
                  'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                  'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                  'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                  'This Month': [moment().startOf('month'), moment().endOf('month')],
                  'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
              },
              opens: 'left',
              buttonClasses: ['btn btn-default'],
              applyClass: 'btn-small btn-primary',
              cancelClass: 'btn-small',
              format: 'MM/DD/YYYY',
              separator: ' to ',
              locale: {
                  applyLabel: 'Submit',
                  cancelLabel: 'Clear',
                  fromLabel: 'From',
                  toLabel: 'To',
                  customRangeLabel: 'Custom',
                  daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
                  monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                  firstDay: 1
              }
          };
          $('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
          $('#reportrange').daterangepicker(optionSet1, cb);
          $('#reportrange').on('show.daterangepicker', function () {
              console.log("show event fired");
          });
          $('#reportrange').on('hide.daterangepicker', function () {
              console.log("hide event fired");
          });
          $('#reportrange').on('apply.daterangepicker', function (ev, picker) {
              console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
          });
          $('#reportrange').on('cancel.daterangepicker', function (ev, picker) {
              console.log("cancel event fired");
          });
          $('#options1').click(function () {
              $('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
          });
          $('#options2').click(function () {
              $('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
          });
          $('#destroy').click(function () {
              $('#reportrange').data('daterangepicker').remove();
          });
      });
  </script>
  <script>
      NProgress.done();
  </script>
        <script src="../js/jspdf.js"></script>
        <script src="../js/jquery-2.1.3.js"></script>
        <script src="../js/pdfFromHTML.js"></script>
  <!-- /datepicker -->
  <!-- /footer content -->
        </form>
</body>

</html>

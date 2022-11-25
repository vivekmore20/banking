<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Bank Application</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!--js-->
<script src="js/jquery-2.1.1.min.js"></script> 
<!--icons-css-->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!--Google Fonts-->
<link href='//fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'>
<!--static chart-->
<script src="js/Chart.min.js"></script>
<!--//charts-->
<!-- geo chart -->
    <script src="//cdn.jsdelivr.net/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
    <script>window.modernizr || document.write('<script src="lib/modernizr/modernizr-custom.js"><\/script>')</script>
    <!--<script src="lib/html5shiv/html5shiv.js"></script>-->
     <!-- Chartinator  -->
    <script src="js/chartinator.js" ></script>
    <script type="text/javascript">
        jQuery(function ($) {

            var chart3 = $('#geoChart').chartinator({
                tableSel: '.geoChart',

                columns: [{role: 'tooltip', type: 'string'}],
         
                colIndexes: [2],
             
                rows: [
                    ['China - 2015'],
                    ['Colombia - 2015'],
                    ['France - 2015'],
                    ['Italy - 2015'],
                    ['Japan - 2015'],
                    ['Kazakhstan - 2015'],
                    ['Mexico - 2015'],
                    ['Poland - 2015'],
                    ['Russia - 2015'],
                    ['Spain - 2015'],
                    ['Tanzania - 2015'],
                    ['Turkey - 2015']],
              
                ignoreCol: [2],
              
                chartType: 'GeoChart',
              
                chartAspectRatio: 1.5,
             
                chartZoom: 1.75,
             
                chartOffset: [-12,0],
             
                chartOptions: {
                  
                    width: null,
                 
                    backgroundColor: '#fff',
                 
                    datalessRegionColor: '#F5F5F5',
               
                    region: 'world',
                  
                    resolution: 'countries',
                 
                    legend: 'none',

                    colorAxis: {
                       
                        colors: ['#679CCA', '#337AB7']
                    },
                    tooltip: {
                     
                        trigger: 'focus',

                        isHtml: true
                    }
                }

               
            });                       
        });
    </script>
<!--geo chart-->

<!--skycons-icons-->
<script src="js/skycons.js"></script>
<!--//skycons-icons-->
<link rel="stylesheet" href="css/tablestyle.css">

</style>
</head>
<body>

<div class="page-container">	
   <div class="left-content">
	   <div class="mother-grid-inner">
           
<!-- script-for sticky-nav -->
		
		<!-- /script-for sticky-nav -->
<!--inner block start here-->

</div>
<!--inner block end here-->
<!--copy rights start here-->
	
<!--COPY rights end here-->
</div>
</div>
<!--slider menu-->
    <div class="sidebar-menu">
		  	<div class="logo">  <a href="#"> <span id="logo" ></span> 
			      <!--<img id="logo" src="" alt="Logo"/>--> 
			  </a> </div>		  
		    <div class="menu">
		      <ul id="menu" >
		        <li id="menu-home" ><a href="index.html"><i class="fa fa-tachometer"></i><span>Dashboard</span></a></li>
		       		        <li id="menu-comunicacao" ><a href="deposit.html"><i class="fa fa-usd"></i><span>Deposit Money</span></a>
		          
		        </li>
		          <li><a href="withdraw.html"><i class="fa fa-usd"></i><span>Withdraw Money</span></a></li>
		        <li id="menu-academico" ><a href="transfer.html"><i class="fa fa-file-text"></i><span>Transfer Money</span></a>
					<li><a href="logout.html"><i class="fa fa-user"></i><span>Log Out</span></a></li>
		        </li>
		        <li><a href="details.jsp"><i class="fa fa-user"></i><span>Details</span></a></li>
		        
		        
		      
		      </ul>
		    </div>
	 </div>
	<div class="clearfix"> </div>
</div>
<!--slide bar menu end here-->

<!--scrolling js-->
		<script src="js/jquery.nicescroll.js"></script>
		<script src="js/scripts.js"></script>
		<!--//scrolling js-->
<script src="js/bootstrap.js"> </script>
<!-- mother grid end here-->
<%@ page import ="java.sql.*" %>
<%@ page import ="com.bankingSys.*" %>
<font size="10" color="blue" ><h3 style="background-color:black">ACCOUNT </h1>/font></h3></font>
 
</body>

<center>
<%
	Connection con=DbConnection.connect();
	PreparedStatement psmt=con.prepareStatement("select * from users  ");
//	psmt.setInt(1,Values.getAcc());
	ResultSet rs=psmt.executeQuery();
%>	

	<table>
	 		 <thead>
	 		 	
	 		   <tr>User Details</tr>
	 		   <tr>
	    	  	<th>AccNo </th>
	     	 	<th>Name	</th>
	      		<th>City	</th>
	    		<th>Balance	</th>
	    		</tr>
	  		</thead> 
	  		<tbody>
	<% while(rs.next()){%>
		
			<tr>
			<td><%= rs.getInt(1)%></td>
			<td><%= rs.getString(2)%></td>
			<td><%= rs.getString(3)%></td>
			<td><%= rs.getInt(4)%></td>
			</tr>		
		
		
	<%}%>
	</tbody>
	</table>
	</center>
</html>
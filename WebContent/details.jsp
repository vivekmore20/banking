<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/tablestyle.css">
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="com.bankingSys.*" %>

</body>

<%
	Connection con=DbConnection.connect();
	PreparedStatement psmt=con.prepareStatement("select * from users ");
//	psmt.setInt(1,Values.getAcc());
	ResultSet rs=psmt.executeQuery();
%>	

	<table>
	 		 <thead>
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
	
	
	
	
	
	

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
	<%@ page import ="java.sql.*" %>
	<%@ page import ="com.bankingSys.*" %>
	
</body>
<% 
		Connection con = DbConnection.connect();
		int accno=Integer.parseInt(request.getParameter("accno"));
		PreparedStatement psmt=con.prepareStatement("delete from users where AccNo=?");
		int i=psmt.executeUpdate();
		if(i>0){
			response.sendRedirect("viewtable.jsp");
		}else{
			response.sendRedirect("fail.html");
		}
	%>
		
<table> 
<tr>
	<td>Acc No </td>td>
	<td>Name </td>
	<td>City </td>
	<td>Balance</td>
</table>
</html>
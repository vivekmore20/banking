package com.bankingSys;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String name=request.getParameter("name");
		String city=request.getParameter("city");
		String uname=request.getParameter("uname");
		String pass=request.getParameter("psw");
		int acc=0,balance=0,accno=0;
		try {
			
			Connection con=DbConnection.connect();
			PreparedStatement psmt;
		
			psmt = con.prepareStatement("insert into users values(?,?,?,?)");
			psmt.setInt(1, 0);
			psmt.setString(2,name);
			psmt.setString(3,city);
			psmt.setInt(4, balance);
			int j=psmt.executeUpdate();
			
			PreparedStatement psmt2=con.prepareStatement("select * from users where name=? and city=?");
			psmt2.setString(1, name);
			psmt2.setString(2,city);
			ResultSet rs=psmt2.executeQuery();
			while(rs.next())
			{
//				accno=rs.getInt(1);
//				Values.setAcc(accno);
			}
			
			PreparedStatement psmt1 = con.prepareStatement("insert into login values(?,?,?)");
			psmt1.setInt(1, accno);
			psmt1.setString(2, uname);
			psmt1.setString(3, pass);
			int i=psmt1.executeUpdate();
			
			if(i>0 && j>0)
			{
			response.sendRedirect("sucess.html");
			}
			else{
			response.sendRedirect("fail.html");
			}
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}

}

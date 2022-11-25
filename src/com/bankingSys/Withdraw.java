package com.bankingSys;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Withdraw
 */
@WebServlet("/Withdraw")
public class Withdraw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Withdraw() {
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
		int amount=Integer.parseInt(request.getParameter("amount"));
		int acc=Values.getAcc();
		int balance=0;
		Connection con=DbConnection.connect();
		try {
		PreparedStatement psmt1=con.prepareStatement("select * from users where AccNo=?");
		psmt1.setInt(1,acc);
		ResultSet rs=psmt1.executeQuery();
		while(rs.next())
		{
			balance=rs.getInt(4);
		}
		
		if(amount<0){
			response.sendRedirect("fail.html");
		}else if(amount>balance){
			response.sendRedirect("fail.html");
		}
		
		else
		{
		
			PreparedStatement psmt=con.prepareStatement("update users set balance=(balance-?) where AccNo=?");
			psmt.setInt(1, amount);
			psmt.setInt(2,acc);
			int i = psmt.executeUpdate();
	
			if(i>0)
			{
				response.sendRedirect("dash.jsp");
				
			}
			else{
				response.sendRedirect("fail.html");
			}
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		
		}
	}
	



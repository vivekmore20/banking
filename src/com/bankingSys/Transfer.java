package com.bankingSys;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Transfer
 */
@WebServlet("/Transfer")
public class Transfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Transfer() {
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
		int raccno=Integer.parseInt(request.getParameter("raccno"));
		int acc=Values.getAcc();
		Connection con=DbConnection.connect();
		if(amount<0){
			response.sendRedirect("fail.html");
		}
		
		else{
		try {
			PreparedStatement psmt=con.prepareStatement("Update users set balance=(balance+?) where AccNo=?");
			psmt.setInt(1,amount);
			psmt.setInt(2, raccno);
			int i=psmt.executeUpdate();
			PreparedStatement psmt1=con.prepareStatement("update users set balance=(balance-?) where AccNo=?");
			psmt1.setInt(1, amount);
			psmt1.setInt(2,acc);
			int j = psmt1.executeUpdate();
	
			if(i>0 && j>0)
			{
				response.sendRedirect("dash.jsp");
				
			}
			else{
				response.sendRedirect("fail.html");
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}
	}

}

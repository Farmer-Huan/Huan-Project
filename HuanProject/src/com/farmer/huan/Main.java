package com.farmer.huan;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Main
 */
@WebServlet("/main.do")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Main() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		request.setCharacterEncoding("UTF-8");
		
		response.sendRedirect("/views/main.jsp");
		
//		RequestDispatcher dispatcher  = request.getRequestDispatcher("/views/main.jsp");
//		dispatcher.forward(request, response);
//		System.out.println("한글 테스트2");
//		
//		// java test
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			
//			Connection conn = null;
//	 	  	Statement stmt = null;
//	 	  	ResultSet rs = null;
//	 		
//	 	  	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
//	 	  	String id = "chandler";
//	 	  	String pw = "test1234";
// 	  	
// 	  		conn = DriverManager.getConnection(url, id, pw);
// 	 	  	stmt = conn.createStatement();
// 	 	  	String sql = "SELECT * FROM FH_TB_USER";
// 	 	  	rs = stmt.executeQuery(sql);
// 	 	  	while (rs.next()) {
// 	 	  		System.out.println(rs.getString(1));
// 	 	  	}
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			System.out.println(e.toString());
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			System.out.println(e.toString());
//		} catch (Exception e) {
//			System.out.println(e.toString());
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

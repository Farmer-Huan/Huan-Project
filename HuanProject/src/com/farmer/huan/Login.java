package com.farmer.huan;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 * Servlet implementation class Login
 */
@WebServlet("/views/login.jsp")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
//		HttpSession session = request.getSession();
//		
//		
//		String id = (String) request.getParameter("id");
//		String pw = (String) request.getParameter("pw");
//		
//		if(id.equals("test") && pw.equals("1234")) {
//			session.setAttribute("session_id", "test_session_1234");
//		} else {
//			session.setAttribute("session_id", "");
//		}
//		
//		response.sendRedirect("./main.jsp");
//		RequestDispatcher dispatcher  = request.getRequestDispatcher("/views/main.jsp");
//		dispatcher.forward(request, response);
	}

}

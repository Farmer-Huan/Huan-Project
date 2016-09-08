<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "com.farmer.huan.DBConfig" %>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int n = 0;
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String db_id = DBConfig.DB_ID;
	String db_pwd = DBConfig.DB_PW;
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, db_id, db_pwd);
		// where = 조건
		String strQuery = "delete from fh_tb_user " + 
							"where id = ?";
	
		pstmt = conn.prepareStatement(strQuery);
	
		pstmt.setString(1,id);
		
		n = pstmt.executeUpdate();

	} catch (SQLException sqle){
		out.println(sqle.getMessage());
	} finally {
		try {
			if (pstmt != null){
				pstmt.close();
			}
			if (conn != null){
				conn.close();
			}
		} catch (SQLException se){
			out.println(se.getMessage());
		}
	}
	response.sendRedirect("/views/manage/memberUpdate.jsp");
%>

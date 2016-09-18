<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.farmer.huan.DBConfig" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<p>login_proc test</p>
<%
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null;
  	Statement stmt = null;
  	ResultSet rs = null;
	
  	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
  	String db_id = DBConfig.DB_ID;
  	String db_pw = DBConfig.DB_PW;
  	

	conn = DriverManager.getConnection(url, db_id, db_pw);
  	stmt = conn.createStatement();
  	
  	String id = request.getParameter("id");
  	String pw = request.getParameter("pw");
  	
  	String sql = "SELECT * FROM FH_TB_USER WHERE ID='" + id + "'";
  	rs = stmt.executeQuery(sql);
  	if (rs.next()) {
  		if(id.equals(rs.getString("id")) && pw.equals(rs.getString("pwd"))) {
  			out.println("logon");
  			// 로그인성공
  			
  			HashMap<String, Object> session_map = new HashMap<String, Object>();
  			session_map.put("user_id", id);
  			session_map.put("s_getId", session.getId());
  			session_map.put("s_getCreationTime", session.getCreationTime());
  			session_map.put("s_getLastAccessedTime", session.getLastAccessedTime());
  			session_map.put("s_getMaxInactiveInterval", session.getMaxInactiveInterval());
  			session_map.put("s_isNew", session.isNew());
  			
  			session.setAttribute("session_map", session_map);
  			
  			response.sendRedirect("/views/main.jsp");
  			
  			//response.sendRedirect("/views/main.jsp");
  		} else {
  			// 비번 틀림 처리
  			out.println("password check");
  		}
  	} else {
  		//out.println("<script>alert('test.');</script>");
  		// 처리 안되는 문제 고민하기
  		response.sendRedirect("/views/main.jsp");
  	}
  	
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	out.println(e.toString());
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	out.println(e.toString());
} catch (Exception e) {
	out.println(e.toString());
}
%>

</body>
</html>
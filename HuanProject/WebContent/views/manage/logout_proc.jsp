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
<p>logout_proc test</p>
<%

	session.removeAttribute("session_map");
	session.invalidate();
	response.sendRedirect("/views/main.jsp");
	
%>

</body>
</html>
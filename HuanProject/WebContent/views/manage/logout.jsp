<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import = "java.util.*" %>
<%
	HttpSession se = request.getSession();
	se.invalidate();
%>
<script>
	alert("로그아웃에 성공하였습니다.");
	location.replace = "/";
</script>

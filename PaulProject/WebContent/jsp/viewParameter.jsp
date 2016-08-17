<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<b>request.getParameter() 메소드 사용</b><br></br>
	name 파라미터 = <%= request.getParameter("name") %> <br></br>
	address 파라미터 = <%= request.getParameter("address") %> <br></br>
	<br></br>
	<br>------------</br>
	<%
		String test = request.getParameter("name");
		test = new String(test.getBytes("8859_1"), "UTF-8");
		
	 %>
	 <%= test %>
	<br>--------------</br>
	<b>request.getParameterValues() 메소드 사용</b><br></br>
	<%
		String[] values = request.getParameterValues("pet");
		if (values != null){
			for (int i = 0; i < values.length; i++){
	%>
	
	<%= values[i] %>
	
	<%
			}
		}
	%>
	<br></br><br></br>
	<b>request.getParameterNames() 메소드 사용</b><br></br>
	<%
		Enumeration enumData = request.getParameterNames();
		while(enumData.hasMoreElements()){
			String name = (String)enumData.nextElement();
	%>
		<%= name %>
		<%
		}		
	%>
	
	<br></br><br></br>
	
	<b>request.getParameterMap() 메소드 사용</b><br></br>
	<%
		Map parameterMap = request.getParameterMap();
		String[] nameParam = (String[])parameterMap.get("name");
		if(nameParam != null){
	%>
	name = <%= nameParam[0] %>
	
	<%		
		}
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.farmer.huan.DBConfig" %>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String uid = "",
				upwd = "";
	
	if(request.getParameter("uid") != null && request.getParameter("upwd") != null){
		uid = request.getParameter("uid");
		upwd = request.getParameter("upwd");
	}
	
	StringBuffer udquery = new StringBuffer();
	udquery.append(" select");
	udquery.append(				" decode(pwd, '"+ upwd + "', 'Y', 'N') result");
	udquery.append(" from");
	udquery.append(				" fh_tb_user");
	udquery.append(" where");
	udquery.append(				" 1=1");
	udquery.append(" and");
	udquery.append(				" id = '" + uid + "'");

	try{
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",DBConfig.DB_ID,DBConfig.DB_PW);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(udquery.toString());
		
		String result ="";
		
		if(rs != null){
			while(rs.next()){
				result = rs.getString("result");
			}
		}
		
		String message = "";
		
		if(result.equals("")){
			message = "아이디가 틀렸습니다";
		}else{
			if(result.equals("Y")){
				HttpSession se = request.getSession();
				Map<String, Object> session_map = new HashMap<String, Object>();
				session_map.put("user_id", uid);
				se.setAttribute("session_map", session_map);
				message = uid + " 님 환영합니다.";
				
				
			}else{
				message = "비밀번호가 틀렸습니다";
			}
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" type = "text/css" href = "/css/layout.css">
<title>Project BARISTA - Login STD</title>
</head>
<body>


	<div class="wrap">
		<div class="header">
			<div>
				<div class="huanImg">
					<img src="/img/FamHuan.png" />
				</div>
			</div>
			<div class="topMenu">
				<ul class="top_nav">
					<li><a href="/views/main.jsp">메인</a></li>
					<li><a href="/">커피가이드</a></li>
					<li><a href="/views/board/free/free.jsp">게시판</a></li>
					<li><a href="/views/manage/login.jsp">회원</a></li>
				</ul>
			</div>
		</div>
		<div class="contentWrap">
			<div class="listWrap">
				<div class="left">
					<ul>
						<li><a href="/">홈</a></li>
						<li><a href="#">커피가이드</a></li>
						<li><a href="/views/board/free/free.jsp">게시판</a></li>
						<li><a href="/views/manage/login.jsp">회원관리</a></li>
					</ul>
				</div>
				<div class="content">
					<div class="contentNav">게시판 &gt; QnA</div>
					<div class = "ft12">
						<br><br>
						<%=message%>
						</br><br><br>
					</div>
					<input type = "button" value = "back to LoginTest" onclick = "location.href='/views/board/qna/loginSTD.jsp'">
				</div>
			</div>
		</div>
		<div class="footer"><span>copy right</span></div>
	</div>
	
	
	<%
		}catch(SQLException e){
			System.out.println(e);
		}catch(Exception e){
			System.out.println(e);
		}finally{
			if(rs != null){
				try{rs.close();}
				catch(SQLException e){}
			}if(stmt != null){
				try{stmt.close();}
				catch(SQLException e){}
			}if(conn != null){
				try{conn.close();}
				catch(SQLException e){}
			}
		}
	%>
</body>
</html>
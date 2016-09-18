<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.farmer.huan.DBConfig" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html lang = "ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="Generator" content="EditPlus®">
	<meta name="Author" content="">
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<!-- <link rel="stylesheet" href="/WEB-INF/css/layout.css" /> -->
	<link rel="stylesheet" type="text/css" href="/css/layout.css" />
	<!-- <link rel="text/css" href="<c:url value='/WEB-INF/css/layout.css'/>" /> -->
	<script type="text/javascript" src="/js/main.js"></script>
	
	<title>HuanProject</title>
</head>
<body>

	<!--  Path : //getServletContext().getRealPath("/")  </h3> -->
		
	<%
		if(session.getAttribute("session_map") != null) {
			out.println("session_map #############");
			HashMap<String, Object> session_map = (HashMap<String, Object>) session.getAttribute("session_map");
			if (session_map.containsKey("user_id")) {
				out.println(session_map.get("user_id") + " 님 로그인 중.");				
			}
			
			if ((Boolean) session_map.get("s_isNew")) {
				out.println("test1");
			} else {
				out.println("test2");
			}
		}
	%>

	<div class="wrap">
			<div class="header">
				<div class="top_header">
					<div class="login">
						<form method="post" action="/views/manage/login_proc.jsp">
							<textblock>아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</textblock>
						 	<input id="login_id" name="id" type="text" value="" placeholder="id" /> <br/>
						 	<textblock>비밀번호&nbsp;&nbsp;</textblock>
						 	<input id="login_pw" name="pw" type="password" value="" placeholder="password" /> <br/>
						 	<p>
							 	<input type="submit" name="login" value="로그인" />&nbsp;&nbsp;&nbsp;
							 	<form method="post" action="/views/manage/logout_proc.jsp"> 
							 		<input type="submit" name="logout" value="로그아웃" />
						 		</form>
						 	</p>
					 	</form>
					</div>
					<div class="huanImg">
						<img src="/img/FamHuan.png" />
					</div>
				</div>
				<div class="topMenu">
					<ul class="top_nav">
						<li><a href="/views/main.jsp">홈으로</a></li>
						<li><a href="/views/board/notice/notice.jsp">공지사항</a></li>
						<li><a href="/views/board/free/free.jsp">자유게시판</a></li>
						<li><a href="/views/board/guestbook/guestbook.jsp">방명록</a></li>
					</ul>
				</div>
			</div>
			<div class="contentWrap">
				<div class="listWrap">
					<div class="left">
						<ul>
							<li><a href="/views/main.jsp">홈으로</a></li>
							<li><a href="/views/board/notice/notice.jsp">공지사항</a></li>
							<li><a href="/views/board/free/free.jsp">자유게시판</a></li>
							<li><a href="/views/board/guestbook/guestbook.jsp">방명록</a></li>
						</ul>
					</div>
					<div class="content">
						<h1 style="font-size: 25px !important;">메인 페이지 <br />
						</h1>
					</div>
				</div>
			</div>
			<div class="footer"><span>copy right</span></div>
		</div>

</body>
</html>
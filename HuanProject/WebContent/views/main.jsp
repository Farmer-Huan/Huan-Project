<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.farmer.huan.DBConfig" %>
<%@ page import = "java.sql.*" %>
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
		//Object session_id = session.getAttribute("session_id");
		//String sid = (String) session_id;
		//if(sid == "" || sid == null) {
		//	out.println("session null");
		//} else {
		//	out.println("session_id: " + session_id);
		//}
	%>

	<div class="wrap">
			<div class="header">
				<div class="top_header">
					<div class="login">
						<form method="post" action="/views/manage/login.jsp">
							<textblock>아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</textblock>
						 	<input id="login_id" name="id" type="text" value="" placeholder="id" /> <br/>
						 	<textblock>비밀번호&nbsp;&nbsp;</textblock>
						 	<input id="login_pw" name="pw" type="text" value="" placeholder="password" /> <br/>
						 	<p>
							 	<input type="submit" name="login" value="로그인" />&nbsp;&nbsp;&nbsp; 
							 	<input type="submit" name="join" value="회원가입" />
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
						<h1 style="font-size: 25px !important;">메인 페이지</h1>
					</div>
				</div>
			</div>
			<div class="footer"><span>copy right</span></div>
		</div>

</body>
</html>
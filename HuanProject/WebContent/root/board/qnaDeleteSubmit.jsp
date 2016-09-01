<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String idx = request.getParameter("qno");
	int idx2 = Integer.parseInt(idx);
	String delquery = "delete from fh_tb_qna where idx=" + idx2;
	
	try{
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","paul","3159");
		stmt = conn.createStatement();
		rs = stmt.executeQuery(delquery);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" type = "text/css" href = "../../css/layout.css">
<title>Project BARISTA - QnA</title>
</head>
<body>



	<div id="test" width="500px">
		<!--  Path : //getServletContext().getRealPath("/")  </h3> -->
		<p>
			<form method="post" action="../../views/login.jsp">
				<textblock>아이디:</textblock>
			 	<input id="login_id" name="id" type="text" value="" /> <br/>
			 	<textblock>비밀번호:</textblock>
			 	<input id="login_pw" name="pw" type="text" value="" /> <br/>
			 	<input type="submit" value="로그인" />
		 	</form>
			<%
				Object session_id = session.getAttribute("session_id");
				String sid = (String) session_id;
				if(sid == "" || sid == null) {
					out.println("session null");
				} else {
					out.println("session_id: " + session_id);
				}
			%>
			</p>
	 	<p></p>
	 	<input type="button" value="regist.jsp" onclick="location.href='../../views/regist.jsp'"/>
	 	<input type="button" value="memberlist.jsp" onclick="location.href='../../views/memberlist.jsp'"/>
	 	<input type="button" value="insert.jsp" onclick="location.href='../../views/insert.jsp'"/>
	 	<p></p>
	 	
	</div>
	<div class="wrap">
		<div class="header">
			<div>
				<div class="huanImg">
					<div class="login">
						<div>
							<a href="#">로그인</a> | 
							<a href="#">회원가입</a>
						</div>
					</div>
					<img src="../../img/FamHuan.png" />
				</div>
			</div>
			<div class="topMenu">
				<ul class="top_nav">
					<li><a href="#">메인</a></li>
					<li><a href="#">게시판</a></li>
					<li><a href="#">커피가이드</a></li>
					<li><a href="#">회원</a></li>
				</ul>
			</div>
		</div>
		<div class="contentWrap">
			<div class="listWrap">
				<div class="left">
					<ul>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">게시판</a></li>
						<li><a href="http://localhost:8080/HuanProject/root/board/qna.jsp">QnA</a></li>
						<li><a href="http://localhost:8080/HuanProject/root/board/guestbook.jsp">방명록</a></li>
					</ul>
				</div>
				<div class="content">
					<div class="contentNav">게시판 &gt; QnA</div>
					<div class="list">
						<input type = "button" value = "삭제하였습니다.(여기에 제발 글씨만 넣어보고 싶다 개죤니씨뽤ㄹㅓㅁ쟈ㅐㄷ거쟏ㅁ섣쟈ㅐ헞ㅁ댜ㅐ헏쟈ㅐ헞댜ㅐ헞대ㅑㅎ!!)">
						<div>
							<input type = "button" value = "back to LIST" onclick = "location.href='./qna.jsp'">
						</div>
					</div>
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
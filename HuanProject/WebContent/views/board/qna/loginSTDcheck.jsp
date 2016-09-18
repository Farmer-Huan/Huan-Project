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
	ResultSet rs2 = null;
	
	String dbID = DBConfig.DB_ID;
	String dbPW = DBConfig.DB_PW;

	String uid = "",
				upwd = "";
	if(request.getParameter("uid") != null && request.getParameter("upwd") != null){
		uid = request.getParameter("uid");
		upwd = request.getParameter("upwd");
	}
	try{
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",dbID,dbPW);
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from fh_tb_user");
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
					<li><a href="/views/board/free/free.jsp">게시판</a></li>
					<li><a href="#">커피가이드</a></li>
					<li><a href="/views/manage/login.jsp">회원</a></li>
				</ul>
			</div>
		</div>
		<div class="contentWrap">
			<div class="listWrap">
				<div class="left">
					<ul>
						<li><a href="/views/board/notice/notice.jsp">공지사항</a></li>
						<li><a href="/views/board/free/free.jsp">게시판</a></li>
						<li><a href="/views/board/qna/qna.jsp">QnA</a></li>
						<li><a href="/views/board/guestbook/guestbook.jsp">방명록</a></li>
					</ul>
				</div>
				<div class="content">
					<div class="contentNav">게시판 &gt; QnA</div>
					<div class = "ft12">
						<br><br>
						<%
							int count = 0;
							List<Object> userdb = new ArrayList<Object>();
							if(rs != null){
								while(rs.next()){
									userdb.add(rs.getString("id"));
								}
								if(userdb.contains(uid) == true){
									String qy = "select * from fh_tb_user where id='" + uid + "'";
									rs2 = stmt.executeQuery(qy);
									if(rs2 != null){
										while(rs2.next()){
											if(rs2.getString("pwd").equals(upwd)){
												session.setAttribute("session_id", uid);
												session.setAttribute("session_pwd", upwd);
												%>성공!<%
											}else{
												%>비밀번호 틀림!<%
											}
										}
									}//rs2 end if
								}else{
									%>없는 아이디인데?<%
								}
							}
						%>
						</br><br><br>
					</div>
					<input type = "button" value = "BACK TO LoginTest" onclick = "location.href='/views/board/qna/loginSTD.jsp'">
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
			if(rs2 != null){
				try{rs2.close();}
				catch(SQLException e){}
			}if(rs != null){
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
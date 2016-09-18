<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.farmer.huan.DBConfig" %>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String idx = "",
				id = "";
	
	String dbID = DBConfig.DB_ID;
	String dbPW = DBConfig.DB_PW;
	
	id = request.getParameter("id");
	
	idx = request.getParameter("qno");
	int idx2 = Integer.parseInt(idx);
	String delquery = "delete from fh_tb_qna where idx=" + idx2;
	
	try{
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",dbID,dbPW);
		stmt = conn.createStatement();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" type = "text/css" href = "/css/layout.css">
<title>Project BARISTA - QnA</title>
</head>
<body>

	
	<div class="wrap">
		<div class="header">
			<div>
				<div class="huanImg">
					<div class="login">
						<div>
							<!-- -------------------------로그인/로그아웃 경로 완성되면 수정할 것------------------------- -->
							<%
								Object session_id = session.getAttribute("session_id");
								String sid = (String) session_id;
								
								if(sid == "" || sid == null) {
							%>
							<a href="/views/board/qna/loginSTD.jsp">로그인</a> | 
							<a href="/views/manage/regist.jsp">회원가입</a>
							<%
								}else{
							%>
							<%=sid%>님 환영합니다. | <a href="/views/board/qna/loginSTDout.jsp">로그아웃</a>
							<%
								}
							%>
							<!-- -------------------------------------------------------------------------------------- -->
						</div>
					</div>
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
					<div class="list">
						<div class="ft12">
						<%
						if(id.equals(sid)){
							rs = stmt.executeQuery(delquery);
						%>
						삭제하였습니다.
						<%
						} else{
						%>
						본인만 가능합니다.
						<%
						}
						%>
						</div>
						<div>
							<input type = "button" value = "back to LIST" onclick = "location.href='/views/board/qna/qna.jsp'">
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
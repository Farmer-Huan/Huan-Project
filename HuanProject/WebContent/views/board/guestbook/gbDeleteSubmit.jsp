<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.farmer.huan.DBConfig" %>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String idx = "";
	String pwd = "";
	
	String sid = "";
	HttpSession se = request.getSession();
	Map<String, Object> user = (Map<String, Object>)se.getAttribute("session_map");
	
	if(user != null){
		sid = (String)user.get("user_id");
	}
	
	if(request.getParameter("idx") != null){
		idx = request.getParameter("idx");
	}
	
	if(request.getParameter("pwd") != null){
		pwd = request.getParameter("pwd");
	}
	
	String gdpwd = "";
	
	if(request.getParameter("gdpwd") != null){
		gdpwd = request.getParameter("gdpwd");
	}

	StringBuffer gdquery = new StringBuffer();
	gdquery.append(" delete");
	gdquery.append(" from");
	gdquery.append(				" fh_tb_guestbook");
	gdquery.append(" where");
	gdquery.append(				" idx = " + idx);
	
	int shownum = 0;
	String message = "";
	try{
		if(idx == "" | idx == null){
			message = "글이 없습니다.";
		}else if(gdpwd.equals(pwd) == false){
			shownum = 1;
			message = "비밀번호가 틀렸습니다.";
		}else{
			conn = DriverManager.getConnection("jdb:oracle:thin:@localhost:1521:orcl",DBConfig.DB_ID,DBConfig.DB_PW);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(gdquery.toString());
			message = "삭제하였습니다.";
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" type = "text/css" href = "/css/layout.css">
<title>Project BARISTA - Guestbook</title>
</head>
<body>

	
	<div class="wrap">
		<div class="header">
			<div>
				<div class="huanImg">
					<div class="login">
					<img src="/img/FamHuan.png" />
						<div>
							<!-- -------------------------로그인/로그아웃 경로 완성되면 수정할 것------------------------- -->
							<%
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
				</div>
			</div>
			<div class="topMenu">
				<ul class="top_nav">
					<li><a href="/">홈</a></li>
					<li><a href="#">커피가이드</a></li>
					<li><a href="/views/board/free/free.jsp">게시판</a></li>
					<li><a href="/views/manage/login.jsp">회원관리</a></li>
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
					<div class="contentNav">게시판 &gt; Guestbook</div>
					<div class="list">
						<div class="ft12">
							<%=message %>
						</div>
						<div>
						<%
							if(shownum == 1){
						%>
							<input type = "button" value = "back to DELETE" onclick = "location.href='/views/board/guestbook/gbDelete.jsp?gno=<%=idx%>'">
						<%
							}else{
						%>
							<input type = "button" value = "back to LIST" onclick = "location.href='/views/board/guestbook/guestbook.jsp'">
						<%
							}
						%>
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
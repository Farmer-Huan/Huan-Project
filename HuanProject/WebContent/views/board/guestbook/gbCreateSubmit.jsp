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
	String id = "";
	String pwd = "";
	String title = "";
	String content = "";
	
	String sid = "";
	HttpSession se = request.getSession();
	Map<String, Object> user = (Map<String, Object>)se.getAttribute("user");
	
	if(user != null){
		sid = (String)user.get("id");
	}
	
	request.setCharacterEncoding("UTF-8");
	
	if(request.getParameter("id") != null){
		id = request.getParameter("id");
	}
	
	if(request.getParameter("pwd") != null){
		pwd = request.getParameter("pwd");
	}
	
	if(request.getParameter("title") != null){
		title = request.getParameter("title");
	}
	
	if(request.getParameter("content") != null){
		content = request.getParameter("content");
	}
	
	StringBuffer gcquery = new StringBuffer();
	gcquery.append(" insert into");
	gcquery.append(				" fh_tb_guestbook(");
	gcquery.append(												" idx");
	gcquery.append(												" , id");
	gcquery.append(												" , pwd");
	gcquery.append(												" , title");
	gcquery.append(												" , content");
	gcquery.append(												" , regdate)");
	gcquery.append(" values(");
	gcquery.append(				" guestbook_seq.nextval");
	gcquery.append(				" , '" + id + "'");
	gcquery.append(				" , '" + pwd + "'");
	gcquery.append(				" , '" + title + "'");
	gcquery.append(				" , '" + content + "'");
	gcquery.append(				" , sysdate)");
	               
	String message = "";
	int shownum = 0;
	try{
		if(id == "" | id == null){
			message = "이름을 입력해주세요.";
		}else if(title == "" | title == null){
			message = "제목을 입력해주세요.";
		}else if(content == "" | content == null){
			message = "내용을 입력해주세요.";
		}else if(pwd == "" | pwd == null){
			message = "비밀번호를 입력해주세요.";
		}else{
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",DBConfig.DB_ID,DBConfig.DB_PW);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(gcquery.toString());
			message = "작성하였습니다.";
			shownum = 1;
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
					<div class="contentNav">게시판 &gt; Guestbook</div>
					<div class="list">
						<div class="ft12">
							<%=message %>
						</div>
						<div>
							<%
								if(shownum == 1){
							%>
							<input type = "button" value = "back to LIST" onclick = "location.href='/views/board/guestbook/guestbook.jsp'">
							<%
								}else{
							%>
							<input type = "button" value = "back to CREATE" onclick = "history.back(); return false;">
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
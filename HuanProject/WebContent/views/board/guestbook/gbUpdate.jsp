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
	String id = "";
	String pwd = "";
	String title = "";
	String content = "";
	String regdate = "";
	
	String sid = "";
	HttpSession se = request.getSession();
	Map<String, Object> user = (Map<String, Object>)se.getAttribute("session_map");
	
	if(user != null){
		sid = (String)user.get("user_id");
	}
	
	if(request.getParameter("gno") != null){
		idx = request.getParameter("gno");
	}
	
	String readpwd = "";
	
	if(request.getParameter("readpwd") != null){
		readpwd = request.getParameter("readpwd");
	}
	
	StringBuffer guquery = new StringBuffer();
	guquery.append(" select");
	guquery.append(				" *");
	guquery.append(" from");
	guquery.append(				" fh_tb_guestbook");
	guquery.append(" where");
	guquery.append(				" 1=1");
	guquery.append(" and");
	guquery.append(				" idx = " + idx);
	
	int shownum = 0;
	String message = "";
	try{
		if(idx == "" | idx == null){
			message = "글이 없습니다.";
		}else{
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",DBConfig.DB_ID,DBConfig.DB_PW);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(guquery.toString());
			shownum = 1;
			
			if(rs != null){
				while(rs.next()){
					id = rs.getString("id");
					pwd = rs.getString("pwd");
					title = rs.getString("title");
					content = rs.getString("content");
				}
				
				if(readpwd.equals(pwd) == false){
					shownum = 2;
					message = "비밀번호가 틀렸습니다.";
				}
			}
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" type = "text/css" href ="/css/layout.css">
<title>Project BARISTA - Guestbook</title>
</head>
<body>

	
	<div class="wrap">
		<div class="header">
			<div>
				<div class="huanImg">
					<img src="/img/FamHuan.png" />
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
					<%
						if(shownum == 1){
					%>
					<div class="list">
						<form method = "post" name = "gbupdate" action = "/views/board/guestbook/gbUpdateSubmit.jsp">
							<table>
								<colgroup>
									<col width="80px" />
									<col width="*" />
									<col width="80px" />
									<col width="200px" />
								</colgroup>
								<thead>
									<tr>
										<th>수정</th>
										<th></th>
									</tr>
								</thead>
								<input type = "hidden" name = "idx" value = "<%=idx%>">
								<input type = "hidden" name = "pwd" value = "<%=pwd%>">
								<tbody>
									<tr>
										<td>이름</td>
										<td class = "tl pl5"><input type = "text" name = "id" value = "<%=id%>"></td>
									</tr>
									<tr>
										<td>제목</td>
										<td class = "tl pl5"><input type = "text" name = "title" value = "<%=title%>"></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea name = "content" cols = "100" rows = "10"><%=content%></textarea></td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td class = "tl pl5"><input type = "password" name = "guppwd"></td>
									</tbody>
							</table>
							<div class = "ft12">
								<br>
								* 이름은 변경 가능합니다.<br>
								* 비밀번호는 작성 시 입력한 비밀번호를 입력해주세요.<br>
								<br>
								<input type = "submit" value = "SUBMIT">
								<input type = "button" value = "CANCEL" onclick = "location.href='/views/board/guestbook/guestbook.jsp'">
							</div>
						</form>
					</div>
					<%
						}else if(shownum == 2){
					%>
					<div class="list">
						<div class = "ft12">
							<%=message %>
						</div>
						<div>
							<input type = "button" value = "BACK" onclick = "location.href = '/views/board/guestbook/gbRead.jsp?gno=<%=idx %>'">
						</div>
					</div>
					<%
						}else{
					%>
					<div class="list">
						<div class = "ft12">
							<%=message %>
						</div>
						<div>
							<input type = "button" value = "BACK to Guestbook" onclick = "location.href = '/views/board/guestbook/guestbook.jsp'">
						</div>
					</div>
					<%
						}
					%>
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
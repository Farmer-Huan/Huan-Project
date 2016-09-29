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
	
	int gpn = 1;
	if(request.getParameter("rno") != null){
		gpn = Integer.parseInt(request.getParameter("rno"));
		if(gpn%10 != 0){
			gpn = gpn/10 +1;
		}else{
			gpn = gpn/10;
		}
	}
	
	StringBuffer grquery = new StringBuffer();
	grquery.append(" select");
	grquery.append(				" *");
	grquery.append("  from");
	grquery.append(				" fh_tb_guestbook");
	grquery.append(" where");
	grquery.append(				" 1=1");
	grquery.append(" and");
	grquery.append(				" idx = " + idx);
	
	int shownum = 0;
	String message = "";
	try{
		if(idx == "" | idx == null){
			message = "글이 없습니다.";
		}else{
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",DBConfig.DB_ID,DBConfig.DB_PW);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(grquery.toString());
			shownum = 1;
			
			if(rs != null){
				while(rs.next()){
					idx = rs.getString("idx");
					title = rs.getString("title");
					id = rs.getString("id");
					content = rs.getString("content");
					regdate = rs.getString("regdate");
				}
			}
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
						<table>
							<colgroup>
								<col width="80px" />
								<col width="*" />
								<col width="80px" />
								<col width="200px" />
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><%=idx%></td>
									<td class="tl pl5"><%=title%></td>
									<td><%=id%></td>
									<td><%=regdate%></td>
								</tr>
								<tr>
									<td colspan="4"><textarea cols="100" rows="10" readonly><%=content%></textarea></td>
								</tr>
								</tbody>
						</table>
						<div class = "ft12">
							<form method = "post" name = "gbread" action = "/views/board/guestbook/gbUpdate.jsp?gno=<%=idx%>">
								수정하려면 비밀번호를 입력하세요.<br>
								<input type = "password" name ="readpwd" value = ""> 
								<input type = "submit" value = "UPDATE">
							</form>
							<input type = "button" value = "DELETE" onclick = "location.href='/views/board/guestbook/gbDelete.jsp?gno=<%=idx%>'">
							<input type = "button" value = "BACK" onclick = "location.href='/views/board/guestbook/guestbook.jsp?gpn=<%=gpn%>'">
						</div>
					</div>
					<%
						}else{
					%>
					<div class="list">
						<div class="ft12">
							<%=message %>
						</div>
						<div>
							<input type = "button" value = "back to LIST" onclick = "location.href='/views/board/guestbook/guestbook.jsp'">
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
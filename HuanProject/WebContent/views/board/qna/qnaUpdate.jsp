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
	Map<String, Object> user = (Map<String, Object>)se.getAttribute("user");
	
	if(user != null){
		sid = (String)user.get("id");
	}
	
	if(request.getParameter("qno") != null){
		idx = request.getParameter("qno");
	}
	
	StringBuffer upquery = new StringBuffer();
	upquery.append(" select");
	upquery.append(				" *");
	upquery.append(" from");
	upquery.append(				" fh_tb_qna");
	upquery.append(" where");
	upquery.append(				" 1=1");
	upquery.append(" and");
	upquery.append(				" idx = " + idx);

	String message = "";
	int shownum = 0;
	try{
		if(idx =="" | idx == null){
			message = "글이 없습니다.";
		}else{
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",DBConfig.DB_ID,DBConfig.DB_PW);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(upquery.toString());
			shownum = 1;
			
			if(rs != null){
				while(rs.next()){
					id = rs.getString("id");
					title = rs.getString("title");
					content = rs.getString("content");
				}
				if(sid.equals(id) == false){
					shownum = 0;
					message = "작성한 본인만 가능합니다.";
				}
			}
		}
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
					<%
						if(shownum == 1){
					%>
					<div class="list">
						<form method = "post" name = "qnaupdate" action = "http://localhost:8080/views/board/qna/qnaUpdateSubmit.jsp">
							<table>
								<colgroup>
									<col width="80px" />
									<col width="*" />
								</colgroup>
								<thead>
									<tr>
										<th colspan = "2">수정</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>제목</td>
										<td class="tl pl5"><input type = "text" name = "title" value = "<%=title%>"></td>
									</tr>
									<tr>
										<td>내용</td>
										<td colspan="4"><textarea name = "content" cols = "100" rows = "10"><%=content%></textarea></td>
									</tr>
									<input type = "hidden" name = "id" value = "<%= id %>">
									<input type = "hidden" name = "idx" value ="<%=idx%>">
								</tbody>
							</table>
							<div>
								<input type = "submit" value = "SUBMIT">
								<input type = "button" value = "CANCEL" onclick = "location.href='/views/board/qna/qnaRead.jsp?qno=<%=idx%>'">
							</div>
						</form>
					</div>
					<%
						}else{
					%>
					<div class="list">
						<div class="ft12">
							<%=message %>
						</div>
						<div>
							<input type = "button" value = "CANCEL" onclick = "location.href='/views/board/qna/qnaRead.jsp?qno=<%=idx%>'">
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
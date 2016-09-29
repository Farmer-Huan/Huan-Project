<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%
	int shownum = 0;
	String sid = "";
	String spwd = "";
	HttpSession se = request.getSession();
	Map<String, Object> user = (Map<String, Object>)se.getAttribute("session_map");
	
	if(user != null){
		shownum = 1;
		sid = (String)user.get("user_id");
	}	
%>
<!DOCTYPE html PUBLIC "-/W3C/DTD HTML 4.01 Transitional/EN" "http:/www.w3.org/TR/html4/loose.dtd">
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
					<div class="contentNav">게시판 &gt; QnA</div>
					<%
						if(shownum == 1){
					%>
					<div class="list">
						<form method = "post" name = "qnacreate" action ="/views/board/qna/qnaCreateSubmit.jsp">
							<table>
								<colgroup>
									<col width="80px" />
									<col width="*" />
								</colgroup>
								<thead>
									<tr>
										<th colspan = "2">글쓰기</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>제목</td>
										<td class = "tl pl5"><input type = "text" name = "title"></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea name = "content" cols = "100" rows = "10" placeholder = "내용을 입력하세요."></textarea></td>
									</tr>
								</tbody>
							</table>
							<div>
								<input type = "hidden" name = "id" value = "<%= sid %>">
								<input type = "submit" value = "SUBMIT">
								<input type = "button" value = "CANCEL" onclick = "location.href='/views/board/qna/qna.jsp'">
							</div>
						</form>
					</div>
					<%
						} else{
					%>
					<div class="list">
						<div class = "ft12">
							로그인하세요.
						</div>
						<div>
							<input type = "button" value = "CANCEL" onclick = "location.href='/views/board/qna/qna.jsp'">
						</div>
					</div>
					
					<%
						}
					%>
				</div>
			</div>
			<div class="footer"><span>copy right</span></div>
		</div>
	</div>


</body>
</html>
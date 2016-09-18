<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<div class="contentNav">게시판 &gt; Guestbook</div>
					<div class="list">
						
						<form method = "post" name = "gbcreate" action ="/views/board/guestbook/gbCreateSubmit.jsp">
							<table>
								<colgroup>
									<col width="80px" />
									<col width="*" />
									<col width="80px" />
									<col width="80px" />
								</colgroup>
								<thead>
									<tr>
										<th>글쓰기</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>이름</td>
										<td class = "tl pl5"><input type = "text" name = "id"></td>
									</tr>
									<tr>
										<td>제목</td>
										<td class = "tl pl5"><input type = "text" name = "title"></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea name = "content" cols = "100" rows = "10" placeholder = "내용을 입력하세요."></textarea></td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td class = "tl pl5"><input type = "password" name = "pwd"></td>
									</tr>

								</tbody>
							</table>
							<div>
								<input type = "submit" value = "SUBMIT">
								<input type = "button" value = "CANCEL" onclick = "location.href='/views/board/guestbook/guestbook.jsp'">
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</div>
		<div class="footer"><span>copy right</span></div>
	</div>



</body>
</html>
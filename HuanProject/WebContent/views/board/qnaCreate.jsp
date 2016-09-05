<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-/W3C/DTD HTML 4.01 Transitional/EN" "http:/www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" type = "text/css" href = "/css/layout.css">
<title>Project BARISTA - QnA</title>
</head>
<body>

	
	
	<div id="test" width="500px">
		<!--  Path : /getServletContext().getRealPath("/")  </h3> -->
		<p>
			<%
				Object session_id = session.getAttribute("session_id");
				Object session_pw = session.getAttribute("session_pw");
				String sid = (String) session_id;
				String spw = (String) session_pw;
				
				if(sid == "" || sid == null) {
			%>
			<form method="post" action="/views/manage/login.jsp">
				<textblock>아이디:</textblock>
			 	<input id="login_id" name="id" type="text" value="" /> <br/>
			 	<textblock>비밀번호:</textblock>
			 	<input id="login_pw" name="pw" type="text" value="" /> <br/>
			 	<input type="submit" value="로그인" />
		 	</form>
			<%
				} else {
			%>
			<div class="ft12">
				<%=session_id %>님 하이헬로안녕?<br>
				네 비밀번호는 <%=session_pw %> 란다. 기억하니?<br>
				<input type="button" value = "LOGOUT인 척 메인으로 가기" onclick = "location.href='/'"/>
			</div>
			<%
				}
			%>
			</p>
	 	<p></p>
	 	<input type="button" value="regist.jsp" onclick="location.href='/views/manage/regist.jsp'"/>
	 	<input type="button" value="memberlist.jsp" onclick="location.href='/views/manage/memberlist.jsp'"/>
	 	<input type="button" value="insert.jsp" onclick="location.href='/views/manage/insert.jsp'"/>
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
					<img src="/img/FamHuan.png" />
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
						<li><a href="/views/board/qna.jsp">QnA</a></li>
						<li><a href="/views/board/guestbook.jsp">방명록</a></li>
					</ul>
				</div>
				<div class="content">
					<div class="contentNav">게시판 &gt; QnA</div>
					<div class="list">
						
						<form method = "post" name = "qnacreate" action ="/root/board/qnaCreateSubmit.jsp">
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
										<td>제목</td>
										<td><input type = "text" name = "title"></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><input type = "text" name = "content"></td>
									</tr>

								</tbody>
							</table>
							<div>
								<input type = "submit" value = "SUBMIT">
								<input type = "button" value = "CANCEL" onclick = "location.href='/views/board/qna.jsp'">
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
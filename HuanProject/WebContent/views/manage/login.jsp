<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!doctype html>
<% request.setCharacterEncoding("utf-8"); %>
<html lang="ko">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>
  <link rel="stylesheet" href="/css/layout.css" />
  <script type="text/javascript">
  	function procLogin(){
  		var frm = document.logForm;
  		frm.action = "/views/manage/memberList.jsp";
  		frm.submit();
  	}
  </script>
 </head>
 <body>
	<div class="wrap">
		<div class="header">
			<div>
				<div class="huanImg">
					<img src="/img/FamHuan.png" />
					<div class="login">
						<div>
							<a href="/">메인화면</a> | 
							<a href="/views/manage/regist.jsp">회원가입</a>
						</div>
					</div>
				</div>
			</div>
			<div class="topMenu">
				<ul class="top_nav">
					<li><a href="/">메인화면</a></li>
					<li><a href="/views/board/notice/notice.jsp">게시판</a></li>
					<li><a href="#">메뉴3</a></li>
					<li><a href="#">메뉴4</a></li>
				</ul>
			</div>
		</div>
		<div class="contentWrap">
			<div class="listWrap">
				<div class="left">
					<ul>
						<li><a href="/views/manage/login.jsp">로   그   인</a></li>
						<li><a href="/views/manage/regist.jsp">회 원 가 입</a></li>
						<li><a href="/views/manage/memberList.jsp">회 원 목 록</a></li>
						<li><a href="/views/manage/update.jsp">회원정보수정</a></li>
						<li><a href="/views/manage/delete.jsp">회 원 탈 퇴</a></li>
						<li><a href="/views/manage/memberUpdate.jsp">회 원 관 리</a></li>
					</ul>
				</div>
				<div class="content">
					<div class="contentNav">회원관리 &gt; 로그인</div>
					<div class="list">
						<form action = "#" method = "post" name = "logForm">
							<table>
								<colgroup>
									<col width="80px" />
									<col width="*" />
									<col width="80px" />
									<col width="80px" />
								</colgroup>
								<thead>
								</thead>
								<tbody>
									<tr>
										<th>아이디</th>
										<td><input type="text" name = "id" id = "id"/></td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><input type="password" name = "pwd" id = "pwd"/></td>
									</tr>
								</tbody>
							</table>
						</form>
						<div class = "btn">
							<a href = "javascript:procLogin();" class = "btn_g">로그인</a>
							<a href = "/views/manage/regist.jsp" class = "btn_g">회원가입</a>
						</div>
						<div class="paging">
						</div>
					</div>
				</div>
				<!-- .wrap .contentWrap .listWrap .content . -->
			</div>
		</div>
		<div class="footer"><span>copy right</span></div>
	</div>
 </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import = "java.util.*" %>
<%
	/* 
		- 세션관리 -
		 1. 로그인할 때의 값을 가지고 세션 생성
		 	HttpSession se = request.getSession();
		 2. 생성된 세션을 불러오기 위해 Map Collection 선언
		 	Map<String, Object> logMap;
		 3. HttpSession 클래스에 저장되어 있는 logMap 데이터를 Map으로 형변환 하여 다시 대입 
		 	logMap = (Map<String, Object>) se.getAttribute("logMap");
		 4. 만약 logMap에 데이터가 들어가 있다면 sid에 logMap에 있는 key값인 "id"를 String 자료형으로 형변환 하여 대입
		 	if(logMap != null){ sid = (String) logMap.get("id"); }
		
	*/
	String sid = "";
	HttpSession se = request.getSession();
	Map<String, Object> logMap = (Map<String, Object>) se.getAttribute("logMap");

	if (logMap != null) {
		sid = (String) logMap.get("id");
	}
%>
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
	// loginOK 페이지로 logForm 데이터를 넘김
  	function procLogin(){
  		var frm = document.logForm;
  		frm.action = "/views/manage/loginOK.jsp";
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
							<%
								// String형의 sid에 null값이거나 ""의 값을 가질 경우
								if(sid == "" || sid == null){
							%>
							<a href="/">메인화면</a> | 
							<a href="/views/manage/regist.jsp">회원가입</a>
							<%
								} else {
							%>
								<%= sid  %>님 | 
								<a href = "/views/manage/logout.jsp">로그아웃</a>
							<%
								}
							%>
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

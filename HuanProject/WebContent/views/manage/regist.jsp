<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>
  <link rel="stylesheet" href="/css/layout.css" />
 <script>
	function onValidation(){
		var regForm = document.regForm;
		if(regForm.id.value == ""){
			alert("아이디를 입력하세요.");
			regForm.id.focus();
			return;
		}
		if (regForm.id.length < 2 || regForm.id.length > 12){
  			alert("아이디를 2자 이상 12자 이하 입력해주세요.");
  			return;
  		}
		if(regForm.pwd.value == ""){
			alert("비밀번호를 입력하세요.");
			regForm.pwd.focus();
			return;
		}
		if (regForm.pwd.length < 4 || regForm.pwd.length > 8){
  			alert ("비밀번호 4 ~ 8자까지 입력해 주세요.");
  			regForm.pwd.focus();
  			return;
  		}
		if (regForm.pwd.value != regForm.pwd_check.value){
  			alert("비밀번호가 다릅니다.");
  			return;
  		}
		regForm.action = "/views/manage/insert.jsp";
		regForm.submit();
	}
	
	function next(){
		var regForm = document.regForm;
		regForm.action = "/views/manage/login.jsp";
		regForm.submit();
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
							<a href="/views/manage/login.jsp">로그인</a>
						</div>
					</div>
				</div>
			</div>
			<div class="topMenu">
				<ul class="top_nav">
					<li><a href="/views/manage/memberList.jsp">회원관리</a></li>
					<li><a href="/views/board/notice/notice.jsp">게시판</a></li>
					<li><a href="#">메뉴3</a></li>
					<li><a href="#">메뉴4</a></li>
				</ul>
			</div>
		</div>
		<!-- header end -->
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
				<!-- contentWrap - left end -->
				<div class="content">
					<div class="contentNav">회원관리 &gt; 회원가입 &gt; 등록</div>
					<div class="regist">
						<form method = "post" name = "regForm" id = "regForm" action = "">
							<table>
								<colgroup>
									<col width="100px" />
									<col width="*" />
								</colgroup>
								<tbody>
									<tr>
										<th>아이디</th>
										<td><input type="text" name = "id" id = "id"/></td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><input type="password" name = "pwd" id = "pwd"/></td>
									</tr>
									<tr>
										<th>비밀번호 확인</th>
										<td><input type="password" name = "pwd_check" id = "pwd_check"/></td>
									</tr>
									<tr>
										<th>전화번호</th>
										<td><input type="text" name = "phone" id = "phone" /></td>
									</tr>
									<tr>
										<th>이메일</th>
										<td><input type="text" name = "email" id = "email" /></td>
									</tr>
								</tbody>
							</table>
						</form>
						<div class="btn">
							<a href="/views/manage/memberList.jsp" class="btn_g">목록</a>
							<a href="javascript:onValidation();" class="btn_g">등록</a>
						</div>
					</div>
					<!-- regist end -->
				</div>
				<!-- contentWrap - content end -->
			</div>
			<!-- contentWrap - listWrap end -->
		</div>
		<!-- contentWrap end -->
		<div class="footer"><span>copy right</span></div>
	</div>
</body>
</html>

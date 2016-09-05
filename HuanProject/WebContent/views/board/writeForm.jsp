<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
 </head>
 <body>
 <script type="text/javascript">
 	function writeSave(){
 		if(document.writeForm.writer.value == ""){
 			alert("작성자를 입력하세요.");
 			document.writeForm.writer.focus();
 			return false;
 		}
 		if (document.writeForm.subject.value == ""){
 			alert("제목을 입력하세요.");
 			document.writeForm.subject.focus();
 			return false;
 		}
 		if (document.writeForm.pwd.value == ""){
 			alert("비밀번호를 입력하세요.");
 			document.writeForm.pwd.focus();
 			return false;
 		}
 		writeForm.submit();
 	}
 </script>
	<div class="wrap">
		<div class="header">
			<div>
				<div class="huanImg">
					<img src="/img/FamHuan.png" />
					<div class="login">
						<div>
							<a href="/views/manage/login.jsp">로그인</a> | 
							<a href="/views/manage/regist.jsp">회원가입</a>
						</div>
					</div>
				</div>
			</div>
			<div class="topMenu">
				<ul class="top_nav">
					<li><a href="/views/manage/memberList.jsp">회원관리</a></li>
					<li><a href="/views/board/notice.jsp">게시판</a></li>
					<li><a href="#">메뉴3</a></li>
					<li><a href="#">메뉴4</a></li>
				</ul>
			</div>
		</div>
		<div class="contentWrap">
			<div class="listWrap">
				<div class="left">
					<ul>
						<li><a href="/views/board/writeList.jsp">전체 글 보기</a></li>
						<li><a href="/views/board/notice.jsp">공지사항</a></li>
						<li><a href="/views/board/free.jsp">자유게시판</a></li>
						<li><a href="/views/board/qna.jsp">묻고답하기</a></li>
						<li><a href="/views/board/guestbook.jsp">방명록</a></li>
					</ul>
				</div>
				<div class="content">
					<div class="contentNav">게시판 &gt; 공지사항 </div>
					<div class="list">
						<form method = "post" name = "writeForm" action = "/views/board/writeFormProc.jsp">
							<table>
								<colgroup>
									<col width="80px" />
									<col width="*" />
									<col width="80px" />
									<col width="80px" />
								</colgroup>
								<thead>
									<!-- 글쓰기는 하나로 통일 -->
									<!-- 공지사항, 자유게시판, 묻고 답하기, 방명록을 선택   -->
									<tr>
										<td>공지사항 :
										<input type = "radio" name = "notice" value = "notice"/></td>
									</tr>
									<tr>
										<td>자유게시판 :
										<input type = "radio" name = "free" value = "free"/></td>
									</tr>
									<tr>	
										<td>묻고답하기 :
										<input type = "radio" name = "qna" value = "qna"/></td>
									</tr>
									<tr>	
										<td>방명록 :
										<input type = "radio" name = "notice" value = "notice"/></td>
									</tr>
								</thead>
								<!-- 아이디 로그인 이후 아이디는 자동 등록 -->
								<tbody>
									<tr>
										<td> 등록자 : 
										<%-- <%= writer %> --%>
										</td>
										<td> <input type = "text" size = "12" maxlength ="12" name = "writer"/></td>
									</tr>
									<tr>
										<td> 비밀번호 : </td>
										<td> <input type = "password" size = "10" maxlength = "10" name = "pwd" /></td>
									</tr>
									<tr>
										<td> 제  목 : </td>
										<td> <input type = "text" size = "50" maxlength = "50" name = "subject"/></td>
									</tr>
									<tr>
										<td> 내  용 : </td>
										<td> <textarea rows = "20" cols = "100%" name = "content" ></textarea>
									</tr>
									
								</tbody>
							</table>
						</form>
						<div class = "btn">
							<a href = "javascript:writeSave();" class = "btn_g">글 등록</a>
							<a href = "#" class = "btn_g">다시작성</a>
							<a href = "/views/board/boardList.jsp" class = "btn_g">글 목록</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer"><span>copy right</span></div>
	</div>
 </body>
</html>

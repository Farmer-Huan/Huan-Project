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
						<table>
							<colgroup>
								<col width="80px" />
								<col width="*" />
								<col width="80px" />
								<col width="80px" />
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
									<td>3</td>
									<td class="tl pl5"><a href="#">몰라</a></td>
									<td>test</td>
									<td>2016.08.09</td>
								</tr>
								<tr>
									<td>2</td>
									<td class="tl pl5"><a href="#">몰라</a></td>
									<td>test</td>
									<td>2016.08.09</td>
								</tr>
								<tr>
									<td>1</td>
									<td class="tl pl5"><a href="#">몰라</a></td>
									<td>test</td>
									<td>2016.08.09</td>
								</tr>
							</tbody>
						</table>

						<div class="paging">
							<a href="#" class="prev"><img src="/img/btn_prev.gif" /></a>
							<strong><span>1</span></strong>
							<a href="#"><span>2</span></a>
							<a href="#"><span>3</span></a>
							<a href="#"><span>4</span></a>
							<a href="#"><span>5</span></a>
							<a href="#" class="next"><img src="/img/btn_next.gif" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer"><span>copy right</span></div>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<!-- <link rel="stylesheet" href="./WEB-INF/css/layout.css" /> -->
<link rel="stylesheet" href="../css/layout.css" />
<!-- <link rel="text/css" href="<c:url value='/WEB-INF/css/layout.css'/>" /> -->
<script type="text/javascript" src="/js/main.js"></script>

<title>HuanProject</title>
</head>
<body>

<div id="test">
	<h3> Path : <%= getServletContext().getRealPath("/") %> </h3>
 	<input type="text" value="test1234" />
 	<input type="button" value="test1234" onclick="Test_01()"/>
</div>
	<div class="wrap">
			<div class="header">
				<div>
					<div class="huanImg">
						<img src="../img/FamHuan.png" />
						<div class="login">
							<div>
								<a href="#">로그인</a> | 
								<a href="#">회원가입</a>
							</div>
						</div>
					</div>
				</div>
				<div class="topMenu">
					<ul class="top_nav">
						<li><a href="#">메뉴1</a></li>
						<li><a href="#">메뉴2</a></li>
						<li><a href="#">메뉴3</a></li>
						<li><a href="#">메뉴4</a></li>
					</ul>
				</div>
			</div>
			<div class="contentWrap">
				<div class="listWrap">
					<div class="left">
						<ul>
							<li><a href="#">메뉴1-1</a></li>
							<li><a href="#">메뉴1-2</a></li>
							<li><a href="#">메뉴1-3</a></li>
							<li><a href="#">메뉴1-4</a></li>
						</ul>
					</div>
					<div class="content">
						<div class="contentNav">메뉴1 &gt; 메뉴1-1</div>
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
										<td>10</td>
										<td class="tl pl5"><a href="#">몰라</a></td>
										<td>test</td>
										<td>2016.08.09</td>
									</tr>
									<tr>
										<td>9</td>
										<td class="tl pl5"><a href="#">몰라</a></td>
										<td>test</td>
										<td>2016.08.09</td>
									</tr>
									<tr>
										<td>8</td>
										<td class="tl pl5"><a href="#">몰라</a></td>
										<td>test</td>
										<td>2016.08.09</td>
									</tr>
									<tr>
										<td>7</td>
										<td class="tl pl5"><a href="#">몰라</a></td>
										<td>test</td>
										<td>2016.08.09</td>
									</tr>
									<tr>
										<td>6</td>
										<td class="tl pl5"><a href="#">몰라</a></td>
										<td>test</td>
										<td>2016.08.09</td>
									</tr>
									<tr>
										<td>5</td>
										<td class="tl pl5"><a href="#">몰라</a></td>
										<td>test</td>
										<td>2016.08.09</td>
									</tr>
									<tr>
										<td>4</td>
										<td class="tl pl5"><a href="#">몰라</a></td>
										<td>test</td>
										<td>2016.08.09</td>
									</tr>
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
								<a href="#" class="prev"><img src="./btn_prev.gif" /></a>
								<strong><span>1</span></strong>
								<a href="#"><span>2</span></a>
								<a href="#"><span>3</span></a>
								<a href="#"><span>4</span></a>
								<a href="#"><span>5</span></a>
								<a href="#" class="next"><img src="./btn_next.gif" /></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer"><span>copy right</span></div>
		</div>

</body>
</html>
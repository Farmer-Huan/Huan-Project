<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>
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
		<!--  -->
		<div class="contentWrap">
			<div class="listWrap">
				<div class="left">
					<ul>
						<li><a href="/views/manage/login.jsp">로 그 인</a></li>
						<li><a href="/views/manage/memberList.jsp">회원목록</a></li>
						<li><a href="/views/manage/update.jsp">회원정보수정</a></li>
						<li><a href="#">메뉴1-4</a></li>
					</ul>
				</div>
				<!--  contentWrap - listWrap end -->
				<div class="content">
					<div class="contentNav">회원관리 &gt; 회원정보 &gt; 수정</div>
					<div class="regist">
						<%
							request.setCharacterEncoding("utf-8");
							
							String id = request.getParameter("id");
							
							Connection conn = null;
							PreparedStatement pstmt = null;
							ResultSet rs = null;
							
							String driver = "oracle.jdbc.OracleDriver";
							String url = "jdbc:oracle:thin:@localhost:1521:orcl";
							String db_id = "kslsr";
							String db_pwd = "1234";
							
							try {
								Class.forName(driver);
								conn = DriverManager.getConnection(url, db_id, db_pwd);
								// where = 조건
								String strQuery = "select * from fh_tb_user " + 
													"where id = ?";
							
								pstmt = conn.prepareStatement(strQuery);
							
								pstmt.setString(1,id);
								rs = pstmt.executeQuery();
								// 오류 발생 rs.getString(""); 전에 
								// while 이나 if 로 rs.next() 해줘야 함
							
								while (rs.next()){
							
									String pwd = rs.getString("pwd");
									String phone = rs.getString("phone");
									String email = rs.getString("email");
									Timestamp regdate = rs.getTimestamp("regdate");
						%>
						<form method = "post" name = "upForm" id = "upForm" action = "/views/manage/updateOK.jsp">
							<table>
								<colgroup>
									<col width="100px" />
									<col width="*" />
								</colgroup>
								<tbody>
									<tr>
										<th>아이디</th>
										<td><%= id %><input type="hidden" name = "id" value = "<%= id %>" /></td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><input type="password" name = "pwd" value = "<%= pwd %>" /></td>
									</tr>
									<tr>
										<th>비밀번호 확인</th>
										<td><input type="password" name = "pwd_check" value ="<%= pwd %>"/></td>
									</tr>
									<tr>
										<th>전화번호</th>
										<td><input type="text" name = "phone" value = "<%= phone %>" /></td>
									</tr>
									<tr>
										<th>이메일</th>
										<td><input type="text" name = "email" value = "<%= email %>" /></td>
									</tr>
									<tr>
										<th>등록일</th>
										<td><%= regdate %></td>
									</tr>
								</tbody>
							</table>
						</form>
						
						<%
								}
							} catch (SQLException sqle){
								out.println(sqle.getMessage());
							} finally {
								try {
									if (rs != null){
										rs.close();
									}
									if (pstmt != null){
										pstmt.close();
									}
									if (conn != null){
										conn.close();
									}
								} catch (SQLException se){
									out.println(se.getMessage());
								}
							}
						%>
						<div class = "btn">
							<a href = "javascript:upForm.submit();">저장</a>
							<a href = "/views/manage/memberList.jsp">회원목록</a>
						</div>
						<script>	
							function update(){
								document.upForm.submit();
							}
							function list(){
								location.href = "/views/manage/memberList.jsp";
							}
						</script>
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
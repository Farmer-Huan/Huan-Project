<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!doctype html>
<%@ page import = "java.sql.*" %>
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
					<li><a href="/views/notice/notice.jsp">게시판</a></li>
					<li><a href="#">메뉴3</a></li>
					<li><a href="#">메뉴4</a></li>
				</ul>
			</div>
		</div>
		<div class="contentWrap">
			<div class="listWrap">
				<div class="left">
					<ul>
						<li><a href="/views/notice/writeList.jsp">전체 글 보기</a></li>
						<li><a href="/views/notice/notice.jsp">공지사항</a></li>
						<li><a href="/views/free/free.jsp">자유게시판</a></li>
						<li><a href="/views/qna/qna.jsp">묻고답하기</a></li>
						<li><a href="/views/guestbook/guestbook.jsp">방명록</a></li>
					</ul>
				</div>
				<div class="content">
					<div class="contentNav">게시판 &gt; 공지사항 </div>
					<div class="list">
						<form method = "post" name = "writeForm" action = "/views/notice/writeFormProc.jsp">
							<table>
								<colgroup>
									<col width="80px" />
									<col width="*" />
									<col width="80px" />
									<col width="80px" />
								</colgroup>
								<thead>
									<tr>
										<th>글번호</th>
										<th>제목</th>
										<th>글쓴이</th>
										<th>등록일</th>
									</tr>
								</thead>
								<%
								  	Connection conn = null;
								  	Statement stmt = null;
								  	ResultSet rs = null;
								  	
								  	String driver = "oracle.jdbc.driver.OracleDriver";
								  	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
								  	String db_id = "kslsr";
								  	String db_pwd = "1234";
								  	
								  	try {
								  		
									  	Class.forName(driver);
									  	conn = DriverManager.getConnection(url, db_id, db_pwd);
									
									  	// 결과 값을 출력하기 위한 방법
									  	stmt = conn.createStatement();
									
									  	String sql = "select * from fh_tb_board_notice order by idx desc";
									  	
									  	rs = stmt.executeQuery(sql);
								%>	
								<tbody>
									<%
										while(rs.next()){
											String id = rs.getString("idx");
											String pwd = rs.getString("title");
											String phone = rs.getString("id");
											Timestamp regdate = rs.getTimestamp("regdate");
									%>
									<tr>
										<td><%= rs.getObject("idx") %></td>
										<td><%= rs.getObject("title") %></td>
										<td><%= rs.getObject("id") %></td>
										<td><%= rs.getObject("regdate") %></td>
									</tr>
									<%
										}
									%>
								</tbody>
								<%
									} catch (ClassNotFoundException cnfe){
						
									} finally {
										try {
											if(rs != null){
												rs.close();
											}
											if(stmt != null){
												stmt.close();
											}
											if(conn != null){
												conn.close();
											}
										} catch (SQLException sqle){
											out.println(sqle.getMessage());
										}
									}
								%>
							</table>
						</form>
						<div class = "btn">
							<a href = "/views/notice/writeForm.jsp" class = "btn_g">글 쓰기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer"><span>copy right</span></div>
	</div>
 </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
  <link rel="stylesheet" href="../css/layout.css" />
 </head>
 <body>
		<div class="wrap">
			<div class="header">
				<div>
					<div class="huanImg">
						<img src="../img/FamHuan.png" />
						<div class="login">
							<div>
								<a href="../login.jsp">로그인</a> | 
								<a href="regist.jsp">회원가입</a>
							</div>
						</div>
					</div>
				</div>
				<div class="topMenu">
					<ul class="top_nav">
						<li><a href="../main.jsp">메인화면</a></li>
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
							<li><a href="regist.jsp">회 원 가 입</a></li>
							<li><a href="update.jsp">회원정보수정</a></li>
							<li><a href="delete.jsp">회 원 탈 퇴</a></li>
							<li><a href="memberUpdate.jsp">회 원 관 리</a></li>
						</ul>
					</div>
					<div class="content">
						<div class="contentNav">회원관리 &gt; 리스트</div>
						<div class="list">
							<table>
								<colgroup>
									<col width="100px" />
									<col width="*" />
								</colgroup>
								<thead>
									<tr>
										<th>아이디</th>
										<th>비밀번호</th>
										<th>전화번호</th>
										<th>이메일</th>
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
									
									  	String sql = "select * from member";
									  	
									  	rs = stmt.executeQuery(sql);
								%>	
								<tbody>
									<%
										while(rs.next()){
											String id = rs.getString("id");
											String pwd = rs.getString("pwd");
											String phone = rs.getString("phone");
											String email = rs.getString("email");
											Timestamp regdate = rs.getTimestamp("regdate");
									%>
									<tr>
										<td><%= rs.getObject("id") %></td>
										<td><%= rs.getObject("pwd") %></td>
										<td><%= rs.getObject("phone") %></td>
										<td><%= rs.getObject("email") %></td>
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
							
							<div class="paging">
								<a href="#" class="prev"><img src="../img/btn_prev.gif" /></a>
								<strong><span>1</span></strong>
								<a href="#"><span>2</span></a>
								<a href="#"><span>3</span></a>
								<a href="#"><span>4</span></a>
								<a href="#"><span>5</span></a>
								<a href="#" class="next"><img src="../img/btn_next.gif" /></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer"><span>copy right</span></div>
		</div>
 </body>
</html>

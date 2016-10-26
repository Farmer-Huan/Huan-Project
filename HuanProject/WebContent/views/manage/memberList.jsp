<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session = "true"%>
<%@ page import = "com.farmer.huan.DBConfig" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
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
					<div class="contentNav">회원관리 &gt; 리스트</div>
					<div class="list">
						<table>
							<colgroup>
								<col width="50px" />
								<col width="*" />
								<col width="*" />
								<col width="*" />
								<col width="*" />
								<col width="150px" />
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>아이디</th>
									<th>비밀번호</th>
									<th>전화번호</th>
									<th>이메일</th>
									<th>등록일</th>
								</tr>
							</thead>
							
							<tbody>
								<%
								  	Connection conn = null;
								  	Statement stmt = null;
								  	ResultSet rs = null;
								  	
								  	String driver = "oracle.jdbc.driver.OracleDriver";
								  	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
								  	try {
								  		
									  	Class.forName(driver);
									  	conn = DriverManager.getConnection(url, DBConfig.DB_ID, DBConfig.DB_PW);
									
									  	// 결과 값을 출력하기 위한 방법
									  	stmt = conn.createStatement();
									
										StringBuffer sql = new StringBuffer();
									  	sql.append("select * ");
									  	sql.append("from fh_tb_user ");
									  	sql.append("order by idx desc");
									  	
									  	rs = stmt.executeQuery(sql.toString());
										while(rs.next()){
											int idx = rs.getInt("idx");
											String id = rs.getString("id");
											String pwd = rs.getString("pwd");
											String phone = rs.getString("phone");
											String email = rs.getString("email");
											Timestamp regdate = rs.getTimestamp("regdate");
								%>
								<tr>
									<td><%= idx %></td>
									<td><%= id %></td>
									<td><%= pwd %></td>
									<td><%= phone %></td>
									<td><%= email %></td>
									<td><%= regdate %></td>
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

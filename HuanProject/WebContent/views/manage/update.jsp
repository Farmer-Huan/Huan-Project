<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "com.farmer.huan.DBConfig" %>
<%@ page import = "java.util.*" %>
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
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, DBConfig.DB_ID, DBConfig.DB_PW);
			// where = 조건
			StringBuffer sql = new StringBuffer();
			sql.append("select * ");
			sql.append("from fh_tb_user ");
			sql.append("where id = ?");

			pstmt = conn.prepareStatement(sql.toString());
		
			pstmt.setString(1, sid);
			rs = pstmt.executeQuery();
	%>
	<script type="text/javascript">
	
		function dataSubmit(){
			var upFrom = document.upForm;
			
			if(upForm.pwd.value != upForm.pwd_check.value){
				alert("비밀번호가 다릅니다.");
				return;
			}
			upForm.action = "/views/manage/updateOK.jsp";
			upForm.submit();
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
						<li><a href="/views/manage/login.jsp">로   그   인</a></li>
						<li><a href="/views/manage/regist.jsp">회 원 가 입</a></li>
						<li><a href="/views/manage/memberList.jsp">회 원 목 록</a></li>
						<li><a href="/views/manage/update.jsp">회원정보수정</a></li>
						<li><a href="/views/manage/delete.jsp">회 원 탈 퇴</a></li>
						<li><a href="/views/manage/memberUpdate.jsp">회 원 관 리</a></li>
					</ul>
				</div>
				<!--  contentWrap - listWrap end -->
				<div class="content">
					<div class="contentNav">회원관리 &gt; 회원정보 &gt; 수정</div>
					<div class="regist">
						<%
							// 오류 발생 rs.getString(""); 전에 
							// while 이나 if 로 rs.next() 해줘야 함
							while (rs.next()){
						
								String pwd = rs.getString("pwd");
								String phone = rs.getString("phone");
								String email = rs.getString("email");
								Timestamp regdate = rs.getTimestamp("regdate");
						%>
						<form method = "post" name = "upForm" id = "upForm" action = "">
							<table>
								<colgroup>
									<col width="100px" />
									<col width="*" />
								</colgroup>
								<tbody>
									<tr>
										<th>아이디</th>
										<td><%= sid %><input type="hidden" name = "id" value = "<%= sid %>" /></td>
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
								} catch (SQLException s){
									out.println(s.getMessage());
								}
							}
						%>
						
						<div class = "btn">
							<a href = "javascript:dataSubmit();">저장</a>
							<a href = "/views/manage/memberList.jsp">회원목록</a>
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
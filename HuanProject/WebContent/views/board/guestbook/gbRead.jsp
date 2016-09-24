<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.farmer.huan.DBConfig" %>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String idx = "",
				id = "",
				title = "",
				content = "",
				regdate = "";
	
	String dbID = DBConfig.DB_ID;
	String dbPW = DBConfig.DB_PW;
	
	if(request.getParameter("gno") != null){
		idx = request.getParameter("gno");
	}else{
		idx = "0";
	}
	
	int gpn = 1;
	if(request.getParameter("rno") != null){
		gpn = Integer.parseInt(request.getParameter("rno"));
		if(gpn%10 != 0){
			gpn = gpn/10 +1;
		}else{
			gpn = gpn/10;
		}
	}
	
	String grquery = "select * from fh_tb_guestbook where idx = " + idx;
	
	try{
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",dbID,dbPW);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(grquery);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" type = "text/css" href = "/css/layout.css">
<title>Project BARISTA - Guestbook</title>
</head>
<body>

	
	<div id="test" width="500px">
		<!--  Path : //getServletContext().getRealPath("/")  </h3> -->
		<p>
			<%
				Object session_id = session.getAttribute("session_id");
				Object session_pw = session.getAttribute("session_pw");
				String sid = (String) session_id;
				String spw = (String) session_pw;
				
				if(sid == "" || sid == null) {
			%>
			<form method="post" action="/views/login.jsp">
				<textblock>아이디:</textblock>
			 	<input id="login_id" name="id" type="text" value="" /> <br/>
			 	<textblock>비밀번호:</textblock>
			 	<input id="login_pw" name="pw" type="text" value="" /> <br/>
			 	<input type="submit" value="로그인" />
		 	</form>
			<%
				} else {
			%>
			<div class="ft12">
				<%=session_id %>님 하이헬로안녕?<br>
				네 비밀번호는 <%=session_pw %> 란다. 기억하니?<br>
				<input type="button" value = "LOGOUT인 척 메인으로 가기" onclick = "location.href='/views/main.jsp'"/>
			</div>
			<%
				}
			%>
			</p>
	 	<p></p>
	 	<input type="button" value="regist.jsp" onclick="location.href='/views/regist.jsp'"/>
	 	<input type="button" value="memberlist.jsp" onclick="location.href='/views/memberlist.jsp'"/>
	 	<input type="button" value="insert.jsp" onclick="location.href='/views/insert.jsp'"/>
	 	<p></p>
	 	
	</div>
	<div class="wrap">
		<div class="header">
			<div>
				<div class="huanImg">
					<div class="login">
						<div>
							<a href="#">로그인</a> | 
							<a href="#">회원가입</a>
						</div>
					</div>
					<img src="/img/FamHuan.png" />
				</div>
			</div>
			<div class="topMenu">
				<ul class="top_nav">
					<li><a href="#">메인</a></li>
					<li><a href="#">게시판</a></li>
					<li><a href="#">커피가이드</a></li>
					<li><a href="#">회원</a></li>
				</ul>
			</div>
		</div>
		<div class="contentWrap">
			<div class="listWrap">
				<div class="left">
					<ul>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">게시판</a></li>
						<li><a href="http://localhost:8080/views/board/qna/qna.jsp">QnA</a></li>
						<li><a href="http://localhost:8080/views/board/guestbook/guestbook.jsp">방명록</a></li>
					</ul>
				</div>
				<div class="content">
					<div class="contentNav">게시판 &gt; Guestbook</div>
					<div class="list">
						<table>
							<colgroup>
								<col width="80px" />
								<col width="*" />
								<col width="80px" />
								<col width="200px" />
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
								<%
									if(rs != null){
										while(rs.next()){
											idx = rs.getString("idx");
											title = rs.getString("title");
											id = rs.getString("id");
											content = rs.getString("content");
											regdate = rs.getString("regdate");
										}
								%>
								<tr>
									<td><%=idx%></td>
									<td class="tl pl5"><%=title%></td>
									<td><%=id%></td>
									<td><%=regdate%></td>
								</tr>
								<tr>
									<td colspan="4"><textarea cols="100" rows="10" readonly><%=content%></textarea></td>
								</tr>
								</tbody>
								<%		
									}//end if
								%>
						</table>
						
						<div class = "ft12">
							<form method = "post" name = "gbread" action = "/views/board/guestbook/gbUpdate.jsp?gno=<%=idx%>">
								수정하려면 비밀번호를 입력하세요.<br>
								<input type = "password" name ="readpwd" value = ""> 
								<input type = "submit" value = "UPDATE">
							</form>
							<input type = "button" value = "DELETE" onclick = "location.href='/views/board/guestbook/gbDelete.jsp?gno=<%=idx%>'">
							<input type = "button" value = "BACK" onclick = "location.href='/views/board/guestbook/guestbook.jsp?gpn=<%=gpn%>'">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer"><span>copy right</span></div>
	</div>
	
	
	<%
		}catch(SQLException e){
			System.out.println(e);
		}catch(Exception e){
			System.out.println(e);
		}finally{
			if(rs != null){
				try{rs.close();}
				catch(SQLException e){}
			}if(stmt != null){
				try{stmt.close();}
				catch(SQLException e){}
			}if(conn != null){
				try{conn.close();}
				catch(SQLException e){}
			}
		}
	%>
</body>
</html>
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
				pwd = "",
				title = "",
				content = "",
				regdate = "";
	
	String dbID = DBConfig.DB_ID;
	String dbPW = DBConfig.DB_PW;
	
	if(request.getParameter("qno") != null){
		idx = request.getParameter("qno");
	}else{
		idx = "0";
	}
	
	String upquery = "select idx,id,pwd,title,content,regdate from fh_tb_qna where idx=" + idx;

	try{
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",dbID,dbPW);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(upquery);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" type = "text/css" href = "../../css/layout.css">
<title>Project BARISTA - QnA</title>
</head>
<body>



	<div id="test" width="500px">
		<!--  Path : //getServletContext().getRealPath("/")  </h3> -->
		<p>
			<form method="post" action="../../views/login.jsp">
				<textblock>아이디:</textblock>
			 	<input id="login_id" name="id" type="text" value="" /> <br/>
			 	<textblock>비밀번호:</textblock>
			 	<input id="login_pw" name="pw" type="text" value="" /> <br/>
			 	<input type="submit" value="로그인" />
		 	</form>
			<%
				Object session_id = session.getAttribute("session_id");
				String sid = (String) session_id;
				if(sid == "" || sid == null) {
					out.println("session null");
				} else {
					out.println("session_id: " + session_id);
				}
			%>
			</p>
	 	<p></p>
	 	<input type="button" value="regist.jsp" onclick="location.href='../../views/regist.jsp'"/>
	 	<input type="button" value="memberlist.jsp" onclick="location.href='../../views/memberlist.jsp'"/>
	 	<input type="button" value="insert.jsp" onclick="location.href='../../views/insert.jsp'"/>
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
					<img src="../../img/FamHuan.png" />
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
						<li><a href="http://localhost:8080/HuanProject/root/board/qna.jsp">QnA</a></li>
						<li><a href="http://localhost:8080/HuanProject/root/board/guestbook.jsp">방명록</a></li>
					</ul>
				</div>
				<div class="content">
					<div class="contentNav">게시판 &gt; QnA</div>
					<div class="list">
						
						<form method = "post" name = "qnaupdate" action = "http://localhost:8080/HuanProject/root/board/qnaUpdateSubmit.jsp">
							<table>
								<colgroup>
									<col width="80px" />
									<col width="*" />
									<col width="80px" />
									<col width="200px" />
								</colgroup>
								<thead>
									<tr>
										<th>수정</th>
										<th></th>
									</tr>
								</thead>		
<%
	if(rs != null){
		while(rs.next()){
			title = rs.getString("title");
			content = rs.getString("content");
		}
%>
								<tbody>
									<tr><td><input type = "hidden" name = "idx" value ="<%=idx%>"></td></tr>
									<tr>
										<td>제목</td>
										<td class="tl pl5"><input type = "text" name = "title" value = "<%=title%>"></td>
									</tr>
									<tr>
										<td>내용</td>
										<td colspan="4"><input type = "text" name = "content" value = "<%=content%>"></td>
									</tr>
								</tbody>
<%			
		}//end if
%>
							</table>	
							
							<div>
								<input type = "submit" value = "SUBMIT">
								<input type = "button" value = "CANCEL" onclick = "location.href='./qnaRead.jsp?qno=<%=idx%>'">
							</div>
						</form>
						
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
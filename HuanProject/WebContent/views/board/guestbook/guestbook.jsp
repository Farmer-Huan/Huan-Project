<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.farmer.huan.DBConfig" %>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	String rnum = "",
				idx = "",
				id = "",
				title = "",
				regdate = "";
	
	String dbID = DBConfig.DB_ID;
	String dbPW = DBConfig.DB_PW;
	
	int gbpage = 1;
	if(request.getParameter("gpn") != null){
		gbpage = Integer.parseInt(request.getParameter("gpn"));
	}
	int gpcount = gbpage/10 + 1;
	if(gbpage%10 == 0){
		gpcount --;
	}
	gpcount = gpcount*10-9;
	int gmaxcount = 0;
	int gpend = 10;
	
	String gpquery = "select * from (select rownum as rnum,idx,id,pwd,title,content,regdate from (select * from fh_tb_guestbook order by idx desc) where rownum <= " + gbpage*10 +") where rnum > " + (gbpage-1)*10;
	String maxquery = "select max(rownum) from fh_tb_guestbook";
	
	try{
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",dbID,dbPW);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(gpquery);
	
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
								<%
									if(rs != null){
										while(rs.next()){
											rnum = rs.getString("rnum");
											idx = rs.getString("idx");
											title = rs.getString("title");
											id = rs.getString("id");
											regdate = rs.getString("regdate").substring(0,10);
								%>
								<tr>
									<td><%=idx%></td>
									<td class="tl pl5"><a href="http://localhost:8080/views/board/guestbook/gbRead.jsp?gno=<%=idx%>&rno=<%=rnum%>"><%=title%></a></td>
									<td><%=id%></td>
									<td><%=regdate%></td>
								</tr>
								<%		
										}//end while
									}//end if
								%>
							</tbody>
						</table>
						<div>
							<input type = "button" value = "CREATE" onclick = "location.href='/views/board/guestbook/gbCreate.jsp'">
						</div>
						
						<%-- -------------------------------------------paging------------------------------------------- --%>
						
						<div class="paging">
							<%
								rs2 = stmt.executeQuery(maxquery);
								if(rs2 != null){
									while(rs2.next()){
										gmaxcount = Integer.parseInt(rs2.getString("max(rownum)"))/10+1;
										if(Integer.parseInt(rs2.getString("max(rownum)"))%10 == 0){
											gmaxcount --;
										}
									}//end while
									if(gmaxcount<gbpage){
										gpend = 0;
									}else if(gmaxcount-gpcount<10){
										gpend = gmaxcount - gpcount + 1; 
									}
								}//end if
							%>
							<%
								if(gpcount > 1 && gmaxcount >= gbpage){
							%>
							<a href="http://localhost:8080/views/board/guestbook/guestbook.jsp?gpn=<%= gpcount-1 %>" class="prev"><img src="/img/btn_prev.gif" /></a>
							<%
								}
								for(int i = 0; i < gpend; i++){
									if(gpcount == gbpage){
							%>
							<strong><span><%= gbpage %></span></strong>
									<%
										gpcount++;
										continue;
									}//end if
									%>
							<a href="http://localhost:8080/views/board/guestbook/guestbook.jsp?gpn=<%= gpcount %>"><span><%= gpcount %></span></a>
							<%
									gpcount++;
								}// end for
								if(gpend < 10){
								}else{
									if(gpend == 10 && gmaxcount-9 == gpcount-10){
									}else{
							%>
							<a href="http://localhost:8080/views/board/guestbook/guestbook.jsp?gpn=<%= gpcount %>" class="next"><img src="/img/btn_next.gif" /></a>
							<%
									}
								}//end if
							%>
						</div>
						
						<%-- --------------------------------------------------------------------------------------------- --%>
						
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
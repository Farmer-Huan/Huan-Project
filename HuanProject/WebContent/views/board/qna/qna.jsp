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
	
	//----------------------------------------------------------------------------------------------------------------------------
	//페이징처리
	//qnapage = 10개씩 제목 보여지는 페이지 번호, qpn = QnaPageNumber/get으로 보내고 받는 qnapage 파라메터명
	//qpcount = QnaPageCount/페이징 시작 번호, qmaxcount = QnaMaxCount/QnA 전체 글 갯수를 받아 페이지 갯수 계산
	//maxquery = rownum으로 계산된 전체 글 갯수 받는 쿼리, qpend = QnaPageEnd/마지막 페이징 갯수
	int qnapage = 1;
	if(request.getParameter("qpn") != null){
		qnapage = Integer.parseInt(request.getParameter("qpn"));
	}
	int qpcount = qnapage/10 + 1;
	if(qnapage%10 == 0){
		qpcount --;
	}
	qpcount = qpcount*10-9;
	int qmaxcount = 0;
	int qpend = 10;
	//----------------------------------------------------------------------------------------------------------------------------
	
	String qpquery = "select * from (select rownum as rnum,idx,id,pwd,title,content,regdate from (select * from fh_tb_qna order by idx desc) where rownum <= " + qnapage*10 +") where rnum > " + (qnapage-1)*10;
	String maxquery = "select max(rownum) from fh_tb_qna";
	try{
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",dbID,dbPW);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(qpquery);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/css/layout.css">
<title>Project BARISTA - QnA</title>
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
			<form method="post" action="/views/manage/login.jsp">
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
					<div class="contentNav">게시판 &gt; QnA</div>
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
									<td class="tl pl5"><a href="http://localhost:8080/views/board/qna/qnaRead.jsp?qno=<%=idx%>&rno=<%=rnum%>"><%=title%></a></td>
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
							<input type = "button" value = "CREATE" onclick = "location.href='/views/board/qna/qnaCreate.jsp'">
						</div>
						
						<%-- -------------------------------------------paging------------------------------------------- --%>
						
						<div class="paging">
							<%
								rs2 = stmt.executeQuery(maxquery);
								if(rs2 != null){
									while(rs2.next()){
										qmaxcount = Integer.parseInt(rs2.getString("max(rownum)"))/10+1;
										if(Integer.parseInt(rs2.getString("max(rownum)"))%10 == 0){
											qmaxcount --;
										}
									}//end while
									if(qmaxcount<qnapage){
										qpend = 0;
									}else if(qmaxcount-qpcount<10){
										qpend = qmaxcount - qpcount + 1; 
									}
								}//end if
							%>
							<%
								if(qpcount > 1 && qmaxcount >= qnapage){
							%>
							<a href="http://localhost:8080/views/board/qna/qna.jsp?qpn=<%= qpcount-1 %>" class="prev"><img src="/img/btn_prev.gif" /></a>
							<%
								}
								for(int i = 0; i < qpend; i++){
									if(qpcount == qnapage){
							%>
							<strong><span><%= qnapage %></span></strong>
									<%
										qpcount++;
										continue;
									}//end if
									%>
							<a href="http://localhost:8080/views/board/qna/qna.jsp?qpn=<%= qpcount %>"><span><%= qpcount %></span></a>
							<%
									qpcount++;
								}// end for
								if(qpend < 10){
								}else{
									if(qpend == 10 && qmaxcount-9 == qpcount-10){
									}else{
							%>
							<a href="http://localhost:8080/views/board/qna/qna.jsp?qpn=<%= qpcount %>" class="next"><img src="/img/btn_next.gif" /></a>
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
			if(rs2 != null){
				try{rs2.close();}
				catch(SQLException e){}
			}if(rs != null){
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
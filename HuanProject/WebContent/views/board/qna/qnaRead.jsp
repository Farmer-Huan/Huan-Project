<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.farmer.huan.DBConfig" %>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String idx = "";
	String id = "";
	String title = "";
	String content = "";
	String regdate = "";
	
	int shownum = 0;
	String sid = "";
	HttpSession se = request.getSession();
	Map<String, Object> user = (Map<String, Object>)se.getAttribute("session_map");
	
	if(user != null){
		shownum = 1;
		sid = (String)user.get("user_id");
	}
	
	if(request.getParameter("qno") != null){
		idx = request.getParameter("qno");
	}
	
	//qpn = QnaPageNumber, back 버튼을 위한 직전 페이지의 번호
	int qpn = 1;
	if(request.getParameter("rno") != null){
		qpn = Integer.parseInt(request.getParameter("rno"));
		if(qpn%10 != 0){
			qpn = qpn/10+1;
		}else{
			qpn = qpn/1;
		}
	}
	
	StringBuffer qrquery = new StringBuffer();
	qrquery.append(" select");
	qrquery.append(				" *");
	qrquery.append(" from");
	qrquery.append(				" fh_tb_qna");
	qrquery.append(" where");
	qrquery.append(				" 1=1");
	qrquery.append(" and");
	qrquery.append(				" idx = " + idx);
	
	try{
		if(idx == "" || idx == null){
			shownum = 3;
		}else{
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",DBConfig.DB_ID,DBConfig.DB_PW);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(qrquery.toString());
			if(rs != null){
				while(rs.next()){
					title = rs.getString("title");
					id = rs.getString("id");
					content = rs.getString("content");
					regdate = rs.getString("regdate");
				}
				if(sid.equals(id) == false){
					shownum = 2;
				}
			}
		}
		
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" type = "text/css" href = "/css/layout.css">
<title>Project BARISTA - QnA</title>
</head>
<body>

	
	<div class="wrap">
		<div class="header">
			<div>
				<div class="huanImg">
					<img src="/img/FamHuan.png" />
					<div class="login">
						<div>
							<!-- -------------------------로그인/로그아웃 경로 완성되면 수정할 것------------------------- -->
							<%
								if(sid == "" || sid == null) {
							%>
							<a href="/views/board/qna/loginSTD.jsp">로그인</a> | 
							<a href="/views/manage/regist.jsp">회원가입</a>
							<%
								}else{
							%>
							<%=sid%>님 환영합니다. | <a href="/views/board/qna/loginSTDout.jsp">로그아웃</a>
							<%
								}
							%>
							<!-- -------------------------------------------------------------------------------------- -->
						</div>
					</div>
				</div>
			</div>
			<div class="topMenu">
				<ul class="top_nav">
					<li><a href="/">홈</a></li>
					<li><a href="#">커피가이드</a></li>
					<li><a href="/views/board/free/free.jsp">게시판</a></li>
					<li><a href="/views/manage/login.jsp">회원관리</a></li>
				</ul>
			</div>
		</div>
		<div class="contentWrap">
			<div class="listWrap">
				<div class="left">
					<ul>
						<li><a href="/views/board/notice/notice.jsp">공지사항</a></li>
						<li><a href="/views/board/free/free.jsp">게시판</a></li>
						<li><a href="/views/board/qna/qna.jsp">QnA</a></li>
						<li><a href="/views/board/guestbook/guestbook.jsp">방명록</a></li>
					</ul>
				</div>
				<div class="content">
					<div class="contentNav">게시판 &gt; QnA</div>
					<%
						if(shownum == 3){
					%>
					<div class="list">
						<div class="ft12">
							글이 없습니다.
						</div>
					</div>
					<div>
						<input type = "button" value = "BACK" onclick = "location.href='/views/board/qna/qna.jsp?qpn=<%=qpn%>'">
					</div>
					<%
						}else{
					%>
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
								<tr>
									<td><%=idx%></td>
									<td class="tl pl5"><%=title%></td>
									<td><%=id%></td>
									<td><%=regdate%></td>
								</tr>
								<tr>
									<td colspan="4"><textarea cols = "100" rows = "10" readonly><%=content%></textarea></td>
								</tr>
							</tbody>
						</table>	
						
						<div>
							<%
							if(shownum == 1){
							%>
							<input type = "button" value = "UPDATE" onclick = "location.href = '/views/board/qna/qnaUpdate.jsp?qno=<%=idx %>'">
							<input type = "button" value = "DELETE" onclick = "location.href='/views/board/qna/qnaDelete.jsp?qno=<%=idx%>'">
							<%
							}
							%>
							<input type = "button" value = "BACK" onclick = "location.href='/views/board/qna/qna.jsp?qpn=<%=qpn%>'">
						</div>
					</div>
					<%
						}
					%>
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
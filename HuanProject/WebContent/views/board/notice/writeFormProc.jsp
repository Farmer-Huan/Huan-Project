<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import = "com.farmer.huan.DBConfig" %>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = DBConfig.DB_ID;
	String pw = DBConfig.DB_PW;
	
	int i = 0;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	String sql = "insert into fh_tb_board_notice " +
				"(idx, id, pwd, title, content, regdate) " +
				"values ((select MAX(idx) + 1 from fh_tb_board_notice), ?, ?, ?, ?, sysdate)";
	
	try {
		Class.forName(driver);
		
		conn = DriverManager.getConnection(url, id, pw);
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, writer);
		pstmt.setString(2, pwd);
		pstmt.setString(3, subject);
		pstmt.setString(4, content);
		
		i = pstmt.executeUpdate();
		
		out.println(i + "행이 추가 되었습니다.");
		
	} catch (Exception e){
		e.printStackTrace();
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
		} catch (SQLException sqle){
			sqle.printStackTrace();
		}	
	}
%>
<script type = "text/javascript">
	if(<%= i %> > 0){
		alert("글이 등록되었습니다..");
		location.href = "/views/board/notice/writeList.jsp";
	} else {
		alert("글 등록 실패 ");
		history.go(-1);
	}
</script>
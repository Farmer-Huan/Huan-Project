<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "com.farmer.huan.DBConfig" %>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");

	Connection conn = null;
	PreparedStatement pstmt = null;

	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	int n = 0;

	try {
		Class.forName(driver);

		conn = DriverManager.getConnection(url, DBConfig.DB_ID, DBConfig.DB_PW);
		// update [테이블] set [열] = '변경할값' where [조건]
		StringBuffer sql = new StringBuffer();
		sql.append("update fh_tb_user ");
		sql.append("set pwd = ?, phone = ?, email = ? ");
		sql.append("where id = ?");

		pstmt = conn.prepareStatement(sql.toString());

		pstmt.setString(1, pwd);
		pstmt.setString(2, phone);
		pstmt.setString(3, email);
		pstmt.setString(4, id);

		n = pstmt.executeUpdate();

	} catch (SQLException sqle){
		out.println(sqle.getMessage());
	} finally {
		try {
			if (pstmt != null){
				pstmt.close();
			}
			if (conn != null){
				conn.close();
			}
		} catch (SQLException se) {
			out.println(se.getMessage());
		}
	}
%>
<script type = "text/javascript">
	if(<%= n %> > 0){
		alert("회원정보가 수정되었습니다.");
		location.href = "/views/manage/memberList.jsp";
	} else {
		alert("회원정보 수정실패");
		history.go(-1);
	}
</script>

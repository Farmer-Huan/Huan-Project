<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
</head>
<body>
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
		String db_id = "kslsr";
		String db_pwd = "1234";
		int n = 0;

		try {
			Class.forName(driver);

			conn = DriverManager.getConnection(url, db_id, db_pwd);
			// update [테이블] set [열] = '변경할값' where [조건]
			String strQuery = "update member set pwd = ?, phone = ?, email = ? where id = ?";

			pstmt = conn.prepareStatement(strQuery);

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
			location.href = "memberList.jsp";
		} else {
			alert("회원정보 수정실패");
			history.go(-1);
		}
	</script>
</body>
</html>
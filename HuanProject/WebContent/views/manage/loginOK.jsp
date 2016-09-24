<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "com.farmer.huan.DBConfig" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	// DB 연결 확인
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String db_id = DBConfig.DB_ID;
	String db_pwd = DBConfig.DB_PW;

	int i = 0;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// ? 라는 id를 fh_tb_user 테이블에서 모두 가져오세요.
	StringBuffer sql = new StringBuffer();
	sql.append("select pwd "		);
	sql.append("from fh_tb_user "	);
	sql.append("where id = ?"		);
	
	try {
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url, db_id, db_pwd);
		
		// 쿼리문으로 아이디 확인
		pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		// 아이디 존재 여부 > 비밀번호 체크
		if(rs.next()){
			out.println("아이디가 존재한다.");
			if(pwd.equals(rs.getString("pwd"))){
				out.println("로그인 성공");
				response.sendRedirect("/views/manage/memberList.jsp");
			} else {
				out.println("패스워드 불일치");
%>
				<script>
					alert("비밀번호가 맞지 않습니다.");
				</script>
<%
			}
		} else {
			out.println("아이디가 존재하지 않는다.");
%>
			<script>
				alert("아이디가 존재하지 않습니다.");
				history.go(-1);
			</script>		
<%
		}
		
		// 디비 데이터 확인
	} catch (ClassNotFoundException cnfe){
		out.println("oracle.jdbc.driver.OracleDriver를 찾을 수 없습니다.");
	} catch (SQLException sqle){
		out.println("SQLException 발생");
	} catch (Exception e){
		out.println("예외 발생");
	} finally {
		if(rs != null){
			try{
				rs.close();
			}catch (SQLException sqle){
			}
		}
		if(pstmt != null){
			try{
				pstmt.close();
			}catch (SQLException sqle){
			}
		}
		if (conn != null){
			try{
				conn.close();
			}catch (SQLException sqle){
			}
		}
	}
	
	// 성공 했을 경우
	// Session 생성
	HttpSession ssn = request.getSession();
	Map<String, Object> logMap = new HashMap<String, Object>();
	out.println(id);
	logMap.put("id", id);
	// Session에 Data Set
	ssn.setAttribute("logMap", logMap);
	// MemberList 이동
%>

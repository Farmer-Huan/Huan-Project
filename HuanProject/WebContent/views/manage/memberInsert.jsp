<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "com.farmer.huan.DBConfig" %>
<%@ page import = "java.sql.*" %>
<%
	
	request.setCharacterEncoding("utf-8");

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String db_id = DBConfig.DB_ID;
	String db_pwd = DBConfig.DB_PW;

	int i = 0;

	Connection conn = null;
	PreparedStatement pstmt = null;
	

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	/*
		JDBC를 이용한 DB 연결 방법
		1. import java.sql.*
		2. 특정 Driver 검색
		 - Class.forName("검색드라이버명");
		 - Oracle: thin Driver사용
		 -- oracle.jdbc.driver.OracleDriver
		 - Mysql: ConnectorJ 사용
		 -- com.mysql.jdbc.Driver
		3. Database 연결
		 - Connection conn = DriverManager.getConnection(url, id, password);
		 - url
		 -- Oracle: jdbc:oracle:thin:@localhost:1521:orcl
		 -- Mysql : jdbc:mysql://localhost:3306/DBName
		4. Query문 작성
		 - Statement Class (정적)
		 -- Statement stmt = conn.createStatement();
		 - PreparedStatement(동적)
		 -- PreparedStatement pstmt = conn.prepareStatement(query);
		5. 결과 담기
		 - ResultSet rs = stmt.executeQuery(query); //select
		 - ResultSet rs = stmt.executeUpdate(query); // insert, update, delete
		 - ResultSet rs = pstmt.executeQuery(); // select
		 - ResultSet rs = pstmt.executeUpdate(); // insert, update, delete
		6. 자원 사용후 close(); 하기
		
		 
	*/
	
	try {
		Class.forName(driver);
		out.println("jdbc 드라이브 메모리에 로드 <br/>");
		
		conn = DriverManager.getConnection(url, db_id, db_pwd);
		out.println("DriverManager 클래스는 <br/> static 메소드인 getConnection()메소드를 이용해서<br/>"); 
		out.println("DB와 연결된 Connection 객체를 반환한다.<br/>");
		out.println("Connection 객체는 DB와의 연결을 담당하는 객체이다.<br/>");
		out.println("Connection객체를 이용해서 SQL을 전송-실행할 수 있는 Statement객체를 얻을 수 있다.");
		// select문과 update, delete, insert문의 차이
		// update, delete, insert를 사용 할 때
		// Statement stmt = conn.createStatement();
		// 넘기는 인자 값이 존재하지 않음
		// int result = stmt.executeUpdate(sql);
		
		// executeUpdate 메소드를 이용하고 반환타입은 int
		// 반환값은 쿼리문의 개수를 반환해준다.
		
		// select 쿼리를 날릴 경우에 그 결과 테이블을 반환받아야 한다.
		// 그래서 위의 세개 명령과는 좀 다르다.
		// 메소드는 executeQuery를 쓰고 반환타입은 resultSet의 자료형을 사용한다.
		// 그래서 ResultSet rs = stmt.executeQuery(sql);를 사용한다.
		
		// PreparedStatement를 선호하는 이유
		// createStatement를 사용할 경우 모든 SQL문이 완성되어 있어야 하는데 
		// prepareStatement를 사용할 경우 물음표 처리가 가능해서 그 객체를 통해
		// setString같은 메소드를 통해서 물음표에 해당하는 데이터를 넣어줌으로
		// 여러 데이터를 반복해서 넣을 때 반복문을 사용할 수 있다.
		
		
		StringBuffer sql = new StringBuffer();
		sql.append("insert into fh_tb_user ");
		sql.append("(idx, id, pwd, phone, email, regdate) ");
		sql.append("values ((select MAX(idx) + 1 from fh_tb_user), ?, ?, ?, ?, sysdate) ");

		// conn 객체의 prepareStatement 메소드를 실행
		pstmt = conn.prepareStatement(sql.toString());
		out.println("PreparedStatement 객체 얻기");
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, phone);
		pstmt.setString(4, email);
		
		i = pstmt.executeUpdate();
		out.println("쿼리 실행");
		out.println(i + " 개의 행이 추가 되었습니다..");
		
	} catch (ClassNotFoundException cnfe){
		out.println("oracle.jdbc.driver.OracleDriver를 찾을 수 없습니다.");
	} catch (SQLException sqle){
		out.println("SQLException 발생");
	} catch (Exception e){
		out.println("예외 발생");
	} finally {
		try {
			out.println("자원 반납");
			if (conn != null){
				conn.close();
			}
			if (pstmt != null){
				pstmt.close();
			}
		} catch (Exception e){
			
		}
	}
%>
<!--  밑에 스크립트가 없을 경우 회원 가입에 대한 로그 확인이 가능하다. -->
<script type = "text/javascript">

		if(<%= i %> > 0){
			alert("회원가입 되었습니다.");
			location.href = "/views/manage/login.jsp";
		} else {
			alert("회원가입 실패");
			history.go(-1);
		}
	</script>
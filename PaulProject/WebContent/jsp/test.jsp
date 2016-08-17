<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%= new java.util.Date() %>
		
		<br><br>
		ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		<br><br>
		
		클라이언트IP = <%= request.getRemoteAddr() %> <br></br>
		요청정보길이 = <%= request.getContentLength() %> <br></br>
		요청정보 인코딩 = <%= request.getCharacterEncoding() %> <br></br>
		요청정보 컨텐트타입 = <%= request.getContentType() %> <br></br>
		요청정보 프로토콜 = <%= request.getProtocol() %> <br></br>
		요청정보 전송방식 = <%= request.getMethod() %> <br></br>
		요청 URL = <%= request.getRequestURL().toString() %> <br></br>
		요청 URI = <%= request.getRequestURI() %> <br></br>
		컨텍스트 경로 = <%= request.getContextPath() %> <br></br>
		서버이름 = <%= request.getServerName() %> <br></br>
		서버포트 = <%= request.getServerPort() %> <br></br>
		
		<br><br>
		ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		<br><br>
		
		폼에 데이터를 입력한 후 전송버튼을 클릭하세요.
		<form action="viewParameter.jsp" method="post">
		이름 : <input type="text" name="name" size="10"> <br><br>
		주소 : <input type="text" name="address" size="30"> <br><br>
		좋아하는 동물 : 
		<input type="checkbox" name="pet" value="dog">강아지
		<input type="checkbox" name="pet" value="cat">고양이
		<input type="checkbox" name="pet" value="pig">돼지
		<br><br>
		<input type="submit" value="전송">
		</form>
</body>
</html>
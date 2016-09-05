package com.farmer.huan;

public class DBConfig {
	
	public static final String DB_ID = "chandler";
	
	public static final String DB_PW = "test1234";

	/*
	 * jsp에서 import 한 후에 <%@ page import = "com.farmer.huan.DBConfig" %>
	 * 
	 * DBConfig.DB_ID / DBConfig.DB_PW 로 사용하면 끝
	 * 
	 * 다들 Pull 땡겨서 파일 받고 난 후에 .gitignore 파일에 등록하여 형상관리에서 제외할 예정
	 * 
	 * 여기서 각자 아이디 비밀번호 입력하여 사용하면 됨
	 * 
	 * 수정한 사항이 바로 반영 안되면 Servers 에 있는 톰캣 Clean Tomcat Work Directory 메뉴 클릭
	 * 
	 */
}

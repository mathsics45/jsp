<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	// 전송 파라미터 수신
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String addr = request.getParameter("addr");
	String pos = request.getParameter("pos");
	String dep = request.getParameter("dep");
	
	// 데이터베이스 작업
	final String HOST = "jdbc:mysql://192.168.0.126:3306/cjh";
	final String USER = "cjh";
	final String PASS = "1234";
	
	// 1단계 - JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계 - 데이터베이스 접속
	Connection conn= DriverManager.getConnection(HOST, USER, PASS);
	
	// 3단계 - 쿼리실행객체 생성
	Statement stmt = conn.createStatement();
	// 4단계 - 쿼리실행
	String sql = "INSERT INTO `USER` (uid, name, hp, addr, pos, dep, rdate) ";
		   sql += "VALUES ('"+uid+"', '"+name+"', '"+hp+"', '"+addr+"', '"+pos+"', "+dep+",NOW());";
	
	stmt.executeUpdate(sql);
		   
	// 5단계 - 결과셋 처리(SELECT일 경우)
	// 6단계 - 데이터 베이스 종료
	conn.close();
	
	// 리다이렉트
%>
<h2>등록완료!!!</h2>
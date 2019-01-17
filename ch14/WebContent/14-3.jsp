<%@page import="java.util.ArrayList"%>
<%@page import="sub1.USER"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터베이스 정보
	final String HOST = "jdbc:mysql://192.168.0.156:3306/cjh";
	final String USER = "cjh";
	final String PASS = "1234";
	
	Connection conn = null;
	ArrayList<USER> list = new ArrayList<>();
	
	try{
	// 1단계 - JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계 - 데이터베이스 접속
	conn = DriverManager.getConnection(HOST, USER, PASS);
	
	// 3단계 - 쿼리실행 객체 생성
	Statement stmt = conn.createStatement();
	
	// 4단계 - 쿼리실행
	// SELECT 경우 => executeQuery() 실행 -> ResultSet이 생성됨
	// INSERT, UPDATE, DELETE 경우 -> executeUpdate()실행
	ResultSet rs = stmt.executeQuery("SELECT * FROM `USER`;");
	
	// 5단계 - 결과셋 처리(SELECT 경우)
	
	while(rs.next()){
		USER user = new USER();
		
		/*
		int    seq 	 = rs.getInt(1);
		String uid 	 = rs.getString(2);
		String name  = rs.getString(3);
		String hp 	 = rs.getString(4);
		String addr  = rs.getString(5);
		String pos 	 = rs.getString(6);
		int    dep   = rs.getInt(7);
		String rdate = rs.getString(8);
		
		user.setSeq(seq);
		user.setUid(uid); ......
		한번에 바로넣기
		*/
		user.setSeq(rs.getInt(1));
		user.setUid(rs.getString(2));
		user.setName(rs.getString(3));
		user.setHp(rs.getString(4));
		user.setAddr(rs.getString(5));
		user.setPos(rs.getString(6));
		user.setDep(rs.getInt(7));
		user.setRdate(rs.getString(8));
		
		// 완성된 자바빈 객체 리스트에 저장
		list.add(user);
	}
	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
	// 6단계 - 데이터베이스 종료
	conn.close();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>14-3</title>
</head>
<body>
	<h3>직원목록</h3>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>주소</th>
			<th>직급</th>
			<th>부서번호</th>
			<th>등록일</th>
		</tr>
		
		<%
			for(USER user : list ){
		%>
		<tr>
			<td><%= user.getSeq() %></td>		
			<td><%= user.getUid() %></td>		
			<td><%= user.getName() %></td>		
			<td><%= user.getHp() %></td>		
			<td><%= user.getAddr() %></td>		
			<td><%= user.getPos() %></td>		
			<td><%= user.getDep() %></td>		
			<td><%= user.getRdate().substring(2, 10) %></td>		
			<td><a href="#">수정</a></td>		
			<td><a href="#">삭제</a></td>		
		</tr>
		<%
			} 
		%>
	</table>

</body>
</html>
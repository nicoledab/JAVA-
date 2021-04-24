<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<h1> member pro 페이지 </h1>

<% 
String id = request.getParameter("id");  //전체 아이디 알려면 이거 없앰~ dbConnectionTest.jsp 참조

Class.forName("oracle.jdbc.driver.OracleDriver"); //1단계 오라클에 연결하는 드라이브 


//2단계 db연결(로그인) url /계정 / 비밀번호 
String dbHost = "jdbc:oracle:thin:@masternull.iptime.org:1521:orcl";
String user = "java21"; 
String pass ="java"; 
Connection conn = DriverManager.getConnection(dbHost, user, pass);


// 3단계 : SQL문 작성 
String sql="select * from MEMBER where id=?";  
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);


// 4단계 : 실행 ( insert , update , delete ) (select)
ResultSet rs =  pstmt.executeQuery(); // select 사용
//pstmt.executeUpdate(); // select 제외한 나머지 사용

	
	/*
	while(rs.next()){
		out.println(rs.getString("id"));
		out.println(rs.getString("pw"));
		out.println(rs.getString("name"));
		out.println(rs.getString("gender"));
		out.println(rs.getString("age"));
		out.println(rs.getString("tel"));
		out.println(rs.getString("email"));
		out.println(rs.getString("address"));
		out.println(rs.getString("joindate"));
		out.println("<br />");
	} */
	
	if(rs.next()){
		out.println(rs.getString("id"));
		out.println(rs.getString("pw"));
		out.println(rs.getString("name"));
		out.println(rs.getString("gender"));
		out.println(rs.getString("age"));
		out.println(rs.getString("tel"));
		out.println(rs.getString("email"));
		out.println(rs.getString("address"));
		out.println(rs.getString("joindate"));
		out.println("<br />");
	}else{
		out.println(id+" = 없는 사원입니다...!");
	}


	rs.close(); 
	pstmt.close();
 	conn.close();  // 연결종료.!!!

%>


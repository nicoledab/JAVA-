<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>


 <h1> dbConnectionMember </h1>
    
    <% 
    // jdbc : 1~5단계 단계별로 진행
    // 1단계 db 드라이버 클래스 로딩
    //jdbc drivermanager 에 자동 등록된다. 
    Class.forName("oracle.jdbc.driver.OracleDriver"); //1단계 오라클에 연결하는 드라이브 
    
    
    //2단계 db연결(로그인) url /계정 / 비밀번호 
    String dbHost = "jdbc:oracle:thin:@masternull.iptime.org:1521:orcl";
         //                                             //    port : s
    String user = "java21"; // 본인 계정
    String pass ="java"; 
    Connection conn = DriverManager.getConnection(dbHost, user, pass);
    
    
    // 3단계 : SQL문 작성 
    String sql="select * from MEMBER";  
    PreparedStatement pstmt = conn.prepareStatement(sql);
    
    
    // 4단계 : 실행 ( insert , update , delete ) (select)
    ResultSet rs =  pstmt.executeQuery(); // select 사용
    //pstmt.executeUpdate(); // select 제외한 나머지 사용
    
    
    // 5단계 : (select 실행시만 동작) 실행결과 추출 
    while(rs.next()){
    	//out.println(rs.getString("ename"));
    	
    	// 모든 정보 꺼내보기 
    	//out.println(rs.getInt("empno"));
    	//out.println(rs.getString("ename"));
    	//out.println(rs.getString("job"));
    	//out.println(rs.getInt("mgr"));
    	//out.println(rs.getTimestamp("hiredate"));
    	//out.println(rs.getInt("sal"));
    	//out.println(rs.getInt("comm"));
    	//out.println(rs.getInt("deptno"));
    	//out.println("<br />");
    	
    	out.println(rs.getString("id"));
    	out.println(rs.getString("pw"));
    	out.println(rs.getString("name"));
    	//out.println(rs.getString("jumin"));
    	out.println(rs.getString("gender"));
    	out.println(rs.getString("age"));
    	out.println(rs.getString("tel"));
    	out.println(rs.getString("email"));
    	//out.println(rs.getString("address"));
    	out.println("<br />");
    	
    	
    }
    
    
    %> 
    
    
    <% 
     rs.close(); 
     pstmt.close();
      conn.close();  // 연결종료.!!!
    %>
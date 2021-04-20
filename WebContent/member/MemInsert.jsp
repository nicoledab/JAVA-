<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>


<%@ page import="membersJava.MemberDAO2" %>
 <% request.setCharacterEncoding("UTF-8"); %>  
    
    <jsp:useBean class="membersJava.Limit0409" id="mem" />
    <jsp:setProperty name="mem" property="*" /> 
    
<%
    MemberDAO2 dao = new MemberDAO2();
	dao.insert(mem);
  
 %>
    
    
    <h2> 회원이 추가되었습니다! </h2>
    <h4> <a href="/WebPractice/member/login.jsp"> 로그인 하러가기! </a></h4>
    <h4> <a href="/WebPractice/member/dbConnectionMember.jsp"> 회원(Member) 목록 확인 </a></h4>
    
    
    
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.model.MemberDAO" %>
<h1>inputPro - 회원가입폼 에서 전달된 값 처리 </h1>

<%	request.setCharacterEncoding("UTF-8");   // post방식 인코딩(한글) 처리 %>

	<jsp:useBean id="dto"  class="project.model.MemberDTO" />
	<jsp:setProperty property="*" name="dto"/>
<%
	MemberDAO dao = new MemberDAO();
	dao.insertMember(dto);
%>

	<h1> 가입 되었습니다.</h1>


<%
	// JDBC 활용한 데이터 저장!!  DAO
	// 1~5단계로 구성되어 있다. 
	// 1단계 데이터베이스 종류별 드라이버 로딩 - 사용중인 oracle 드라이버 로딩
	// 2단계 데이터베이스 연결(로그인)
	// 3단계 SQL 작성
	// 4단계 SQL 실행
	// 5단계 select 실행시 결과 추출
 %>
	
	
	
	
	
	
	
	
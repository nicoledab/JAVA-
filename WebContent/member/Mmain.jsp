<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1> Mmain 페이지 ..!! 0416</h1>

<% 
 // -----------------세션: 
 String id = (String)session.getAttribute("memId");




%>
<b><%=id%></b> 님 어서오세요~  <br/>
<input type="button" value= "회원정보 변경" 
      onclick="window.location='MupdateForm.jsp'"/> 
      
<input type="button" value= "로그아웃" 
      onclick="window.location='Mlogout.jsp'"/> 
      
<input type="button" value= "탈 퇴" 
      onclick="window.location='MdeleteForm.jsp'"/> 
      
 <h4> <a href="/WebPractice/member/dbConnectionMember.jsp"> 회원(Member) 목록 확인 </a></h4>
      
     
      
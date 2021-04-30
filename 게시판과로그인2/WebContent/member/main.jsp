<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>main</h1>

<%
	String id = (String)session.getAttribute("memId");
	if(id == null){
%>		<input type="button" value="로그인"    onclick="window.location='loginForm.jsp'" />
		<input type="button" value="회원가입"   onclick="window.location='inputForm.jsp'" />
<%	}else{ %>
		<b>[<%=id%>]</b> 어서오세요.!! <br />
		<input type="button" value="로그아웃"  onclick="window.location='logout.jsp'"/>
		<input type="button" value="정보수정"  onclick="window.location='updateForm.jsp'"/>
		<input type="button" value="탈 퇴"    onclick="window.location='deleteForm.jsp'"/>
<%	} %>
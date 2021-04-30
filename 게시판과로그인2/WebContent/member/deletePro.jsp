<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.model.MemberDAO" %>  

<h1>deletePro</h1>
<%
	String pw = request.getParameter("pw");
	String id = (String)session.getAttribute("memId"); // 세션 ID
	MemberDAO dao = new MemberDAO();
	boolean result= dao.loginCheck(id, pw);
	if(result){
		dao.statusChange(id);
		session.invalidate();  // 세션 모두 삭제 
		response.sendRedirect("main.jsp");
%>		
<%	}else{ %>
		<script>
			alert("pw 를 확인하세요");
			history.go(-1);
		</script>
<%	} %>



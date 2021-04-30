<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.model.TestBoardDAO" %>       
<h1>deletePro</h1>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	// 글번호에해당하는 DB 삭제후 리스트로 이동 
	TestBoardDAO dao = new TestBoardDAO();
	dao.deleteBoard(num);
%>
	<script>
		alert("삭제 완료");
		window.location="list.jsp";
	</script>
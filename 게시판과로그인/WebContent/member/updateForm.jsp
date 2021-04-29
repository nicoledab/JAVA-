<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.model.MemberDTO" %>
<%@ page import="project.model.MemberDAO" %>    
<h1>updateForm</h1>

<%
	// 세션에 ID를 DB에서 검색 한다. 
	// 검색 결과를 DTO에 대입하여 리턴
	String id = (String)session.getAttribute("memId");
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMember(id); 
	
%>

<form action="updatePro.jsp" method="post">
	id : <%=id%> <br />
	pw : <input type="password" name="pw" value="<%=dto.getPw()%>" /> <br />
	이름 : <input type="text" name="name" value="<%=dto.getName()%>" /> <br />
	나이 : <input type="text" name="age" value="<%=dto.getAge()%>" /> <br />
	가입날짜 : <%=dto.getReg() %> <br />
		  <input type="submit" value="수 정" />
</form>










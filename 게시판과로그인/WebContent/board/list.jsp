<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.model.TestBoardDTO" %>
<%@ page import="project.model.TestBoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<h1>list</h1>
<%
	TestBoardDAO dao = new TestBoardDAO();
	ArrayList<TestBoardDTO> list = dao.getList();
%>
	<table border="1">
		<tr><td>번호</td><td>제목</td><td>작성자</td><td>날짜</td><td>조회수</td></tr>
	<%  for(TestBoardDTO dto : list){  %>
			<tr>
				<td><%=dto.getNum()%></td>
				<td><%=dto.getSubject()%></td>
				<td><%=dto.getWriter()%></td>
				<td><%=dto.getReg()%></td>
				<td><%=dto.getReadcount()%></td>
			</tr>
	<%	} %>
	</table>
	<input type="button" value="글쓰기" onclick="window.location='writeForm.jsp'" />
	
	
	
	
	
	
	
	
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.model.TestBoardDTO" %>
<%@ page import="project.model.TestBoardDAO" %>    
<h1>content</h1>
<%
	int num = Integer.parseInt(request.getParameter("num"));
// 해당 글의 조회수 1증가 
// 글번호에 맞는 내용을 DB에서 가져온다.
	TestBoardDAO dao = new TestBoardDAO();
	dao.readCount(num);
	TestBoardDTO dto = dao.getContent(num);
%>
	글번호 : <%=dto.getNum() %><br />
	작성자 : <%=dto.getWriter() %><br />
	제목 : <%=dto.getSubject() %><br />
	조회수  : <%=dto.getReadcount() %><br />
	작성 날짜 : <%=dto.getReg() %><br />
	<%if(dto.getSave() != null){ %>
		첨부파일 : <%=dto.getSave() %><br />
	<%}%>
	내용 : <%=dto.getContent() %><br />
	 
	 <input type="button" value="수정"  onclick="window.location='updateForm.jsp?num=<%=dto.getNum()%>&writer=<%=dto.getWriter()%>&subject=<%=dto.getSubject()%>&content=<%=dto.getContent()%>'" />                              
	 <input type="button" value="삭제"  onclick="window.location='deleteForm.jsp?num=<%=dto.getNum()%>'"/>
	 <input type="button" value="글목록" onclick="window.location='list.jsp'"/>














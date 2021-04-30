<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>updateForm-글수정</h1>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
%>

<form action="updatePro.jsp"  method="post" enctype="multipart/form-data">
			<input type="hidden" name="num" value="<%=num%>" />
	작성자 : <input type="text" name="writer" value="<%=writer%>" /> <br />
	제 목 : <input type="text" name="subject" value="<%=subject%>"/> <br />
	첨부파일 : <input type="file" name="save" /> <br />
	내용 : <textarea rows="10" cols="40" name="content"><%=content%></textarea> <br />
			<input type="submit" value="글수정" />
</form>












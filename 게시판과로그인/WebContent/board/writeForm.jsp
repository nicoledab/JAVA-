<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>writeFoom -- 게시판 글쓰기 폼</h1>

<form action="writePro.jsp" method="post" enctype="multipart/form-data">
	작성자 : <input type="text" name="writer" /> <br />
	제 목 : <input type="text" name="subject" /> <br />
	첨부파일 : <input type="file" name="save" /> <br />
	내용 : <textarea rows="10" cols="40" name="content"></textarea> <br />
	<input type="submit" value="글쓰기" />
</form>
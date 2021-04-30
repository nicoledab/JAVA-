<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="project.model.TestBoardDTO" %>
<%@ page import="project.model.TestBoardDAO" %>

<h1>updatePro</h1>

    <%
    	String path = request.getRealPath("save");  // 업로드파일 저장 경로
    	String enc = "UTF-8";
    	int size = 1024*1024*10; // 10MB
    	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
    	MultipartRequest mr = new MultipartRequest(request,path,size,enc,dp); // 업로드 진행
    	
    	int num = Integer.parseInt(mr.getParameter("num"));
    	String writer = mr.getParameter("writer");
    	String subject = mr.getParameter("subject");
    	String content = mr.getParameter("content");
    	String save = mr.getFilesystemName("save"); // 파일명 
    	
    	TestBoardDTO dto = new TestBoardDTO();
    	dto.setNum(num);
    	dto.setWriter(writer);
    	dto.setSave(save);
    	dto.setSubject(subject);
    	dto.setContent(content);
    	
    	TestBoardDAO dao =new TestBoardDAO();   
    	dao.updateBoard(dto); 
    %>
    <script>
		alert("수정 되었습니다..");
		window.location="content.jsp?num=<%=num%>";
	</script>
	
	
	
	
	
	
	
	
	
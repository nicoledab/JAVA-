<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.dto.ReviewBoardDTO" %>
<%@page import="user.dto.ReviewBoardDAO" %>
<%@page import="java.util.ArrayList" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<html>
<head>
<title> review 글쓰기 </title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
<jsp:include page="Header.jsp"/> 
</head>
<h1>Review 글쓰기 </h1>

<% 
 	//해당 게시글의 넘버/ ex= http://localhost:8080~content.jsp?num=3
	int num = Integer.parseInt(request.getParameter("num"));
String pageNum= request.getParameter("pageNum");

	// 해당 글의 조회수 1증가
	// 글번호에 맞는 내용을 DB에서 가져온다. 
	//readcount , getContent 호출
	ReviewBoardDAO dao = new ReviewBoardDAO();
	
	dao.readCount(num);
	ReviewBoardDTO dto = dao.getContent(num);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<!-- 
<table>
 <tr> 
 <td> 글번호 : </td><td><%=dto.getNum() %> </td> 
 </tr>
  <tr> 
 <td>작성자 : </td><td><%=dto.getWriter() %></td> 
 </tr>
  <tr> 
 <td>제목 : </td><td><%=dto.getSubject() %></td>
 </tr>
  <tr> 
 <td>조회수 :</td><td><%=dto.getReadcount() %></td>
 </tr>
  <tr> 
 <td>작성 날짜 : </td><td><%=dto.getReg_date() %></td>
 </tr>
  <tr> 
 <td>첨부파일 :</td><td><%=dto.getSave() %></td>
 </tr>
    <tr> 
 <td>내용  : </td><td><%=dto.getContent() %></td>
 </tr> 
</table> -->




<br>
<table width="500" border="1" cellspacing="0" cellpadding="0"   align="center" class="table table-striped">  
	<tr height="30">
		<td align="center" width="125" >글번호</td>
		<td align="center" width="125" align="center"><%=dto.getNum()%></td>
	    <td align="center" width="125" >조회수</td>
	    <td align="center" width="125" align="center"><%=dto.getReadcount()%></td>
  </tr>
  <tr height="30">
	    <td align="center" width="125" >작성자</td>
	    <td align="center" width="125" align="center"><%=dto.getWriter()%></td>
	    <td align="center" width="125"  >작성일</td>
	    <td align="center" width="125" align="center"><%= sdf.format(dto.getReg_date())%></td>
  </tr>
  <tr height="30">
		<td align="center" width="125" >글제목</td>
		<td align="center" width="375" align="center" colspan="3"><%=dto.getSubject()%></td>
  </tr>
  <tr>
	    <td align="center" width="125" >글내용</td>
	    <td align="left" width="375" colspan="3"><pre><%=dto.getContent()%><br /><br /><%=dto.getSave() %></pre></td>
  </tr>
  <%-- 
    <tr>
	    <td align="center" width="125" >사진 </td>
	    <td align="left" width="375" colspan="3"><pre><%=dto.getSave() %></pre></td>
  </tr>--%>
  <tr height="30">      
	    <td colspan="4"  align="right" > 
		
		<%
		String id =(String)session.getAttribute("memId");
		if(id != null) { 
		      if(id.equals(dto.getWriter())){ %>
			<input type="button" value="수정"  onclick="window.location='rupdateForm.jsp?num=<%=dto.getNum()%>&writer=<%=dto.getWriter()%>&subject=<%=dto.getSubject()%>&content=<%=dto.getContent()%>'" />
	<input type="button" value="삭제" onclick="window.location='rdeleteForm.jsp?num=<%=dto.getNum()%>'" />
	
	<%}%>
	<%}%>		
     	<input type="button" value="글목록" onclick="window.location='reviewlist.jsp'" />
     	
     	<!-- 연결되면 코드 지우기! -->
     	<input type="button" value="수정"  onclick="window.location='rupdateForm.jsp?num=<%=dto.getNum()%>&writer=<%=dto.getWriter()%>&subject=<%=dto.getSubject()%>&content=<%=dto.getContent()%>'" />
	    <input type="button" value="삭제" onclick="window.location='rdeleteForm.jsp?num=<%=dto.getNum()%>'" />
	
     	
     	
	    </td>
  </tr>
</table>




<!--  
	<input type="button" value="수정"  onclick="window.location='rupdateForm.jsp?num=<%=dto.getNum()%>&writer=<%=dto.getWriter()%>&subject=<%=dto.getSubject()%>&content=<%=dto.getContent()%>'" />
	<input type="button" value="삭제" onclick="window.location='rdeleteForm.jsp?num=<%=dto.getNum()%>'" />
	<input type="button" value="글목록" onclick="window.location='reviewlist.jsp'" />

-->


     

     

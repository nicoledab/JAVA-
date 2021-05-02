<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="user.dto.ReviewBoardDTO" %>
<%@page import="user.dto.ReviewBoardDAO" %>

<%String enc = "UTF-8"; //한글 인코딩 
String id = (String)session.getAttribute("memId");

int num = Integer.parseInt(request.getParameter("num"));
String writer = request.getParameter("writer");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
String save = request.getParameter("save");


%>
<html>
<head>
<title> 후기게시판 </title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>


<jsp:include page="Header.jsp"/> 


</head>




<%-- 
<%
if(id == null){
 %>
     <script> 
       alert("로그인 후 글쓰기 가능합니다!");
       window.location='/jsp/0416/LoginForm.jsp';   
     </script>
     
<%}%>
--%>





<body>  
<center><b>~후기~</b>  <div style="font-size: xx-large;"> Review </div>  </center>
<br>
<form method="post" name="writeform" enctype="multipart/form-data" action="rupdatePro.jsp" onsubmit="return writeSave()">
<input type="hidden" name="num" value="<%=num%>">

 <%--
<input type="hidden" name="ref" value="<%=ref%>">
<input type="hidden" name="re_step" value="<%=re_step%>">
<input type="hidden" name="re_level" value="<%=re_level%>">
 --%>
<%--<table width="400" border="1" cellspacing="0" cellpadding="0"  align="center"> --%>

  
 <table class="table table-striped">  
  
   <tr>
    <td align="right" colspan="2" >
	    <a href="reviewlist.jsp"> review로 돌아가기 </a> 
   </td>
   </tr>
   <tr>
    <td  width="70"   align="center">이 름</td>
    <td  width="330">
   		   <%=id%>    
        <input type="hidden" name="writer" value="<%=id%>">
       </td>
  </tr>
  <tr>
    <td  width="70"   align="center" >제 목</td>
    <td  width="330">
    <%if(request.getParameter("num")==null){%>
       <input type="text" size="40" maxlength="50" name="subject" value="<%=subject%>">
	<%}else{%>
	  <input type="text" size="40" maxlength="50" name="subject" value="<%=subject%>">
	<%}%></td>
  </tr>
  
  
  
 <!--  <tr>
    <td  width="70"   align="center">Email</td>
    <td  width="330">
       <input type="text" size="40" maxlength="30" name="email" ></td>
  </tr> -->
  <tr>
    <td  width="70"   align="center" >내 용</td>
    <td  width="330" >
     <textarea name="content" rows="14" cols="70"><%=content%></textarea> </td>
  </tr>
 <!--   <tr>
    <td  width="70"   align="center" >비밀번호</td>
    <td  width="330" >
     <input type="password" size="8" maxlength="12" name="passwd"> 
	 </td>
  </tr>-->
   <tr>
    <td  width="70"   align="center" >파일 선택</td>
    <td  width="330" >
    <!--  <input type="file" name ="savePic" />    -->
     <input type="file" name="save" multiple/>
	 </td>
  </tr>
    <!--  <tr>
    <td  width="70"   align="center" >파일 선택2</td>
    <td  width="330" >
     <input type="file" name ="save2" />
	 </td>
  </tr> -->

<tr>      
 <td colspan=2  align="center"> 
  <input type="submit" value="글쓰기" >  
  <input type="reset" value="다시작성">
  <input type="button" value="목록보기" OnClick="window.location='reviewlist.jsp'">
</td></tr></table>    
   
</form> 

     
</body>
</html> 





<%-- 

 
<%
    String enc = "UTF-8"; //한글 인코딩 
   int num = Integer.parseInt(request.getParameter("num"));
   String writer = request.getParameter("writer");
   String subject = request.getParameter("subject");
   String content = request.getParameter("content");
%>

<form action="rupdatePro.jsp"  method="post" enctype="multipart/form-data">
         <input type="hidden" name="num" value="<%=num%>" />
   작성자 : <input type="text" name="writer" value="<%=writer%>" /> <br />
   제 목 : <input type="text" name="subject" value="<%=subject%>"/> <br />
   첨부파일 : <input type="file" name="save" /> <br />
   내용 : <textarea rows="10" cols="40" name="content"><%=content%></textarea> <br />
         <input type="submit" value="글수정" />
</form>
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="membersJava.MemberDAO2" %>
<%@ page import="membersJava.Limit0409" %>

    <h1> update Form 페이지 </h1>
    
    <%
    String id = (String) session.getAttribute("memId");
    MemberDAO2 dao = new MemberDAO2();
    Limit0409 dto = dao.getMember(id);
    
    %>
    
    <form action="MupdatePro.jsp" method="post" enctype="multipart/form-data">
      id : <%=id%> <br />
     
     pw : <input type="password" name="pw" value="<%=dto.getPw()%>" /> <br />
     name : <input type="text" name="name" value="<%=dto.getName()%>" /> <br />
     age : <input type="text" name="age" value="<%=dto.getAge()%>" /> <br />
     
    <%-- address : <input type="text" name="address" value="<%=dto.getAddress() %>" /> <br />--%> 
     email : <input type="text" name="email" value="<%=dto.getEmail()%>" /> <br />
     phone : <input type="text" name="tel_h1" value="<%=dto.getTel_h1()%>" /> <br />
     
     <%-- 
     img : <%if(dto.getImg() == null) { %>
      <input type="file" name="img" /> 대표이미지를 등록하세요  <br />
            <%}else{%>
            <img src="/jsp/save/<%=dto.getImg()%>"/> <br/>
            <input type ="file" name="img" /> 수정 <br /> 
            
       <%}%>    --%>
       
       
       <input type="submit" value ="정보 수정" /> 
    </form>
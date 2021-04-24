<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%@ page import="membersJava.MemberDAO2" %>
<%@ page import="membersJava.Limit0409" %>
    
    <h1> updatePro 페이지 !!</h1>
    
    <%
    String path = request.getRealPath("save");
    String enc="UTF-8"; //
    int max = 1024*1024*10;
    DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
    MultipartRequest mr = new MultipartRequest(request,path,max,enc,dp);
    
    String id =(String)session.getAttribute("memId");
    String pw = mr.getParameter("pw");
    String name = mr.getParameter("name");
    String age = mr.getParameter("age");
    String address = mr.getParameter("address");
    String email = mr.getParameter("email");
    String tel_h1 = mr.getParameter("tel_h1");
    String img = mr.getFilesystemName("img");
    
    Limit0409 dto = new Limit0409();
    dto.setId(id);
    dto.setPw(pw);
    dto.setName(name);
    dto.setAge(age);
    dto.setAddress(address);
    dto.setEmail(email);
    dto.setTel_h1(tel_h1);
    
   // dto.setImg(img); img 컬럼이 없다. 
    
    
    MemberDAO2 dao = new MemberDAO2();
    dao.updateMember(dto);
    
    
    %>
    
    <script>
     alert("수정되었습니다.")
     window.location= "Mmain.jsp";
    </script>
    
    
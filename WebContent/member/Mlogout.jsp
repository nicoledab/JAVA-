<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
       
    <h1> logout 페이지 (실습)</h1>
    
    <%
     session.invalidate(); // user 와 관계된 모든 세션 삭제 
     
    /* Cookie [] cookies = request.getCookies();
     for(Cookie coo : cookies){ //갖고 있는 쿠키갯수 만큼 반복 
   	  String name = coo.getName();
   	  if(name.equals("cooId")){
   		  System.out.println(coo.getMaxAge());
   		  coo.setMaxAge(0);
   		  response.addCookie(coo);
   	  }
     } //for 끝  */
     
     
     %>
    
    <script>
		alert("로그아웃 되었습니다!");
  		window.location= "login.jsp";
</script>
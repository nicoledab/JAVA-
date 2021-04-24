<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="membersJava.MemberDAO2" %>
<h1> loginpro 페이지(내 실습) </h1>

<jsp:useBean id="dto"  class="membersJava.Limit0409" />
<jsp:setProperty property="*" name="dto" /> 

<%
    //TestMemberDAO id/pw 확인
    MemberDAO2 dao = new MemberDAO2();
     boolean result = dao.loginCheck(dto);
     
     if(result){
    	    // 세션 생성 -id 저장       key    / value    로 이루어진 map 타입
    //세션 방식: 
    	session.setAttribute("memId", dto.getId());
	
    	    
    	 /*     //쿠키 방식
    	    Cookie coo = new Cookie("cooId", dto.getId());
    	    // 쿠키 유효기간 설정 
    	    coo.setMaxAge(60); // 60초후 쿠키 자동 삭제
    	    
    	         //이건 자동로그인할때 필요! -  Cookie coo2 = new Cookie("cooPw", dto.getPw());
    	    response.addCookie(coo);  //사용자에 전달*/
    	    
    	    response.sendRedirect("Mmain.jsp");
     }else {%>
    	 <script>
			alert("아이디/비밀번호 확인하세요 ...!");
			history.go(-1)		//이전 페이지로 가세요-라는 의미
			
			</script>
   <%  } %>
     
     
      
    
    
    
    
    <%-- 
    <% 
     String id = request.getParameter("id");
     String pw = request.getParameter("pw");
     String result = "없는 회원입니다 :( ";
     %>
     
     <% 
     // id : 5글자 이상 / 첫글자는 무조건 알파벳 
     int size= id.length();
     if(size >=5 && size <= 9){ //5~9 사이만 true
    	 char s = id.charAt(0); //첫글자 확인 
     	if( s >= 65 && s <= 122){
    	 	result = id + " 확인되었습니다.";
     	}
     }
     
    %>
    <h2> 결과 : <%= result %></h2>
    
         <form action="member.jsp" method="post"> 
     <input type="submit" value= "회원가입하러 가기" id="btnNewMember"> 
     </form>
    --%>
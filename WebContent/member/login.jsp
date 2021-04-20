<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <h1> Login 실습 </h1>



<form action="loginpro.jsp" method="post">
   id : <input type="text" name="id" /> <br/>
   pw : <input type="password" name="pw" /> <br/>
     <input type="submit" value ="로그인" /> <br/>
     <a href="http://naver.com">아이디</a> /
 <a href="http://google.com">패스워드</a> 찾기 <br />

</form>
    
  <h4> 처음 오셨나요?  </h4>
   <form action="member.jsp" method="post"> 
<input type="submit" value= "회원가입" id="btnNewMember"> 
</form> 
    
    
    <%-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 </title>
</head>
<body>
<form action="loginpro.jsp" method="post">   

<table> 
<tr>
<td colspan ="2"><pre> <b>          * 회원 로그인 *</b></pre>  </td>
</tr>
<tr> 
<td>아이디 :</td>
<td><input type="text" name="id"></td>
</tr>

<tr> 
<td>패스워드 :</td>
<td><input type="password" name="pw"></td>
</tr>

<tr> 
<td colspan="2">
<input type="submit" value="로 그 인"  />  



<br />
<br />
<a href="http://naver.com">아이디</a> /
 <a href="http://google.com">패스워드</a> 찾기 <br />
 </td>
 
 </tr>
</table>
</form>


<form action="member.jsp" method="post"> 
<input type="submit" value= "회원가입" id="btnNewMember"> 
</form>




</body>
</html>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%--   <%@ page import="java.util.Enumeration" %> --%>  

<%@ page import="membersJava.Limit0409" %>
<%@ page import="membersJava.Limit0409" %>
<%@ page import="membersJava.Limit" %>


<h1> 회원정보 member result:  </h1>


<% 
request.setCharacterEncoding("UTF-8");  //한글처리용 



/*
String id = request.getParameter("id"); //key를 넣어서 value에 대입.
String pw = request.getParameter("pw");
String gender = request.getParameter("gender");
String jumin1 = request.getParameter("jumin1");
String age = request.getParameter("age");
String pwhint = request.getParameter("pwhint");
String pwhintans = request.getParameter("pwhintans");
String email = request.getParameter("email");
String addre = request.getParameter("addre");
String addre2 = request.getParameter("addre2");
String tel_h1 = request.getParameter("tel_h1");
String resultid = "형식에 맞지 않습니다.";

// id : 5글자 이상 / 첫글자는 무조건 알파벳 
int size= id.length();
if(size >=5 && size <= 9){ //5~9 사이만 true
	 char s = id.charAt(0); //첫글자 확인 
	if( s >= 65 && s <= 122){
		resultid = id + " 확인되었습니다.";
	}
}
*/

%>  


  <jsp:useBean class="membersJava.Limit0409" id="limit" />
  <jsp:useBean class="membersJava.Limit" id="limitpw" />
   


  <jsp:setProperty name="limit" property="*" />



<%--       모두 꺼내주는 형식~~~
<%
    
		 Enumeration enu = request.getParameterNames(); //해당 모든 이름(key)을 다꺼내준다.
		while(enu.hasMoreElements()){ //hasMoreElement- 값이 있는지 판단하는. 
			String key = (String)enu.nextElement(); // 꺼내준다는 뜻. 
			String value = request.getParameter(key);
			String result2 = "비어있습니다";
			
			if(value== null){
				value=result2;
			}
			
%>			<h3><%=key+" = " + value %> </h3>
	<%}   %>
	
--%>	
	
   <h1> name = <jsp:getProperty name="limit" property="name" /></h1>
   <h1> id = <jsp:getProperty name="limit" property="id" /></h1>
   <h1> pw = <jsp:getProperty name="limit" property="pw" /></h1>
   <h3> 비번 확인 = <jsp:getProperty name="limit" property="pwc" /></h3>
   <h3> 비번 힌트 답 = <jsp:getProperty name="limit" property="pwhintans" /></h3>
   <h3> age = <jsp:getProperty name="limit" property="age" /></h3>
  <h3> 성별 = <jsp:getProperty name="limit" property="gender" /></h3>
  <h3> email = <jsp:getProperty name="limit" property="email" /></h3>
  <h3> 전화번호 = <jsp:getProperty name="limit" property="tel_h1" /></h3>
  <h3> 주민등록번호 = <jsp:getProperty name="limit" property="jumin1" /></h3>
   <h3> address = <jsp:getProperty name="limit" property="addre" /></h3>
   <h3>  [상세주소] <jsp:getProperty name="limit" property="addre2" /></h3>

	

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="membersJava.MemberDAO2" %> 
<h1>로그인 확인 </h1>

<%
  String id = request.getParameter("id");
   MemberDAO2 dao = new MemberDAO2();
	boolean result = dao.idCheck(id);

	if(result){%>
	<h3> 입력한 [<%=id%>] 사용중입니다.<br> 다른 id를 사용하세요. </h3>
   <%}else{%>
   <h3>입력한 [<%=id%>] 사용가능 아이디입니다. </h3>
   <%}%>
                              
 <input type="button" value="닫기" onclick="selfClose();"/>


<script type="text/javascript">  
function selfClose(){
	var r = <%=result%>;
	var h ="<b><font color=green>id사용가능</font></b>";
	if(r){
		//opener.document.getElementById("idresult").innerHTML="<b><font color=red>불가능</font></b>";
		h ="<b><font color=red>id사용불가능</font></b>";
	}
	// opner = 부모 페이지/부모의 전체내용/idresult 찾고/
	opener.document.getElementById("idresult").innerHTML=h;
	self.close();
}

</script>

   
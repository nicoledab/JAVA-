<%@ page contentType="text/html;charset=UTF-8" %>


<%@ page import= "membersJava.BoardDBBean" %>
<%@ page import= "membersJava.BoardDataBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="article" scope="page" class="membersJava.BoardDataBean" />
<jsp:setProperty name="article" property="*" />

<%
   String pageNum = request.getParameter("pageNum");

  BoardDBBean dbPro = new BoardDBBean();
  int check = dbPro.updateArticle(article);
  
  if(check==1){
%>
   <meta http-equiv="Refresh" content="0;url=Mlist.jsp?pageNum<%=pageNum%>" >
   <%}else{ %>
   <script type="Javascript">
  alert("비밀번호가 맞지 않습니다");
        history.go(-1);
</script>

<%} %>


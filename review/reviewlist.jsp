<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.dto.ReviewBoardDTO" %>
<%@page import="user.dto.ReviewBoardDAO" %>
<%@page import="java.util.ArrayList" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.List" %>
<%


/*int pageSize = 10;   // 한페이지에 보여질 게시물수 ! 
                                            // 작성날짜 해당 형식으로 보기 위함:아래 95라인에서 사용
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 

    String pageNum = request.getParameter("pageNum"); // 리스트에서 페이지번호 클릭시 받을수있다.
    if (pageNum == null) {
        pageNum = "1";     //    페이지 번호. 1페이지~n페이지
    }
    int currentPage = Integer.parseInt(pageNum);  // 1   /   2 
    int startRow = (currentPage - 1) * pageSize + 1; //(1-1) * 10 + 1 = 1  // 11
    int endRow = currentPage * pageSize; //1 * 10 = 10   // 2*10=20
    int count = 0;     // 전체 게시물수 ... 
    int number=0;      //화면의 글 번호(DB의 글번호가 아님)

    List reviewList = null;
    ReviewBoardDAO dbPro =new ReviewBoardDAO();
    
    count = dbPro.getreviewCount(); //ctrl +마우스 대면 해당 메소드로 이동
    // 전체 
	number=count-(currentPage-1)*pageSize; // count(10)-(1-1)*10 = 10
			*/
			
			
	String id =(String)session.getAttribute("memId");
%>


<html>
<head>
<title> 후기게시판 </title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
<jsp:include page="Header.jsp"/> 





</head>


    <h1>Review List</h1>
    <%-- dto는 하나의 db 정보만...
     dto를 모두 보관하는 array list--%> 
     
     
       <form action="rsearchList.jsp" method="post">
  		 <select name="col"> 
            <option value="subject">가격대 선택<option> 
            <option value="subject">선택 안함<option> 
            <option value="price2">2만원 이하<option> 
            <option value="price35">3~5만원<option> 
            <option value="price5">5만원 이상<option> 
   		</select>
   		<input type="text" name="search" /> 
   		<input type="submit" value="검색" /> 
   </form>
     <%
     ReviewBoardDAO dao = new ReviewBoardDAO();
     ArrayList<ReviewBoardDTO> list = dao.getList(); 
       %>    
       
       
  <table  class="table table-striped">
  <tr>
    <td>번호</td><td>작성자</td><td>제목</td><td>날짜</td><td>조회수</td>
  </tr>
  <%
     for(ReviewBoardDTO dto : list){ %>
     <tr>
        <td><%=dto.getNum()%></td>
         <td><%=dto.getWriter()%></td>
        <td>
         
         <a href="rcontent.jsp?num=<%=dto.getNum()%>">  <%=dto.getSubject()%>  </a> 
           
        </td>
        
        <%-- <td>
           <%if(dto.getStatus() ==3){ %>
           해당 글은 삭제 되었습니다.
           <%}else{%>
         <a href="rcontent.jsp?num=<%=dto.getNum()%>">  <%=dto.getSubject()%>  </a> 
           <%}%>
           </td>
            --%>
        <td><%=dto.getReg_date() %></td>
        <td><%=dto.getReadcount()%></td>
      </tr>
   <%} %>
   

   
</table>

<!--  연결하면 이 코드는 지우기!  -->
<input type="button"  value="후기 작성" onclick="window.location='rwriteForm.jsp'"  />


<%if(id != null){ %>
    		<a href="rwriteForm.jsp">후기 작성 </a> 
    			<input type="button"  value="후기 작성" onclick="window.location='rwriteForm.jsp'"  />
    		<%}else{ %>
    		<input type="button"  value="로그인하러 가기" onclick="window.location='/jsp/0416/LoginForm.jsp'"  />
    		<%} %>


     
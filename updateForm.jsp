<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.model.bean.EtcDTO" %>
<%@ page import="test.model.bean.EtcDAO" %>

<%
	EtcDAO dao = new EtcDAO();
	EtcDTO dto = dao.getEtc(); 
%>

<h1>updateForm 페이지</h1>


	<form action="updatePro.jsp">
    	전화번호 : <select name="ph1">
    				<option <%if(dto.getPh1().equals("skt")){%>selected<%}%>>skt</option>
    				<option <%if(dto.getPh1().equals("kt")){%>selected<%}%>>kt</option>
    				<option <%if(dto.getPh1().equals("u+")){%>selected<%}%>>u+</option>
    				<option <%if(dto.getPh1().equals("기타")){%>selected<%}%>>기타</option>
    			</select>
    			<input type="text" name="ph2" value="<%=dto.getPh2()%>">-
    			<input type="text" name="ph3" value="<%=dto.getPh3()%>">-
    			<input type="text" name="ph4" value="<%=dto.getPh4()%>">
    			<br />
		성별 : <input type="radio" name="gender" value="man" <%if(dto.getGender().equals("man")){%>checked<%}%>>남
			  <input type="radio" name="gender" value="woman" <%if(dto.getGender().equals("woman")){%>checked<%}%>>여
			  <br />
		취미 : 	
				<%	String [] ch = dto.getCh();%>
				<input type="checkbox" name="ch" value="컴퓨터" <%for(String c : ch){if(c.equals("컴퓨터")){%>checked<%}}%> />	컴퓨터
				<input type="checkbox" name="ch" value="인스타" <%for(String c : ch){if(c.equals("인스타")){%>checked<%}}%> /> 인스타
				<input type="checkbox" name="ch" value="등산" <%for(String c : ch){if(c.equals("등산")){%>checked<%}}%> />	등산
				<input type="checkbox" name="ch" value="낚시" <%for(String c : ch){if(c.equals("낚시")){%>checked<%}}%> />	낚시
				<br />		  
		날짜 : <input type="date" name="day" value="2021-04-19" /> <br />				
		요구사항 : <textarea name="content"><%=dto.getContent()%></textarea>
		<br />
		<input type="submit" value="전송" />
    </form>
    
    
    
    
    
    
    
    
    
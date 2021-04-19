<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <% request.setCharacterEncoding("UTF-8"); %>
 <jsp:useBean id="dto" class="test.model.bean.EtcDTO" />
 <jsp:setProperty property="*" name="dto" />
 
 <%
 	test.model.bean.EtcDAO dao = new test.model.bean.EtcDAO();
 	dao.insert(dto);
 %>
 <h1> 추가 되었습니다. ..</h1>
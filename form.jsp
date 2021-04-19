<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <form action="insert.jsp">
    	전화번호 : <select name="ph1">
    				<option>skt</option>
    				<option>kt</option>
    				<option>u+</option>
    				<option>기타</option>
    			</select>
    			<input type="text" name="ph2">-
    			<input type="text" name="ph3">-
    			<input type="text" name="ph4">
    			<br />
		성별 : <input type="radio" name="gender" value="man">남
			  <input type="radio" name="gender" value="woman">여
			  <br />
		취미 : <input type="checkbox" name="ch" value="컴퓨터" />	컴퓨터
				<input type="checkbox" name="ch" value="인스타" />	인스타
				<input type="checkbox" name="ch" value="등산" />	등산
				<input type="checkbox" name="ch" value="낚시" />	낚시
				<br />		  
		날짜 : <input type="date" name="time" /> <br />				
		요구사항 : <textarea name="content"></textarea>
		<br />
		<input type="submit" value="전송" />
    </form>
    
    
    
    
    






    
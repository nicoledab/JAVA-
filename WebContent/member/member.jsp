<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="membersJava.Limit0409" %>    
<%@ page import="membersJava.MemberDAO2" %>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원가입</title>
</head>

<script  type="text/javascript">
   function test(num){
      a = 100;
      alert("알림창"+a+num);
   }
   
   //----------------------------아이디 중복확인
   function confirm(){      
	   var id= document.inform.id.value; 
	   //document.inputForm.id - 현재페이지 전체.formname.이름
	  
	   //새창경로 ,   이름(아무이름없음),        새창옵션 
	   open("loginConfirm.jsp?id="+id,"confirm","width=400,height=300");   //새창 실행 함수 
    //         주소 뒤에 파라미터. 띄어진 새창 주소에 아이디가 있음.
   }
   
   
   function sub(){
	   
       //-----------------------이름 입력 
	      var name = document.inform.name.value;  
	      if(name){
	      }else{
	    	 alert("이름을 입력하세요");
	    	 document.inform.name.focus();
	    	 return false;
	      }//                   https://s262701-id.tistory.com/64
	       
	      
	      
	      var id = document.inform.id.value;  
	      if(id.length < 6 || id.length > 16) {
	  		alert('아이디를 6~16 글자로 입력하세요');
	  		document.inform.id.focus();
	  		return false;
	  		}
	      
	      
	      
	      var pw = document.inform.pw.value;
	     if (pw==id) {
          alert("아이디와 비밀번호가 같습니다.")
          document.inform.pw.focus();
          return false;
      }
	      
	      
	      
	      //비밀번호 체크
	      if(document.inform.pw.value != document.inform.pwc.value){
	    	  alert("password가 서로 다릅니다.");
	    	  return false; 
	      }
	  
	      
	  /* //-----------------------성별체크
      var gender = document.inform.gender.value;  
      if(gender){
    	  
      }else{
    	 alert("성별 체크해주세요");
    	 return false;
      }     */
	      
	      
       //-----------------------생년월일 입력 
      var day = document.inform.day.value;  
      if(day){
      }else{
    	 alert("생년월일을 입력하세요");
    	 document.inform.day.focus();
    	 return false;
      }
      
      
       /*     
	   //----------------------------아이디
      var id = document.inform.id.value;
      if(id){
    	 // alert(" 입력되었습니다.");
    	  
      }else{
    	  alert("id를 입력하세요");
    	  document.inform.id.focus();
    	  return false;
      }
      */
      
      
      /*
      //---------------------------비번
      var pw = document.inform.pw.value;
      var pwc = document.inform.pwc.value;
      if(pw!= pwc){
    	  alert(" 비밀번호를 를 동일하게 입력하세요.");
    	  return false;
      }*/
    
      
 
      
      
      
      
      // 주민번호 숫자가 아닌 것을 입력한 경우
      /*
       var jumin1 = document.inform.jumin1.value;
       var jumin2 = document.inform.jumin2.value;
      if (!isNumeric(jumin1)) {
          alert("주민번호는 숫자로 입력하세요.");
          document.f.personnumber1.value = "";
          document.f.personnumber1.focus();
          return false;
      }
     
      if (!isNumeric(jumin2)) {
          alert("주민번호는 숫자로 입력하세요.");
         document.f.personnumber1.value = "";
         document.f.personnumber1.focus();
          return false;
      }*/
      
      
      //  핸드폰 넘버 확인
      
        
      
      
      
   } //sub() 끝
   
</script>


<h1>회원가입 : 정보 입력 </h1>
<form name="inform" action="MemInsert.jsp" method="post" onsubmit="return sub();" > 
    <table  style="padding:10px 0 5px 0; ">
   
    <tr>
		<th> 이름 </th>
    	<td><input type="text" name="name"> </td>
    </tr>
    
    <tr>
    <th> 성별 </th> 
    <td> <input type= "radio" name ="gender" value="man"/> 남자 
     <input type= "radio" name ="gender" value="woman" /> 여자 </td>
    </tr>
    
    <tr> 
    <th> 생년월일 (8자리)</th>
    <td><input type="text" name="day"> </td>
    </tr>
    
    <tr>
    	<th> 주민등록번호 </th>
    	<td><input type="text" name="jumin1">-<input type="text" name="jumin2"> </td>
    	
     </tr>
     
     <tr>
     <th> 아이디 </th>
     <td> <input type="text" name="id"><input type="button" value="id 중복확인" onclick= "confirm();"/> <label id="idresult"></label>  </td>
      </tr>
     
     <tr>
		<th> 비밀번호 </th>
    	<td><input type="password" name="pw"> 영문/숫자포함 6자 이상</td>
    </tr>
     
    
     <tr>
		<th> 비밀번호 확인 </th>
    	<td><input type="password" name="pwc"> </td>
    </tr>
      
    <tr> 
     <th> 비밀번호 힌트 </th>
     <td><select name='pwhint' size ='1' class= 'select'>
     <option value=''>선택</option>
     <option value='30'>아버지 성함은?</option>
          <option value='31'>어머니 성함은?</option>
          <option value='32'>어릴 적 내 별명은?</option>
          <option value='33'>가장 아끼는 물건은?</option>
          <option value='34'>어릴적 키우던 애완동물 이름은? </option>
     </select>
    </tr>
    
    
   <tr>
        
           <th>답변</th>
           <td><input type='text' name='pwhintans'></td>
        </tr>
  
  
      <tr>
		<th> 이메일 </th>
    	<td><input type="text" name="email"> </td>
    </tr>
  
  <tr> 
  <th> 주소 </th>
    <td>   
  <input type="text" name="addre">   
          상세주소: <input type="text" name="addre2">  
    </td>
  </tr>
  
 
   <tr> 
   <th> 통신사 </th>
   
   <td> <select name="">
    <option value="s"> skt </option>
    <option value="kt">kt </option>
    <option value="u">u+ </option>
 </select> </td>
   </tr>

   <tr>
          <th>핸드폰 번호</th>
           <td><input type="text"name="tel_h1"> 
           </td>
   </tr>

  <tr>
         <th>메일/sns 정보 수신</th>
           <td class="s">
               <input type="radio" name="chk_mail" checked> 수신
               <input type="radio" name="chk_mail" value="4"> 수신거부
            </td>
         </tr>

    <tr height="2" bgcolor="#A9F5D0"> <td colspan="2"></td></tr> 
           <tr>
             <td colspan="2" align="center"> <br />  
               <input type="submit" value="회원가입">
               <input type="reset" value="취소">
            </td>
           </tr>

   
    </table>
    </form>
</html>
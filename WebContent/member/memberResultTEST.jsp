<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="membersJava.Limit"%> 



<%

request.setCharacterEncoding("UTF-8"); // post방식 한글 인코딩


String name = request.getParameter("name");
String id = request.getParameter("id"); //key를 넣어서 value에 대입.
String pw = request.getParameter("pw");
String pwc = request.getParameter("pwc");
String gender = request.getParameter("gender");
String jumin1 = request.getParameter("jumin1");
String age = request.getParameter("age");
String pwhint = request.getParameter("pwhint");
String pwhintans = request.getParameter("pwhintans");
String email = request.getParameter("email");
String addre = request.getParameter("addre");
String addre2 = request.getParameter("addre2");
String tel_h1 = request.getParameter("tel_h1");
String chk_mail = request.getParameter("chk_mail");
String idresult = "형식에 맞지 않습니다!";
String pwresult = "형식에 맞지 않거나 비어있습니다";
String pwcresult = "형식에 맞지 않거나 비어있습니다";
String nameresult = "비어있습니다";
String eresult = " 비어있습니다";
String juminresult = " 비어있습니다";
String addreresult = " 비어있습니다";
String genderresult = " 체크되지 않았습니다.";
String hintansresult = " 비어있습니다";

// -------------id : 5글자 이상 / 첫글자는 무조건 알파벳 
int size = id.length();
if (size >= 5 && size <= 9) { //5~9 사이만 true
	char s = id.charAt(0); //첫글자 확인 
	if (s >= 65 && s <= 122) {
		idresult = id + " 확인되었습니다.";
	}
}

//--------------------------------비번
if (pw != null) {
	Limit idlm = new Limit(); //자바 클래스 호출 

	boolean a = idlm.charLength(pw, 6, 9);
	boolean b = idlm.charBig(pw);
	boolean c = idlm.charsmall(pw);
	pwresult = pw;
}

if (pw != null && pw != "") {
	pwresult = pw;
}

if (pwc != null && pwc != "") {
	pwcresult = pwc;
}

//--------------------------------이름

if (name != null && name != "") {
	nameresult = name;
}

//--------------------------------성별

if ((gender == "male") && (gender == "female")) {
	genderresult = gender;
}

// ----------------주민번호 1 

if (jumin1 != null && jumin1 != "") {
	juminresult = jumin1;
}

// ----------------주소  
if (addre != null && addre != "") {
	addreresult = addre;
}

// ----------------비번 힌트 

if (pwhintans != null && pwhintans != "") {
	hintansresult = addre;
}

//---------------------------------------------------
/*  주석처리 ~~~~~~~~~~~~~~~
int size2 = pw.length();
if(size2 >=6 && size2 >= 9 ){
 pwresult = " 확인되었습니다.";
}
*/

//------------------------------------이메일
if (email != null && email != "") {
	eresult = email;
}

// ------생년월일 입력받아 나이로 출력 입력 예) 19960614  출력= 32세
String day = request.getParameter("day");
java.util.Date d = new java.util.Date(); //오늘 날짜

//오늘 날짜에서 년도만 추출 - 날짜는 1900년도에서 지나간 시간을 출력하기 때문에 1900을 더한다. 
int year = d.getYear() + 1900;

// 입력받은 생년월일에서 년도 추출 19960315 에서 앞 4자리 잘라낸 후 숫자로 변경
year = year - Integer.parseInt(day.substring(0, 4));
%>


<h3>
	이름 :<%=nameresult%></h3>
<h3>
	나이 :
	<%=year%>세
</h3>
<h3>
	성별 :
	<%=genderresult%></h3>
<h3>
	주민등록번호 :
	<%=juminresult%>
</h3>
<h3>
	아이디 :
	<%=idresult%></h3>
<h3>
	비밀번호 :
	<%=pwresult%></h3>
<h3>
	비밀번호 확인 :
	<%=pwcresult%></h3>
<h3>
	비밀번호 힌트 답 :
	<%=hintansresult%></h3>
<h3>
	이메일 : 
	<%=eresult%></h3>
<h3>
	전화번호 :
	<%=tel_h1%></h3>
<h3>
	주소 :
	<%=addreresult%>
	<%=addre2%></h3>
<h3>
	수신 상태 :
	<%=chk_mail%></h3>





package membersJava;

import java.sql.Timestamp;

public class Limit0409 {
	
	private String name;
	private String id;
	private String pw;
	private String pwc;
	private String pwhintans;
	private String day;
	private String age;
	private String gender;
	private String email;
	private String tel_h1;
	private String jumin1;
	private String jumin2;
	private String addre;
	private String addre2;
	private String phone;
	private String chk_mail;
	 private String img;
	 private Timestamp reg;
	 
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	/*	int size = id.length();
		if (size >= 5 && size <= 9) { //5~9 ���̸� true
			char s = id.charAt(0); //ù���� Ȯ�� 
			if (s >= 65 && s <= 122) {
				this.id = id + " Ȯ�εǾ����ϴ�.";
			} else {
				return;
			}
		}*/
		
	}
	
	
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		
		/*	if(pw != null){
					PwCheck vc = new PwCheck(); //�ڹ� Ŭ���� ȣ�� 
						boolean a = vc.charLength(this.pw, 6, 9);
						boolean b = vc.charBig(this.pw);
						boolean c = vc.charsmall(this.pw);
			}*/
		
		this.pw = pw;
	}
	
	
	public String getPwc() {
		return pwc;
	}
	public void setPwc(String pwc) {
		this.pwc = pwc;
	}
	public String getPwhintans() {
		return pwhintans;
	}
	public void setPwhintans(String pwhintans) {
		this.pwhintans = pwhintans;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		
		
		// ������� �Է¹޾� ���̷� ��� �Է� ��) 19960614  ���= 32��
//	    java.util.Date d = new java.util.Date(); //���� ��¥
	    
	    //���� ��¥���� �⵵�� ���� - ��¥�� 1900�⵵���� ������ �ð��� ����ϱ� ������ 1900�� ���Ѵ�. 
	//    int year = d.getYear()+1900; 
	    
	    // �Է¹��� ������Ͽ��� �⵵ ���� 19960315 ���� �� 4�ڸ� �߶� �� ���ڷ� ����
	//    year = year - Integer.parseInt(day.substring(0, 4)); 
		
		
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		//if(gender.equals("man") || gender.equals("woman")) {
			this.gender = gender;
		//}
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel_h1() {
		return tel_h1;
	}
	public void setTel_h1(String tel_h1) {
		this.tel_h1 = tel_h1;
	}
	public String getJumin1() {
		return jumin1;
	}
	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}
	
	public String getJumin2() {
		return jumin2;
	}
	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}
	
	public String getAddre() {
		return addre;
	}
	public void setAddre(String addre) {
		this.addre = addre;
	}
	public String getAddre2() {
		return addre2;
	}
	public void setAddre2(String addre2) {
		this.addre2 = addre2;
	}
	public String getChk_mail() {
		return chk_mail;
	}
	public void setChk_mail(String chk_mail) {
		this.chk_mail = chk_mail;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	
	
	
	//
	public String getJumin() {
		return this.jumin1 +"-"+this.jumin2;
	}
	public void setJumin(String jumin) {
	 
		
	}
	
	public String getAddress() {
		return this.addre+" " +this.addre2;
	}
	public void setAddress(String Address) {
	   
	  
		
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	

	
	
	
	
	
}

package project.model;

import java.sql.Timestamp;

public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String age;
	private Timestamp reg;
	private int status;	
	
	public Timestamp getReg() {		return reg;	}
	public void setReg(Timestamp reg) {		this.reg = reg;	}
	
	public int getStatus() {		return status;	}
	public void setStatus(int status) {		this.status = status;	}
	
	
	
	
	
	public void setId(String id) {		this.id = id;	}
	public void setPw(String pw) {		this.pw = pw;	}
	public void setName(String name) {		this.name = name;	}
	public void setAge(String age) {		this.age = age;	}
	
	public String getId() {		return id;	}
	public String getPw() {		return pw;	}
	public String getName() {		return name;	}
	public String getAge() {		return age;	}
}

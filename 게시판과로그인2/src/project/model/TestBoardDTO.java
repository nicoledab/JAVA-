package project.model;

import java.sql.Timestamp;

public class TestBoardDTO {
	private int num;
	private String writer;
	private String subject;
	private String content;
	private String save;
	private Timestamp reg;
	
	private int readcount;
	private int status;

	public int getReadcount() {		return readcount;	}
	public void setReadcount(int readcount) {		this.readcount = readcount;	}
	public int getStatus() {		return status;	}
	public void setStatus(int status) {		this.status = status;	}
	
	
	public int getNum() {		return num;	}
	public Timestamp getReg() {		return reg;	}
	public String getSave() {		return save;	}
	public String getContent() {		return content;	}
	public String getSubject() {		return subject;	}
	public String getWriter() {		return writer;	}
	
	public void setNum(int num) {		this.num = num;	}
	public void setWriter(String writer) {		this.writer = writer;	}
	public void setSubject(String subject) {		this.subject = subject;	}	
	public void setContent(String content) {		this.content = content;	}
	public void setSave(String save) {		this.save = save;	}
	public void setReg(Timestamp reg) {		this.reg = reg;	}
}

package com.human.chaosDTO;

public class MemberDTO {
	private String Id;
	private String Pw;
	private String Email;
	private String authKey;
	private String status;
	private String Nick;
	private String pname;
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getNick() {
		return Nick;
	}
	public void setNick(String nick) {
		Nick = nick;
	}
	public String getId() {
		return Id;
	}
	public void setId(String iD) {
		Id = iD;
	}
	public String getPw() {
		return Pw;
	}
	public void setPw(String pW) {
		Pw = pW;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getAuthKey() {
		return authKey;
	}
	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}

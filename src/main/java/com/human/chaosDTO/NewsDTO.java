package com.human.chaosDTO;

public class NewsDTO {
	private int No;
	private String Nick;
	private String Content;
	private String dt;
	private int Likes;
	private String pname;
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getNo() {
		return No;
	}
	public String getDt() {
		return dt;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public void setDt(String dt) {
		this.dt = dt;
	}
	public void setNo(int no) {
		No = no;
	}
	public String getNick() {
		return Nick;
	}
	public void setNick(String nick) {
		Nick = nick;
	}	
	public int getLikes() {
		return Likes;
	}
	public void setLikes(int likes) {
		Likes = likes;
	}
	
}

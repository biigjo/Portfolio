package com.dd.vo;

public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String nick;
	
	public MemberVO() { }

	public MemberVO(String id, String pw, String name, String email, String nick) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.nick = nick;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getNick() {
		return nick;
	}
	
	public void setNick(String nick) {
		this.nick = nick;
	}
	
}

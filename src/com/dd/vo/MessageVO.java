package com.dd.vo;

public class MessageVO {
	private String from_name;
	private String to_name;
	private String content;
	private String msg_date;
	private int rnum;
	
	public MessageVO() { }

	public MessageVO(String from_name, String to_name, String content, String msg_date, int rnum) {
		this.from_name = from_name;
		this.to_name = to_name;
		this.content = content;
		this.msg_date = msg_date;
		this.rnum = rnum;
	}

	public String getFrom_name() {
		return from_name;
	}

	public void setFrom_name(String from_name) {
		this.from_name = from_name;
	}

	public String getTo_name() {
		return to_name;
	}

	public void setTo_name(String to_name) {
		this.to_name = to_name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMsg_date() {
		return msg_date;
	}

	public void setMsg_date(String msg_date) {
		this.msg_date = msg_date;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	
}

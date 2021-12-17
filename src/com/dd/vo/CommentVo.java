package com.dd.vo;

public class CommentVo {
	private String writer;
	private String content;
	private String date;
	private int rnum;
	public CommentVo(String writer, String content, String date, int rnum) {
		super();
		this.writer = writer;
		this.content = content;
		this.date = date;
		this.rnum = rnum;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}

package com.dd.vo;

public class CommunityVo {
	private int bno;
	private String category;
	private String title;
	private String content;
	private String fileName;
	private String writer;
	private String date;
	private int hitcount;
	
	public CommunityVo(int bno, String category, String title, String content, String fileName, String writer, String date, int hitcount) {
		this.bno = bno;
		this.category = category;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
		this.writer = writer;
		this.date = date;
		this.hitcount = hitcount;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getHitcount() {
		return hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
}

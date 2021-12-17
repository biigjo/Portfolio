package com.dd.vo;

public class Oracle {
	private String userId;
	private String userPw;
	
	public Oracle() {
		String userId = "daengforest";
		String userPw = "454612";
		
		this.userId = userId;
		this.userPw = userPw;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	
	
}

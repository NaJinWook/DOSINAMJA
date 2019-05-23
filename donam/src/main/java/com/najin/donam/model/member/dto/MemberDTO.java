package com.najin.donam.model.member.dto;

import java.util.Date;

public class MemberDTO {
	private String user_id;
	private String user_nikname;
	private String user_pwd;
	private String user_level;
	private Date join_date;

	public MemberDTO() {
		
	}
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_nikname() {
		return user_nikname;
	}

	public void setUser_nikname(String user_nikname) {
		this.user_nikname = user_nikname;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_level() {
		return user_level;
	}

	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	@Override
	public String toString() {
		return "MemberDTO [user_id=" + user_id + ", user_nikname=" + user_nikname + ", user_pwd=" + user_pwd
				+ ", user_level=" + user_level + ", join_date=" + join_date + "]";
	}
}

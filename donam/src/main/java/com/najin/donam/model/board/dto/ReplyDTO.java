package com.najin.donam.model.board.dto;

import java.sql.Date;

public class ReplyDTO {
	private int rno; //댓글 번호
	private int bno; //게시물 번호
	private String reply_user; //댓글 작성자 이름
	private String reply_user_level; //작성자 레벨
	private String reply_text; //댓글 내용
	private Date regDate; //java.util.Date, 작성일자
	private String regTime; //등록시간 계산
	//getter,setter,toString()
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getReply_user() {
		return reply_user;
	}
	public void setReply_user(String reply_user) {
		this.reply_user = reply_user;
	}
	public String getReply_user_level() {
		return reply_user_level;
	}
	public void setReply_user_level(String reply_user_level) {
		this.reply_user_level = reply_user_level;
	}
	public String getReply_text() {
		return reply_text;
	}
	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public String getRegTime() {
		return regTime;
	}
	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}
	@Override
	public String toString() {
		return "ReplyDTO [rno=" + rno + ", bno=" + bno + ", reply_user=" + reply_user + ", reply_text=" + reply_text
				+ ", regDate=" + regDate + "]";
	}
	
	
	
}
package com.najin.donam.model.board.dto;

import java.sql.Date;

public class BoardDTO {
/*
	bno			number			not null,
	title		varchar2(30)	not null,
	content 	varchar2(2000)	not null,
	writer		varchar2(30)	not null,
	regDate		date			default sysdate,
	viewCnt		number			default 0
 */
	private int bno;
	private String title;
	private String content;
	private String writer; // member테이블과 조인(닉네임)
	private String writer_level;
	private Date regDate;
	private int viewCnt;
	private int replyCnt; // 댓글 갯수
	private String regTime; //등록 시간 계산
	
	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWriter_level() {
		return writer_level;
	}

	public void setWriter_level(String writer_level) {
		this.writer_level = writer_level;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	
	public String getRegTime() {
		return regTime;
	}

	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}

	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regDate=" + regDate + ", viewCnt=" + viewCnt + "]";
	}
}

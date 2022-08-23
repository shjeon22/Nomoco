package com.nmc.domain;

import java.util.Date;

public class BoardVO {

	private Integer bno;// 1.게시물 번호
	private String title;// 2.제목
	private String content;// 3.내용
	private String writer;// 4.작성자
	private String ip;// 5.아이피 주소
	private Date regdate;// 6.작성일
	private int viewcnt;// 7.조회수

	public BoardVO() {
	}

	public BoardVO(Integer bno, String title, String content, String writer, String ip, Date regdate, int viewcnt) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.ip = ip;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
	}

	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
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

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", ip=" + ip
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + "]";
	}

}
package com.nmc.domain;


import java.sql.Date;
import java.util.Objects;

public class CommentVO {

	private Integer cno;// 1.댓글번호
	private Integer bno;// 2.게시물번호
	private Integer pcno;// 3.대댓글(parent cno)
	private String comment;// 4.댓글
	private String commenter;// 5.작성자
	private Date reg_date;// 6.등록일
	private Date up_date;// 7.수정일
	private String re_ip;//8.ip

	public CommentVO() {
	}

	public CommentVO(Integer bno, Integer pcno, String comment, String commenter,String re_ip) {
		this.bno = bno;
		this.pcno = pcno;
		this.comment = comment;
		this.commenter = commenter;
		this.re_ip =re_ip;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		CommentVO that = (CommentVO) o;
		return Objects.equals(cno, that.cno) && Objects.equals(bno, that.bno) && Objects.equals(pcno, that.pcno)
				&& Objects.equals(comment, that.comment) && Objects.equals(commenter, that.commenter);
	}

	@Override
	public int hashCode() {
		return Objects.hash(cno, bno, pcno, comment, commenter);
	}

	public Integer getCno() {
		return cno;
	}

	public void setCno(Integer cno) {
		this.cno = cno;
	}

	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	public Integer getPcno() {
		return pcno;
	}

	public void setPcno(Integer pcno) {
		this.pcno = pcno;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getCommenter() {
		return commenter;
	}

	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getUp_date() {
		return up_date;
	}

	public void setUp_date(Date up_date) {
		this.up_date = up_date;
	}

	public String getRe_ip() {
		return re_ip;
	}

	public void setRe_ip(String re_ip) {
		this.re_ip = re_ip;
	}

	@Override
	public String toString() {
		return "CommentVO [cno=" + cno + ", bno=" + bno + ", pcno=" + pcno + ", comment=" + comment + ", commenter="
				+ commenter + ", reg_date=" + reg_date + ", up_date=" + up_date + ", re_ip=" + re_ip + "]";
	}
	
	
}

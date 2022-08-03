package com.nmc.domain;

import java.sql.Date;

public class MemberVO {

	private String id;
	private String pw;
	private String name;
	private Integer tel;
	private String email;
	private String address;
	private Date regdate;
	private Date updatedate;
	
	public MemberVO() {
	}// 기본생성자 - 메서드 오버로딩을 하면 기본생성자 없어지기떄문(자동생성X) =>만들어줘야됨

	
	public MemberVO(String id, String pw, String name, Integer tel, String email, String address, Date regdate,
			Date updatedate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.address = address;
		this.regdate = regdate;
		this.updatedate = updatedate;
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

	public Integer getTel() {
		return tel;
	}

	public void setTel(Integer tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", tel=" + tel + ", email=" + email
				+ ", address=" + address + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}

	
}

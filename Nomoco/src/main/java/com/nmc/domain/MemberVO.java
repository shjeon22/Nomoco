package com.nmc.domain;

import java.sql.Date;

public class MemberVO {

	private String id;
	private String pw;
	private String name;
	private Integer tel;
	private String email;
	private String zipcode;
	private String address;
	private String address2;
	private Date regdate;
	private Date updatedate;
	
	public MemberVO() {
	}// 기본생성자 - 메서드 오버로딩을 하면 기본생성자 없어지기떄문(자동생성X) =>만들어줘야됨

	public MemberVO(String id, String pw, String name, Integer tel, String email, String zipcode, String address,
			String address2, Date regdate, Date updatedate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.zipcode = zipcode;
		this.address = address;
		this.address2 = address2;
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

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
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
				+ ", zipcode=" + zipcode + ", address=" + address + ", address2=" + address2 + ", regdate=" + regdate
				+ ", updatedate=" + updatedate + "]";
	}

	


	
	
	
}
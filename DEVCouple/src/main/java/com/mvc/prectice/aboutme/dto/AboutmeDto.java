package com.mvc.prectice.aboutme.dto;

public class AboutmeDto {

	private int seq;
	private String id;
	private String site;
	private String certification;
	private String content;
	
	private String name;
	private String email;
	private String phone;
	private String address;
	private String addone;
	private String profileimg;
	
	public AboutmeDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AboutmeDto(int seq, String id, String site, String certification, String content, String name, String email,
			String phone, String address, String addone, String profileimg) {
		super();
		this.seq = seq;
		this.id = id;
		this.site = site;
		this.certification = certification;
		this.content = content;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.addone = addone;
		this.profileimg = profileimg;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getCertification() {
		return certification;
	}

	public void setCertification(String certification) {
		this.certification = certification;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddone() {
		return addone;
	}

	public void setAddone(String addone) {
		this.addone = addone;
	}

	public String getProfileimg() {
		return profileimg;
	}

	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}
	
}

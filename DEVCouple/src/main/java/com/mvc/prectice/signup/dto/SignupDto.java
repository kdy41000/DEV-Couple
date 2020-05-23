package com.mvc.prectice.signup.dto;

public class SignupDto {

	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String address;
	private String addone;
	private String detailadd;
	private String profileimg;
	
	public SignupDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SignupDto(String id, String pw, String name, String phone, String email, String address, String addone,
			String detailadd, String profileimg) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.addone = addone;
		this.detailadd = detailadd;
		this.profileimg = profileimg;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public String getAddone() {
		return addone;
	}

	public void setAddone(String addone) {
		this.addone = addone;
	}

	public String getDetailadd() {
		return detailadd;
	}

	public void setDetailadd(String detailadd) {
		this.detailadd = detailadd;
	}

	public String getProfileimg() {
		return profileimg;
	}

	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}
	
	
	
}

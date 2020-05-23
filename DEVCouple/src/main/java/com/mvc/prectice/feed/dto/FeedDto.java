package com.mvc.prectice.feed.dto;

import java.util.Date;

public class FeedDto {

	private int feedno;
	private String id;
	private String img;
	private String video;
	private String content;
	private Date wrtdate;
	
	private int reno;
	private String reid;
	private String recomment;
	private Date redate;
	
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String address;
	private String addone;
	private String detailadd;
	private String profileimg;
	
	private int commentcount;
	private int likecount;
	
	private int likeno;
	private String likeid;
	private int likestatus;   // 0:like상태(bad버튼나와야됨), 1:bad상태(like버튼 나와야됨)
	
	public FeedDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FeedDto(int feedno, String id, String img, String video, String content, Date wrtdate, int reno, String reid,
			String recomment, Date redate, String pw, String name, String phone, String email, String address,
			String addone, String detailadd, String profileimg, int commentcount, int likecount, int likeno,
			String likeid, int likestatus) {
		super();
		this.feedno = feedno;
		this.id = id;
		this.img = img;
		this.video = video;
		this.content = content;
		this.wrtdate = wrtdate;
		this.reno = reno;
		this.reid = reid;
		this.recomment = recomment;
		this.redate = redate;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.addone = addone;
		this.detailadd = detailadd;
		this.profileimg = profileimg;
		this.commentcount = commentcount;
		this.likecount = likecount;
		this.likeno = likeno;
		this.likeid = likeid;
		this.likestatus = likestatus;
	}

	public int getFeedno() {
		return feedno;
	}

	public void setFeedno(int feedno) {
		this.feedno = feedno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWrtdate() {
		return wrtdate;
	}

	public void setWrtdate(Date wrtdate) {
		this.wrtdate = wrtdate;
	}

	public int getReno() {
		return reno;
	}

	public void setReno(int reno) {
		this.reno = reno;
	}

	public String getReid() {
		return reid;
	}

	public void setReid(String reid) {
		this.reid = reid;
	}

	public String getRecomment() {
		return recomment;
	}

	public void setRecomment(String recomment) {
		this.recomment = recomment;
	}

	public Date getRedate() {
		return redate;
	}

	public void setRedate(Date redate) {
		this.redate = redate;
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

	public int getCommentcount() {
		return commentcount;
	}

	public void setCommentcount(int commentcount) {
		this.commentcount = commentcount;
	}

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	public int getLikeno() {
		return likeno;
	}

	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}

	public String getLikeid() {
		return likeid;
	}

	public void setLikeid(String likeid) {
		this.likeid = likeid;
	}

	public int getLikestatus() {
		return likestatus;
	}

	public void setLikestatus(int likestatus) {
		this.likestatus = likestatus;
	}

	
	
}

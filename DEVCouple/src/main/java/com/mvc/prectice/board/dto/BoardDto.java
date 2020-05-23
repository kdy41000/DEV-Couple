package com.mvc.prectice.board.dto;

import java.util.Date;

public class BoardDto {

	private int seq;
	private String id;
	private String title;
	private String content;
	private Date wrtdate;
	private int cnt;
	
	// 댓글
	private int replyseq;
	private String writer;
	private String replycontent;
	private int star;
	private Date replydate;
	
	//회원 정보
	private String name;
	private String pw;
	private String email;
	private String phone;
	private String address;
	private String addone;
	private String detailadd;
	private String profileimg;
	
	public BoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardDto(int seq, String id, String title, String content, Date wrtdate, int cnt, int replyseq,
			String writer, String replycontent, int star, Date replydate, String name, String pw, String email,
			String phone, String address, String addone, String detailadd, String profileimg) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wrtdate = wrtdate;
		this.cnt = cnt;
		this.replyseq = replyseq;
		this.writer = writer;
		this.replycontent = replycontent;
		this.star = star;
		this.replydate = replydate;
		this.name = name;
		this.pw = pw;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.addone = addone;
		this.detailadd = detailadd;
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

	public Date getWrtdate() {
		return wrtdate;
	}

	public void setWrtdate(Date wrtdate) {
		this.wrtdate = wrtdate;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getReplyseq() {
		return replyseq;
	}

	public void setReplyseq(int replyseq) {
		this.replyseq = replyseq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getReplycontent() {
		return replycontent;
	}

	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public Date getReplydate() {
		return replydate;
	}

	public void setReplydate(Date replydate) {
		this.replydate = replydate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
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

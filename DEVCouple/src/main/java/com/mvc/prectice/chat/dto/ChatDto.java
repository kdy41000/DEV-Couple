package com.mvc.prectice.chat.dto;

import java.util.Date;

public class ChatDto {

	private int roomno;
	private String roomname;
	private String roomdescription;
	private Date maketime;
	
	private int statusno;
	private int connectstatus;
	private String id;
	private int grade;
	
	private int msgno;
	private String write_id;
	private String msg;
	private Date sendtime;
	
	private int readstatusno;
	private String my_id;
	private int readstatus;
	
	private String name;
	private String pw;
	private String email;
	private String phone;
	private String address;
	private String addone;
	private String detailadd;
	private String profileimg;
	
	private int rownum;

	public ChatDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChatDto(int roomno, String roomname, String roomdescription, Date maketime, int statusno, int connectstatus,
			String id, int grade, int msgno, String write_id, String msg, Date sendtime, int readstatusno, String my_id,
			int readstatus, String name, String pw, String email, String phone, String address, String addone,
			String detailadd, String profileimg, int rownum) {
		super();
		this.roomno = roomno;
		this.roomname = roomname;
		this.roomdescription = roomdescription;
		this.maketime = maketime;
		this.statusno = statusno;
		this.connectstatus = connectstatus;
		this.id = id;
		this.grade = grade;
		this.msgno = msgno;
		this.write_id = write_id;
		this.msg = msg;
		this.sendtime = sendtime;
		this.readstatusno = readstatusno;
		this.my_id = my_id;
		this.readstatus = readstatus;
		this.name = name;
		this.pw = pw;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.addone = addone;
		this.detailadd = detailadd;
		this.profileimg = profileimg;
		this.rownum = rownum;
	}

	public int getRoomno() {
		return roomno;
	}

	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public String getRoomdescription() {
		return roomdescription;
	}

	public void setRoomdescription(String roomdescription) {
		this.roomdescription = roomdescription;
	}

	public Date getMaketime() {
		return maketime;
	}

	public void setMaketime(Date maketime) {
		this.maketime = maketime;
	}

	public int getStatusno() {
		return statusno;
	}

	public void setStatusno(int statusno) {
		this.statusno = statusno;
	}

	public int getConnectstatus() {
		return connectstatus;
	}

	public void setConnectstatus(int connectstatus) {
		this.connectstatus = connectstatus;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getMsgno() {
		return msgno;
	}

	public void setMsgno(int msgno) {
		this.msgno = msgno;
	}

	public String getWrite_id() {
		return write_id;
	}

	public void setWrite_id(String write_id) {
		this.write_id = write_id;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Date getSendtime() {
		return sendtime;
	}

	public void setSendtime(Date sendtime) {
		this.sendtime = sendtime;
	}

	public int getReadstatusno() {
		return readstatusno;
	}

	public void setReadstatusno(int readstatusno) {
		this.readstatusno = readstatusno;
	}

	public String getMy_id() {
		return my_id;
	}

	public void setMy_id(String my_id) {
		this.my_id = my_id;
	}

	public int getReadstatus() {
		return readstatus;
	}

	public void setReadstatus(int readstatus) {
		this.readstatus = readstatus;
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

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	
}

package com.mvc.prectice.letter.dto;

import java.util.Date;

public class LetterDto {

	private int letterseq;
	private String id;    //받는사람(FK)
	private String sender;  //보내는사람
	private String lettertitle;
	private String lettercontent;
	private int letterread;    // 읽음여부: 안읽음(1), 읽음(2)
	private Date lettertime;
	
	private int rnum;
	
	public LetterDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LetterDto(int letterseq, String id, String sender, String lettertitle, String lettercontent, int letterread,
			Date lettertime, int rnum) {
		super();
		this.letterseq = letterseq;
		this.id = id;
		this.sender = sender;
		this.lettertitle = lettertitle;
		this.lettercontent = lettercontent;
		this.letterread = letterread;
		this.lettertime = lettertime;
		this.rnum = rnum;
	}

	public int getLetterseq() {
		return letterseq;
	}

	public void setLetterseq(int letterseq) {
		this.letterseq = letterseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getLettertitle() {
		return lettertitle;
	}

	public void setLettertitle(String lettertitle) {
		this.lettertitle = lettertitle;
	}

	public String getLettercontent() {
		return lettercontent;
	}

	public void setLettercontent(String lettercontent) {
		this.lettercontent = lettercontent;
	}

	public int getLetterread() {
		return letterread;
	}

	public void setLetterread(int letterread) {
		this.letterread = letterread;
	}

	public Date getLettertime() {
		return lettertime;
	}

	public void setLettertime(Date lettertime) {
		this.lettertime = lettertime;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	
}

package com.mvc.prectice.calendar.dto;

import java.util.Date;

public class CalendarDto {
	private String existtitle;
	private String title;
	private String start;
	
	public CalendarDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CalendarDto(String existtitle, String title, String start) {
		super();
		this.existtitle = existtitle;
		this.title = title;
		this.start = start;
	}

	public String getExisttitle() {
		return existtitle;
	}

	public void setExisttitle(String existtitle) {
		this.existtitle = existtitle;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	
	
}

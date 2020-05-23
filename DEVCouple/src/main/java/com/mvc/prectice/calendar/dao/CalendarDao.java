package com.mvc.prectice.calendar.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mvc.prectice.calendar.dto.CalendarDto;

@Repository
public interface CalendarDao {

	String NAMESPACE = "calendarquery.";
	public List<CalendarDto>selectList();
	public int insertCalendar(CalendarDto dto);
	public int deleteCalendar(String title);
	public CalendarDto selectOne(String title);
	public int updateCalendar(CalendarDto dto);
}

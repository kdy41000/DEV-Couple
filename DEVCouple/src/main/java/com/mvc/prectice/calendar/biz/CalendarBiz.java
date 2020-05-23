package com.mvc.prectice.calendar.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.prectice.calendar.dto.CalendarDto;

@Service
public interface CalendarBiz {

	public List<CalendarDto>selectList();
	public int insertCalendar(CalendarDto dto);
	public int deleteCalendar(String title);
	public CalendarDto selectOne(String title);
	public int updateCalendar(CalendarDto dto);
}

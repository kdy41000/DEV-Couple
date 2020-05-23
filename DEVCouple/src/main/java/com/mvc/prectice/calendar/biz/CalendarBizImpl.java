package com.mvc.prectice.calendar.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.calendar.dao.CalendarDao;
import com.mvc.prectice.calendar.dto.CalendarDto;

@Service
public class CalendarBizImpl implements CalendarBiz{

	@Autowired
	private CalendarDao dao;
	
	@Override
	public List<CalendarDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public int insertCalendar(CalendarDto dto) {
		// TODO Auto-generated method stub
		return dao.insertCalendar(dto);
	}

	@Override
	public int deleteCalendar(String title) {
		// TODO Auto-generated method stub
		return dao.deleteCalendar(title);
	}

	@Override
	public CalendarDto selectOne(String title) {
		// TODO Auto-generated method stub
		return dao.selectOne(title);
	}

	@Override
	public int updateCalendar(CalendarDto dto) {
		// TODO Auto-generated method stub
		return dao.updateCalendar(dto);
	}

}

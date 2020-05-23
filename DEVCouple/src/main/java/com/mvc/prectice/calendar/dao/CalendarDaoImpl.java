package com.mvc.prectice.calendar.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.calendar.dto.CalendarDto;

@Repository
public class CalendarDaoImpl implements CalendarDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<CalendarDto> selectList() {
		List<CalendarDto>list = new ArrayList<CalendarDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			System.out.println("[error]:selectList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertCalendar(CalendarDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insertCalendar",dto);
		} catch (Exception e) {
			System.out.println("[error]:insertCalendar");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteCalendar(String title) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE + "deleteCalendar",title);
		} catch (Exception e) {
			System.out.println("[error]:deleteCalendar");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public CalendarDto selectOne(String title) {
		CalendarDto dto = new CalendarDto();
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne",title);
		} catch (Exception e) {
			System.out.println("[error]:selectOne");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int updateCalendar(CalendarDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "updateCalendar",dto);
		} catch (Exception e) {
			System.out.println("[error]:updateCalendar");
			e.printStackTrace();
		}
		return res;
	}

}

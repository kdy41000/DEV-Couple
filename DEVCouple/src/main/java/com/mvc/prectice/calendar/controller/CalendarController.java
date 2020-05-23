package com.mvc.prectice.calendar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mvc.prectice.calendar.biz.CalendarBiz;
import com.mvc.prectice.calendar.dto.CalendarDto;

@Controller
public class CalendarController {

	Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired
	private CalendarBiz calendarbiz;
	
	@RequestMapping("/calendar.do")
	public String CalendarMain(Model model) {
		logger.info("CalendarMain");
		return "calendarmain";
	}
	
	@RequestMapping("/calendarList.do")
	@ResponseBody
	public void CalendarList(HttpServletResponse response) throws IOException {
		logger.info("에이작스 캘린더");
		List<CalendarDto>list = calendarbiz.selectList();
		
	    Gson gson = new Gson(); 
	    String jsonList = gson.toJson(list);
	
		PrintWriter out = response.getWriter();
		System.out.println(jsonList); 
		out.println(jsonList);
		 
	}
	
	@RequestMapping("/calendarwrite.do")
	public String CalendarWrite(Model model) {
		logger.info("CalendarWrite");
		return "calendarwrite";
	}
	
	@RequestMapping("/calendarwriteRes.do")
	public String CalendarWriteRes(Model model, CalendarDto dto) {
		logger.info("CalendarWriteRes");
		int res = calendarbiz.insertCalendar(dto);
		if(res > 0) {
			System.out.println("일정추가 성공");
			return "redirect:calendar.do";
		}else {
			System.out.println("일정추가 실패");
			return "redirect:calendar.do";
		}
	}
	
	@RequestMapping("/calendardelete.do")
	@ResponseBody
	public void CalendarDelete(String title) {
		logger.info("CalendarDelete");
		int res = calendarbiz.deleteCalendar(title);
		if(res > 0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
	}
	
	@RequestMapping("/calendarupdate.do")
	public String CalendarUpdate(Model model,String title) {
		logger.info("CalendarUpdate");
		CalendarDto dto = calendarbiz.selectOne(title);
		
		model.addAttribute("caldto", dto);
		return "calendarupdateForm";
	}
	
	@RequestMapping("/calendarupdateRes.do")
	public String CalendarUpdateRes(Model model, CalendarDto dto) {
		logger.info("CalendarUpdateRes");
		int res = calendarbiz.updateCalendar(dto);
		if(res > 0) {
			System.out.println("일정수정 성공");
			return "redirect:calendar.do";
		}else {
			System.out.println("일정수정 실패");
			return "redirect:calendar.do";
		}
	}
}

package com.mvc.prectice.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvc.prectice.login.biz.LoginBiz;
import com.mvc.prectice.login.dto.LoginDto;

@Controller
public class LoginController {

	private Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginBiz loginbiz;
	
	@RequestMapping(value = "/login.do")
	public String Login(Model model) {
		logger.info("Login");
		return "login";
	}
	
	@RequestMapping(value = "/loginRes.do",method = RequestMethod.POST)
	public String LoginRes(LoginDto logindto, HttpServletRequest request) {
		LoginDto dto = new LoginDto();
		
		dto = loginbiz.selectInfo(logindto); 
		
		if(dto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("logininfo", dto);
			session.setMaxInactiveInterval(30*100);
			return "section";
		}else {
			System.out.println("로그인 실패");
			return "redirect:login.do";
		}
	}
	
	@RequestMapping(value = "/logout.do")
	public String Logout(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "section";
		
	}
}

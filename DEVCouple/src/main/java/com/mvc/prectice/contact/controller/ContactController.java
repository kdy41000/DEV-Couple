package com.mvc.prectice.contact.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ContactController {

	Logger logger = LoggerFactory.getLogger(ContactController.class);
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/contact.do",method = RequestMethod.GET)
	public String ContactForm(Model model) {
		logger.info("ContactForm");
		return "contact";
	}
	
	@RequestMapping(value = "/contactRes.do",method = RequestMethod.POST)
	public String ContactRes(Model model, @RequestParam("name")String name, @RequestParam("email")String email,
							 @RequestParam("content")String content, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		logger.info("ContactRes");
		
		String setfrom = "kdy41000@gmail.com";
		String tomail = "kdy41000@gmail.com";
		String title = "DONG & BO에서 보낸 Contact 메일입니다.";
		
		HttpSession session = request.getSession();
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다.
			messageHelper.setText(" 이름: " + name + "\n 이메일: "+ email + "\n 내용: " + content); // 메일 내용
			
			mailSender.send(message);
			session.setAttribute("msg", "문의사항이 전송되었습니다.");
			session.setAttribute("loc", "contact.do");
			return "alert";
		} catch (Exception e) {
			System.out.println(e);
			session.setAttribute("msg", "문의사항 전송을 실패하였습니다.");
			session.setAttribute("loc", "contact.do");
			return "alert";
		}
	}
}

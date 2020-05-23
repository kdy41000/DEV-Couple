package com.mvc.prectice.aboutme.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.prectice.aboutme.biz.AboutmeBiz;
import com.mvc.prectice.aboutme.dto.AboutmeDto;

@Controller
public class AboutmeController {

	Logger logger = LoggerFactory.getLogger(AboutmeController.class);
	
	@Autowired
	private AboutmeBiz aboutmebiz;
	
	@RequestMapping(value = "/aboutme.do")
	public String Aboutme(Model model, String id) {
		logger.info("Aboutme");
		System.out.println(id);
		AboutmeDto aboutmedto = aboutmebiz.selectOne(id);
		model.addAttribute("aboutmedto", aboutmedto);
		model.addAttribute("id", id);
		return "aboutme";
		
	}
	
	@RequestMapping(value = "/writeaboutme.do")
	public String writeAboutme(Model model, String id) {
		logger.info("writeAboutme");
		model.addAttribute("id", id);
		return "aboutmewrite";
	}
	
	@RequestMapping(value = "/writeaboutmeRes.do")
	public String writeAboutmeRes(Model model, AboutmeDto dto) {
		logger.info("writeAboutmeRes");
		String id = dto.getId();
		int res = aboutmebiz.insertAboutme(dto);
		
		if(res > 0) {
			System.out.println("인서트 성공");
			return "redirect:aboutme.do?id="+id;
		}else {
			System.out.println("인서트 실패");
			return "redirect:aboutme.do?id="+id;
		}
	}
	
	@RequestMapping(value = "/reviseaboutme.do")
	public String reviseAboutme(Model model, String id) {
		logger.info("reviseAboutme");
		AboutmeDto aboutmedto = aboutmebiz.selectOne(id);
		model.addAttribute("aboutmedto", aboutmedto);
		return "aboutmeupdate";
	}
	
	@RequestMapping(value = "/reviseaboutmeRes.do")
	public String reviseAboutmeRes(Model model,AboutmeDto dto) {
		logger.info("reviseAboutmeRes");
		String id = dto.getId();
		int res = aboutmebiz.updateAboutme(dto);
		
		if(res > 0) {
			System.out.println("업데이트 성공");
			return "redirect:aboutme.do?id="+id;
		}else {
			System.out.println("업데이트 실패");
			return "redirect:aboutme.do?id="+id;
		}
	}
	
	@RequestMapping(value = "/deleteaboutme.do")
	public String deleteAboutme(Model model, int seq,String id) {
		logger.info("deleteAboutme");
		int res = aboutmebiz.deleteAboutme(seq);
		
		if(res > 0) {
			System.out.println("삭제 성공");
			return "redirect:aboutme.do?id"+id;
		}else {
			System.out.println("삭제 실패");
			return "redirect:aboutme.do?id"+id;
		}
		
	}
}

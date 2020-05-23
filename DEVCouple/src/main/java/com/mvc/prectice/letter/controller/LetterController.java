package com.mvc.prectice.letter.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mvc.prectice.letter.biz.LetterBiz;
import com.mvc.prectice.letter.dto.LetterDto;
import com.mvc.prectice.letter.dto.LetterPagingDto;

@Controller
public class LetterController {

	private Logger logger = LoggerFactory.getLogger(LetterController.class);
	
	@Autowired
	private LetterBiz letterbiz;
	
	@RequestMapping(value = "/getLastLetterSeq",method = RequestMethod.POST)   // 처음에 한번만 비동기통신으로 마지막 Seq를 return
	@ResponseBody
	public void getLastLetterSeq(@RequestParam("id")String id, HttpServletResponse response) throws IOException {
		logger.info("getLastLetterSeq");
		LetterDto letterdto = letterbiz.selectNewLetter(id);
		if(letterdto != null) {
			PrintWriter out = response.getWriter();
			out.println(letterdto.getLetterseq());
		}
	}
	
	@RequestMapping(value = "/ajaxLetterCall",method = RequestMethod.POST)
	@ResponseBody
	public void AjaxLetterCall(@RequestParam("id")String id, HttpServletResponse response, HttpServletRequest request) throws IOException {
		logger.info("AjaxLetterCall");
		System.out.println("로그인 된 아이디" + id);
		
		LetterDto letterdto = letterbiz.selectNewLetter(id);
		
		PrintWriter out = response.getWriter();
		if(letterdto != null) {
			
			Gson gson = new Gson();
			String jsonLetter = gson.toJson(letterdto);
			System.out.println("JSON으로 변환된 객체::" + jsonLetter);
			
			out.println(jsonLetter);
		}
	}
	
	///////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("/lettergetlist")
	public String LetterGetList(Model model, String id, int currentpage) {
		logger.info("LetterGetList");
		System.out.println(currentpage+"::커랜트페이지");
		LetterPagingDto pagingdto = new LetterPagingDto();
		pagingdto.setCurrentpage(currentpage);
		pagingdto.setColumn(10);
		pagingdto.setUnderpagescale(5);
		pagingdto.setTotalpage(letterbiz.getTotalPage(pagingdto.getColumn(),id));
		System.out.println(pagingdto.getTotalpage()+"::*******토탈페이지");
		List<LetterDto>letterList = letterbiz.selectGetLetterList(pagingdto, id);
		System.out.println(letterList.size()+"::사이즈");
		model.addAttribute("letterList", letterList);
		model.addAttribute("pagingdto", pagingdto);
		
		return "letterlist";
	}
	
	@RequestMapping("/letterdetail")
	public String LetterDetail(Model model, @ModelAttribute LetterDto dto) {
		int letterseq = dto.getLetterseq();
		int rnum = dto.getRnum();
	    System.out.println(rnum + "::************RNUM");
		int res = letterbiz.updateReadStatus(letterseq);
		if(res > 0) {
			LetterDto letterdto = letterbiz.selectDetailLetter(letterseq);
			
			model.addAttribute("letterdto", letterdto);
			model.addAttribute("rnum", rnum);
			return "letterdetail";
		}else {
			System.out.println("읽음상태 업데이트 에러");
			return null;
		}
		
	}
	
	@RequestMapping(value="/letterReSend.do")
	public String LetterReSend(Model model,HttpServletResponse response, @ModelAttribute LetterDto letterdto) {
		logger.info("LetterReSend");
		 
		 model.addAttribute("letterdto", letterdto);
		return "letterresend";
	}
	
	@RequestMapping(value = "/letterReSendRes.do",method = RequestMethod.POST)
	public void LetterReSendRes(Model model,@ModelAttribute LetterDto letterdto,HttpServletResponse response) throws IOException {
		logger.info("LetterReSendRes");
		int res = letterbiz.insertLetter(letterdto);
		
		if(res > 0) {
			closePopup(response);
		}else {
			closePopup(response);
		}
		
	}
	
	@RequestMapping(value = "/lettersentlist.do",method = RequestMethod.GET)
	public String LetterSentList(Model model,String id, int currentpage) {
		logger.info("LetterSentList");
		LetterPagingDto pagingdto = new LetterPagingDto();
		pagingdto.setCurrentpage(currentpage);
		pagingdto.setColumn(10);
		pagingdto.setUnderpagescale(5);
		pagingdto.setTotalpage(letterbiz.sentTotalPage(pagingdto.getColumn(),id));
		System.out.println(pagingdto.getTotalpage()+"::*******토탈페이지");
		List<LetterDto>letterList = letterbiz.selectSentLetterList(pagingdto, id);
		System.out.println(letterList.size()+"::사이즈");
		model.addAttribute("letterList", letterList);
		model.addAttribute("pagingdto", pagingdto);
		
		
		return null;
	}
	
	@RequestMapping(value = "/lettersentdetail.do",method = RequestMethod.GET)
	public String LetterSentDetail(Model model, @ModelAttribute LetterDto dto) {
		logger.info("LetterSentDetail");
		int letterseq = dto.getLetterseq();
		int rnum = dto.getRnum();
	    System.out.println(rnum + "::************RNUM");
		
	    LetterDto letterdto = letterbiz.selectDetailLetter(letterseq);
	    
		model.addAttribute("letterdto", letterdto);
		model.addAttribute("rnum", rnum);

		return "lettersentdetail";
		
	}	
	
	@RequestMapping(value = "/deleteletter.do",method = RequestMethod.GET)
	public String LetterDelete(Model model, int letterseq, String id, HttpServletRequest requset) {
		logger.info("LetterDelete");
		int res = letterbiz.deleteLetter(letterseq);
		
		if(res > 0) {
			return "redirect:lettergetlist.do?id="+id+"&currentpage=1";
		}else {
			return "redirect:lettergetlist.do?id="+id+"&currentpage=1";
		}
		
	}
	
	private void closePopup(HttpServletResponse response) throws IOException {
		String res = "<script type='text/javascript'>"
					+ "self.close();"
					+ "</script>";
		PrintWriter out = response.getWriter();
		out.println(res);
	}
	@RequestMapping(value = "/testletter.do",method=RequestMethod.GET)
	public String TestLetter(Model model) {
		return "testboard";
	}
}

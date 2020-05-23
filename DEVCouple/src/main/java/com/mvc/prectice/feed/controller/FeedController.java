package com.mvc.prectice.feed.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.mvc.prectice.calendar.controller.CalendarController;
import com.mvc.prectice.feed.biz.FeedBiz;
import com.mvc.prectice.feed.dto.FeedDto;
import com.mvc.prectice.letter.biz.LetterBiz;
import com.mvc.prectice.letter.dto.LetterDto;
import com.mvc.prectice.login.dto.LoginDto;

@Controller
public class FeedController {

	Logger logger = LoggerFactory.getLogger(FeedController.class);
	
	@Autowired
	private FeedBiz feedbiz;
	
	@Autowired
	private LetterBiz letterbiz;
	
	@RequestMapping("/feed.do")
	public String FeedMain(Model model, HttpServletRequest request) {
		logger.info("FeedMain");
		String id = ""; 
		
		List<FeedDto>list = feedbiz.selectList();
		List<FeedDto>commemtlist = feedbiz.selectCommentList();
		List<FeedDto>commentcountlist = feedbiz.selectCommentCountList();
		List<FeedDto>likecountlist = feedbiz.selectLikeCountList();
		
		//System.out.println(comparablelikestatus.size()+"***************");
		HttpSession session = request.getSession();
		if(session.getAttribute("logininfo") != null) {
			LoginDto logindto = (LoginDto)session.getAttribute("logininfo");
			id = logindto.getId();
			logger.info("아이디: "+ id);
			
		}
		
		List<FeedDto>comparablelikestatus = feedbiz.selectComparableLikeStatus(id);
		
		model.addAttribute("feedlist", list);
		model.addAttribute("commentlist", commemtlist);
		model.addAttribute("commentcountlist", commentcountlist);
		model.addAttribute("likecountlist", likecountlist);
		model.addAttribute("comparablelikestatus", comparablelikestatus);  //feedno, likestatus(0,1)
		return "feedmain";
		
	}
	
	@RequestMapping("/feedwrite.do")
	public String FeedWrite(Model model,String id) {
		logger.info("FeedWrite");
		model.addAttribute("id", id);
		return "feedwrite";
	}
	
	@RequestMapping("/feedwriteRes.do")
	public String FeedWriteRes(@RequestParam("id")String id,@RequestParam("img")MultipartFile img,
								@RequestParam("video")MultipartFile video,@RequestParam("content")String content) {
		logger.info("FeedWriteRes");
		int res = 0;
		String savePath = "";
		String fullPath = "";
		String rename = "";
		String originalFilename = "";
		String onlyFileName = "";
		String extension = "";
		FeedDto feeddto = new FeedDto();
		
		if(img.isEmpty() && video.isEmpty()) {
			feeddto.setImg(null);
			feeddto.setVideo(null);
		}else {
		
			if(img.isEmpty()) {
				savePath = "C:\\Workspace_ScrollPaging\\DEVCouple\\src\\main\\webapp\\resources\\feedstorage\\video";
				originalFilename = video.getOriginalFilename();   //video.jpg
				onlyFileName = originalFilename.substring(0, originalFilename.indexOf("."));
				extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
			
				rename = onlyFileName + "_" + getCurrentDayTime() + extension;
				fullPath = savePath + "\\" + rename;
			}
			if(video.isEmpty()) {
				savePath = "C:\\Workspace_ScrollPaging\\DEVCouple\\src\\main\\webapp\\resources\\feedstorage\\img";
				originalFilename = img.getOriginalFilename();   //img.jpg
				onlyFileName = originalFilename.substring(0, originalFilename.indexOf("."));
				extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
			
				rename = onlyFileName + "_" + getCurrentDayTime() + extension;
				fullPath = savePath + "\\" + rename;
			}
			
			if(!img.isEmpty()) {
				try {
					File file = new File(fullPath);
					img.transferTo(file);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				feeddto.setImg(rename);
				feeddto.setVideo(null);
			}
			if(!video.isEmpty()) {
				try {
					File file = new File(fullPath);
					video.transferTo(file);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				feeddto.setImg(null);
				feeddto.setVideo(rename);
			}
		
		}
		
		
		feeddto.setId(id);
		feeddto.setContent(content);
		
		System.out.println("id: " +feeddto.getId());
		System.out.println("img: "  + feeddto.getImg());
		System.out.println("video: " + feeddto.getVideo());
		System.out.println("content: " + feeddto.getContent());
		
		
		res = feedbiz.insertAllFeed(feeddto);
		
		if(res > 0) {
			System.out.println("작성 성공");
			return "redirect:feed.do";
		}else {
			System.out.println("작성 실패");
			return "redirect:feed.do";
		}
	}
	
	@RequestMapping("/deletefeed.do")
	public String DeleteFeed(Model model,int feedno) {
		logger.info("DeleteFeed");
		int res = feedbiz.deletefeed(feedno);
		
		if(res > 0) {
			System.out.println("삭제성공");
			return "redirect:feed.do";
		}else {
			System.out.println("삭제실패");
			return "redirect:feed.do";
		}
	}
	
	@RequestMapping("/writecommentform.do")
	@ResponseBody
	public void WriteComment(FeedDto dto,HttpServletResponse response) throws IOException {
		logger.info("WriteComment");
		int feedno = dto.getFeedno();
		int res = feedbiz.insertComment(dto);
		if(res > 0) {
			System.out.println("인서트 성공");
			FeedDto feeddto = feedbiz.selectComment(feedno);
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			String jsonList = gson.toJson(feeddto);
			out.println(jsonList);
		}else {
			System.out.println("인서트 실패"); 
		}

	}
	
	@RequestMapping("/deletemycomment.do")
	@ResponseBody
	public void DeleteMyComment(int reno,HttpServletResponse response) throws IOException {
		logger.info("DeleteMyComment");
		int res = feedbiz.deleteMycomment(reno);
		
		if(res > 0) {
			System.out.println("삭제 성공");
			PrintWriter out = response.getWriter();
			out.println("success");
		}else {
			System.out.println("삭제실패");
		}
	}
	
	@RequestMapping("/insertlikestatus.do")
	@ResponseBody
	public void InsertLikeStatus(FeedDto dto,HttpServletResponse response) throws IOException {
		logger.info("InsertLikeStatus");
		System.out.println("id:"+dto.getLikeid());
		System.out.println("feedno:"+dto.getFeedno());
		
		FeedDto compareinfo = feedbiz.selectLikeStatus(dto);

		if(compareinfo == null) {
			int resOne = feedbiz.insertNewlikestatus(dto);   //인서트 로직
			
			if(resOne > 0) {
				System.out.println("like insert success");
				PrintWriter out = response.getWriter();
				out.println("success");
			}else {
				System.out.println("like insert failed");
			}
			
		}else if(compareinfo != null) {
			
			System.out.println("likeno: "+ compareinfo.getLikeno() + ",id: " + compareinfo.getLikeid() + ",likestatus: " + compareinfo.getLikestatus());
			
			int resTwo = feedbiz.updatelikegoodstatus(dto);   //업데이트 로직
			
			if(resTwo > 0) {
				System.out.println("likegood update success");
				PrintWriter out = response.getWriter();
				out.println("success");
			}else {
				System.out.println("likegood update failed");
			}
		}

	}
	
	@RequestMapping("/updatelikestatus.do")
	@ResponseBody
	public void UpdateLikeStatus(FeedDto dto,HttpServletResponse response) throws IOException {
		logger.info("UpdateLikeStatus");
		
		int res = feedbiz.updatelikebadstatus(dto);   //bad로 update하는 로직
		if(res > 0) {
			System.out.println("likebad update success");
			PrintWriter out = response.getWriter();
			out.println("success");
		}else {
			System.out.println("likebad update failed");
		}
	}
	
	public String getCurrentDayTime(){      //파일에 구분값을 주기 위한 함수(+현재시간)
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}
	
	@RequestMapping("/fromfeedlettersend.do")
	public String FromFeedLetterSend(Model model, LetterDto dto) {
		logger.info("FromFeedLetterSend");
		
		model.addAttribute("id", dto.getId());
		model.addAttribute("sender", dto.getSender());
		return "feedlettersend";
	}
	
	@RequestMapping("/feedSendletterRes.do")
	public String FromFeedLetterSendRes(Model model,LetterDto letterdto) {
		logger.info("FromFeedLetterSendRes");

		int res = letterbiz.insertLetter(letterdto);
		
		if(res > 0) {
			System.out.println("전송 성공");
			return "redirect:feed.do";
		}else {
			System.out.println("전송 실패");
			return "redirect:feed.do";
		}
	}
}

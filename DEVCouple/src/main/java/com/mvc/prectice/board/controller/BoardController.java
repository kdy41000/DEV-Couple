package com.mvc.prectice.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.mvc.prectice.board.biz.BoardBiz;
import com.mvc.prectice.board.dto.BoardDto;
import com.mvc.prectice.board.dto.PagingDto;
import com.mvc.prectice.chat.dto.ChatDto;

@Controller
public class BoardController {

	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardBiz boardbiz;
	
	@RequestMapping("/boardlist")
	public String BoardList(Model model, int currentpage, HttpServletRequest request) {
		logger.info("BoardList");
		
		PagingDto pagingdto = new PagingDto();
		pagingdto.setCurrentpage(currentpage);
		pagingdto.setColumn(10);
		pagingdto.setUnderpagescale(5);
		pagingdto.setTotalpage(boardbiz.totalPage(pagingdto.getColumn()));
		
		List<BoardDto>boardlist = boardbiz.selectList(pagingdto);
		HttpSession session = request.getSession();
		session.setAttribute("pagingdto", pagingdto);
		
		session.setAttribute("listGubun", "boardlist.do");
		session.setAttribute("backParam", null);
		model.addAttribute("boardlist", boardlist);
		return  "boardlist";
	}
	
	@RequestMapping("/searchid.do")      //아이디로 검색
	public String SearchId(Model model, int currentpage, String inputVal, HttpServletRequest request){
		logger.info("SearchId");
		PagingDto pagingdto = new PagingDto();
		pagingdto.setCurrentpage(1);
		pagingdto.setColumn(10);
		pagingdto.setUnderpagescale(5);
		pagingdto.setTotalpage(boardbiz.totalPageId(pagingdto.getColumn(),inputVal));
		
		List<BoardDto>boardlist = boardbiz.searchIdList(pagingdto, inputVal);

		HttpSession session = request.getSession();
		session.setAttribute("pagingdto", pagingdto);
		
		session.setAttribute("listGubun", "searchid.do");
		session.setAttribute("backParam", inputVal);
		
		model.addAttribute("boardlist", boardlist);
		return "boardlist";
		
		
	}
	
	@RequestMapping(value="/searchtitle.do")
	public String SearchTitle(Model model, int currentpage, String inputVal,HttpServletRequest request){
		logger.info("SearchTitle");
		PagingDto pagingdto = new PagingDto();
		pagingdto.setCurrentpage(1);
		pagingdto.setColumn(10);
		pagingdto.setUnderpagescale(5);
		pagingdto.setTotalpage(boardbiz.totalPageTitle(pagingdto.getColumn(),inputVal));
		
		List<BoardDto>boardlist = boardbiz.searchTitleList(pagingdto, inputVal);

		HttpSession session = request.getSession();
		session.setAttribute("pagingdto", pagingdto);
		
		session.setAttribute("listGubun", "searchtitle.do");
		session.setAttribute("backParam", inputVal);
		
		model.addAttribute("boardlist", boardlist);
		return "boardlist";
	}
	
	@RequestMapping(value = "/boarddetail.do")
	public String BoardDetail(Model model, int seq) {
		logger.info("BoardDetail");
		int res = boardbiz.updatecnt(seq);
		BoardDto boarddto = boardbiz.selectOne(seq);
		if(res > 0) {
			System.out.println("조회수 +1 성공");
			model.addAttribute("boarddto", boarddto);
			return "boarddetail";
		}else {
			System.out.println("조회수 +1 에러");
			model.addAttribute("boarddto", boarddto);
			return "boarddetail";
		}	
	}
	
	@RequestMapping(value = "/boardwrite.do")
	public String BoardWrite(Model model,String id) {
		logger.info("BoardWrite");
		model.addAttribute("id", id);
		return "boardwrite";
	}
	
	@RequestMapping(value = "/boardwriteRes.do")
	public String BoardWriteRes(Model model,BoardDto dto,HttpServletRequest request) throws IOException {
		logger.info("BoardWriteRes");
		int res = boardbiz.insertBoard(dto);
		HttpSession session = request.getSession();
		if(res > 0) {
			
			return BoardList(model,1,request);
			//session.setAttribute("msg", "글이 작성되었습니다.");
			//session.setAttribute("loc", "redirect:boardlist.do?currentpage=1");
			//return "alert";
		}else {			
			return BoardList(model,1,request);
			//session.setAttribute("msg", "글 작성을 실패하였습니다..");
			//session.setAttribute("loc", "redirect:boardlist.do?currentpage=1");
			//return "alert";
		}
	}
	
	@RequestMapping(value = "/boarddelete.do")
	public String BoardDelete(Model model,int seq,HttpServletRequest request) {
		logger.info("BoardDelete");
		int res = boardbiz.deleteBoard(seq);
		
		HttpSession session = request.getSession();
		
		if(res > 0) {
			session.setAttribute("msg", "게시글이 삭제되었습니다.");
			session.setAttribute("loc", "boardlist.do?currentpage=1");
			return "alert";
		}else {
			session.setAttribute("msg", "게시글이 삭제를 실패하였습니다.");
			session.setAttribute("loc", "boarddetail.do?seq="+seq);
			return "alert";
		}
	}
	
	@RequestMapping(value = "/updateboard.do",method = RequestMethod.GET)
	public String updateBoard(Model model, int seq) {
		logger.info("updateBoard");
		BoardDto dto = boardbiz.selectOne(seq);
		model.addAttribute("boarddto", dto);
		return "boardupdate";
	}
	
	@RequestMapping(value = "/boardupdateRes.do",method = RequestMethod.POST)
	public String updateBoardRes(Model model, BoardDto dto) {
		logger.info("updateBoardRes");
		int res = boardbiz.updateBoard(dto);
		int seq = dto.getSeq();
		if(res > 0) {
			System.out.println("수정성공");
			return "redirect:boarddetail.do?seq="+seq;
		}else {
			System.out.println("수정실패");
			return "redirect:boarddetail.do?seq="+seq;
		}
	}
	
	@RequestMapping(value = "/selectRecentReplyList.do",method = RequestMethod.GET)
	public void selectRecentReplyList(int seq, HttpServletResponse response) throws IOException {
		logger.info("selectRecentReplyList");
		System.out.println(seq+"::::::::::::");
		List<BoardDto>list = boardbiz.selectRecentReplyList(seq);
		
		Gson gson = new Gson();
		String jsonList = gson.toJson(list);
		System.out.println(jsonList);
		PrintWriter out = response.getWriter();
		out.println(jsonList);
	}
	
	@RequestMapping(value = "/deletereply.do",method = RequestMethod.GET)
	public String deleteReply(Model model, int replyseq, int seq) {
		logger.info("deleteReply");
		int res = boardbiz.deleteReply(replyseq);
		
		if(res > 0) {
			return "redirect:boarddetail.do?seq="+seq;
		}else {
			return "redirect:boarddetail.do?seq="+seq;
		}
	}

	@RequestMapping(value = "/testboard.do")
	public String WebRTC(Model model) {
		return "testboard";
	}
	
	@RequestMapping(value = "/insertReple.do",method = RequestMethod.GET)
	public String insertReple(Model model,@ModelAttribute BoardDto dto, HttpServletResponse response)throws IOException  {
	  logger.info("insertReple");
	  
	  int seq = dto.getSeq();
	  //System.out.println(seq+"seq ::파라미터 확인");
	  
	  Date time = new Date();
	  dto.setReplydate(time); // 댓글 입력시간 추가 
	  
	  int res= boardbiz.insertReple(dto);  //댓글 INSERT
	  System.out.println("res 댓글 인서트 결과 :"+res);
	  
	  if(res > 0) {
		  BoardDetail(model,seq);
		  return "boarddetail";
	  }else {
		  BoardDetail(model,seq);
		  return "boarddetail";
	  }
	  
	}
	
	@RequestMapping(value = "/selectReple.do")
	public String selectReple(Model model,@ModelAttribute int seq, HttpServletResponse response)throws IOException  {
	  logger.info("selectReple");
	  System.out.println("selectReple 파라미터 확인 seq ::"+seq);
	  
	  List<BoardDto>boardlist = boardbiz.selectReple(seq);  //위에는 마지막 번호  //이건 마지막 번호로 리스트 출력
	  model.addAttribute("boardlist", boardlist);
	  
	  if(boardlist.size() > 0) {
		  return "boarddetail";
	  }else {
		  return "boarddetail";
	  }
	  
	}
	
	
}

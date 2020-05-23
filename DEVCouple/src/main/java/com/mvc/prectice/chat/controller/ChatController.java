package com.mvc.prectice.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mvc.prectice.chat.biz.ChatBiz;
import com.mvc.prectice.chat.dto.ChatDto;

@Controller
public class ChatController {

	private Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	private ChatBiz chatbiz;
	
	@RequestMapping(value = "/chatlist.do", method = RequestMethod.GET)
	public String ChatList(Model model) {
		logger.info("ChatList");
	
		ChatDto chatdto = new ChatDto();
		
		List<ChatDto>chatList = chatbiz.selectChatList();
    	
		model.addAttribute("chatList", chatList);
		return "chatlist";
	}
	
	@RequestMapping(value = "/chatForm.do",method = RequestMethod.GET)
	public String chatForm(Model model, String id) {
		logger.info("chatForm");
		model.addAttribute("id", id);
		return "chatForm";
	}
	
	@RequestMapping(value = "/chatInsertForm.do",method = RequestMethod.GET)
	public String chatInsertForm(Model model, @ModelAttribute ChatDto chatdto) throws IOException{
		logger.info("chatInsertForm");
		
		String roomname = chatdto.getRoomname();
		String roomdescription = chatdto.getRoomdescription();
		String id = chatdto.getId();
		System.out.println("방제:"+roomname+", 설명:"+roomdescription+", 아이디:" + id);
		
		int resOne = chatbiz.insertRoom(chatdto);
		
		if (resOne > 0) {
			System.out.println(id+"::인서트 아이디");
			
			ChatDto dtoRes = chatbiz.selectRoomNo(chatdto);
			int roomno = dtoRes.getRoomno();
			
			int resTwo = chatbiz.insertMasterInfo(id,roomno);
			System.out.println(resTwo+"::resTwo");
			
			if(resTwo > 0) {
				
				return "redirect:chatlist.do";
			}
		}else {
			 return "chatlist";
			//팝업 return "chatlist";
		}
		return null;
	}
	
	@RequestMapping(value = "/chatroom.do",method = RequestMethod.GET)
	public String ChatRoom(Model model, int roomno) {
		logger.info("Chat Room");
		System.out.println(roomno);
		ChatDto chatdto = chatbiz.selectRoomDetail(roomno);
		int lastmsgno = chatbiz.selectLastMsgno(roomno);
		System.out.println(lastmsgno+"::로우넘 1번부터*******************");
		System.out.println(chatdto.getRoomname()+"********************");
		model.addAttribute("roomno", roomno);
		model.addAttribute("chatdto", chatdto);
		model.addAttribute("lastmsgno",lastmsgno);
		return "chatroom";
	}
	
	@RequestMapping(value = "/insertuserinfo.do",method = RequestMethod.POST)
	@ResponseBody
	public void InsertUserInfo(String userid,String roomno, HttpServletResponse response) throws IOException {
		logger.info("Insert UserInfo");
		System.out.println(userid + " :: " + roomno);
		ChatDto chatdto = new ChatDto();
		chatdto.setId(userid);
		chatdto.setRoomno(Integer.parseInt(roomno));
		
		int cnt = chatbiz.selectExistUser(chatdto);
		System.out.println(cnt+"::인서트로직cnt***************");
		if(cnt==0) {
			
			System.out.println("인서트 로직");
			int res = chatbiz.InsertUserInfo(chatdto);
			System.out.println(res+"::인서트로직res***************");
				if(res > 0) {
					
					System.out.println("입장 성공!");
					List<ChatDto>list = new ArrayList<ChatDto>();
					list = chatbiz.selectConnectUser(Integer.parseInt(roomno));
					Gson gson = new Gson();
					String jsonList = gson.toJson(list);
					PrintWriter out = response.getWriter();
					out.println(jsonList);
				}else {
					System.out.println("입장 실패");
				}
		}else if(cnt > 0) {
			System.out.println("업데이트 로직");
			int res = chatbiz.updateUserInfo(chatdto);
			System.out.println(res+"::업데이트 로직res***************");
				if(res > 0) {
					System.out.println("입장 성공!");
					List<ChatDto>list = new ArrayList<ChatDto>();
					list = chatbiz.selectConnectUser(Integer.parseInt(roomno));
					Gson gson = new Gson();
					String jsonList = gson.toJson(list);
					PrintWriter out = response.getWriter();
					out.println(jsonList);
				}else {
					System.out.println("입장 실패");
				}
		}	

	}

	@RequestMapping(value="/searchUser.do",method = RequestMethod.POST)
	@ResponseBody
	public void SearchUser(String searchVal,String roomno, HttpServletResponse response) throws IOException {
		logger.info("Search User");
		System.out.println(searchVal + "::" + roomno);
		List<ChatDto>list = chatbiz.SearchUser(searchVal,roomno);
		Gson gson = new Gson();
		String jsonList = gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.println(jsonList);
	}
	
	@RequestMapping(value = "/exitRoom.do",method = RequestMethod.GET)
	public String exitRoom(Model model, String roomno, String id) {
		logger.info("exit Room");
		System.out.println(roomno + "::" + id);
		ChatDto chatdto = new ChatDto();
		chatdto.setRoomno(Integer.parseInt(roomno));
		chatdto.setId(id);
		int res = chatbiz.exitRoom(chatdto);
		
		if(res > 0) {
			System.out.println("exit업데이트 완료");
			return "redirect:chatlist.do";
		}else {
			System.out.println("exit업데이트 실패");
			return "redirect:chatlist.do";
		}
		
	}
	
	@RequestMapping(value = "/insertChat.do",method = RequestMethod.POST)
	public void insertChat(Model model, int roomno, String msg, String write_id ,HttpServletResponse response)throws IOException  {
		logger.info("insertChat");
		System.out.println(" insertChat::: roomno: "+roomno+",write_id : "+write_id+",msg : "+msg);
		
		Date time = new Date();
		
		SimpleDateFormat formatDate = new SimpleDateFormat ( "MM월dd일 HH시mm분");
		String serverTime = formatDate.format(time);
				
		System.out.println(" insertChat:"+serverTime);
		
		ChatDto chatdto = new ChatDto();
		
		chatdto.setRoomno(roomno);
		chatdto.setWrite_id(write_id);
		chatdto.setMsg(msg);
		chatdto.setSendtime(time);
		
		int res = chatbiz.insertChat(chatdto);
		System.out.println("insertChat RES : "+res);

		if (res > 0) {
			PrintWriter out = response.getWriter();
			out.println(res);
		}else {
			//팝업 return "chatlist";
		}
	}
	  @RequestMapping(value = "/deleteRoom.do",method = RequestMethod.GET)
	   public String deleteRoom(Model model, int roomno) {
	      logger.info("delete Room");
	      logger.info("roomno : "+roomno);
	      int res = 0;
	      res = chatbiz.deleteRoom(roomno);
	      
	      if(res > 0) {
	         System.out.println("방 삭제 성공");
	         return "redirect:chatlist.do";
	      }else {
	         System.out.println("방 삭제 실패");
	         return "redirect:chatlist.do";
	      }
	   }
	  
	  @RequestMapping(value = "/userProfile.do",method = RequestMethod.GET)
	  public String userProfile(Model model,String id, int roomno) {
		  logger.info("user Profile");
		  ChatDto dto = new ChatDto();
		  dto.setId(id);
		  dto.setRoomno(roomno);
		  ChatDto chatdto = chatbiz.selectUserProfile(dto);
		  model.addAttribute("chatdto", chatdto);
		  return "userProfile";
		  
	  }
	  
	  @RequestMapping(value = "/chattest.do",method = RequestMethod.GET)
	  public String TestChat(Model model,String id) {
		  logger.info("chattest");
		  model.addAttribute("id", id);
		  return "chattest";
	  }
	  
	  @RequestMapping(value = "/ajaxMsgList.do",method = RequestMethod.GET)
	  @ResponseBody
	  public void AjaxMsgList(int rownum, int roomno, HttpServletResponse response)throws IOException  {
		  logger.info("AjaxMsgList");
		  System.out.println("rownum:"+ rownum + ", roomno::" + roomno);
		  List<ChatDto> chatlist = chatbiz.selectRecentMsg(rownum,roomno);  //위에는 마지막 번호  //이건 마지막 번호로 리스트 출력
		/* System.out.println("chatlist : "+chatlist.); */
		  	Gson gson = new Gson();
			String jsonList = gson.toJson(chatlist);
			PrintWriter out = response.getWriter();
			out.println(jsonList);
	  }
	  
	  @RequestMapping(value = "/selectYourImg.do",method = RequestMethod.GET)
	  @ResponseBody
	  public void selectYourImg(String id,HttpServletResponse response) throws IOException {
		  logger.info("selectYourImg");
		  String profileimg = chatbiz.selectYourImg(id);
		  System.out.println(profileimg+"::프로필이미지*************************");
		  PrintWriter out = response.getWriter();
		  out.println(profileimg);
	  }

}

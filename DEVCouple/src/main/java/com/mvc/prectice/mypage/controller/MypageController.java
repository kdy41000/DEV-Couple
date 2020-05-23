package com.mvc.prectice.mypage.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mvc.prectice.mypage.biz.MypageBiz;
import com.mvc.prectice.mypage.dto.MypageDto;
import com.mvc.prectice.signup.dto.SignupDto;

@Controller
public class MypageController {

	private Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private MypageBiz mypagebiz;
	
	@RequestMapping(value = "/mypage.do",method = RequestMethod.GET)
	public String MypageMain(Model model,String id) {
		logger.info("MypageMain");
		MypageDto dto = mypagebiz.selectMyInfo(id);
		model.addAttribute("myinfo", dto);
		return "mypagemain";
	}
	
	@RequestMapping(value = "/revisemyinfo.do",method = RequestMethod.GET)
	public String ReviseMyinfo(Model model, String id) {
		logger.info("ReviseMyinfo");
		MypageDto dto = mypagebiz.selectMyInfo(id);
		model.addAttribute("myinfo", dto);
		return "revisemyinfo";
	}
	
	@RequestMapping(value = "/revisemyinfoRes.do",method = RequestMethod.POST)
	public String ReviseMyinfoRes(Model model,@RequestParam("profileimg")MultipartFile profileimg,@RequestParam("id")String id, @RequestParam("pw")String pw,
			@RequestParam("name")String name,@RequestParam("email")String email,@RequestParam("phone")String phone,
			@RequestParam("address")String address,@RequestParam("addone")String addone,@RequestParam("detailadd")String detailadd,@RequestParam("existFilename")String existFilename,
			HttpServletRequest request) {
		
		logger.info("ReviseMyinfoRes");
		
		int res = 0;
			MypageDto mypagedto = new MypageDto();
			 //String savePath = "C:\\Workspace_ScrollPaging\\ProjectPrectice\\src\\main\\webapp\\resources\\images\\profileimgstorage";
			String savePath = "root/apache-tomcat-9.0.33/webapps/DEVCouple/src/main/webapp/resources/images/profileimgstorage";
			 String fullPath = "";
			 String rename = "";
			 
		if(profileimg.isEmpty()) {
			System.out.println(" 빈공간 탓다*************** ");
			rename = existFilename;
		}else {	 
			System.out.println("파일 업로드 else문 탔다");
			String originalFilename = profileimg.getOriginalFilename(); // ???.jpg
		    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
		    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
		     
		    rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
		    fullPath = savePath + "\\" + rename;
		    
		    try {
				
				File file = new File(fullPath);
				System.out.println(file);
				System.out.println(profileimg);
				profileimg.transferTo(file);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}

		mypagedto.setProfileimg(rename);
		mypagedto.setId(id);
		mypagedto.setPw(pw);
		mypagedto.setName(name);
		mypagedto.setEmail(email);
		mypagedto.setPhone(phone);
		mypagedto.setAddress(address);
		mypagedto.setAddone(addone);
		mypagedto.setDetailadd(detailadd);
		
		System.out.println(mypagedto.getProfileimg()+"::****************");
		res = mypagebiz.reviseAllinfo(mypagedto);
		
		HttpSession session = request.getSession();
		
		if(res > 0) {
			System.out.println("내정보 수정 성공");
			session.setAttribute("msg", "내정보가 수정되었습니다.");
			session.setAttribute("loc", "mypage.do?id="+id);
			return "alert";
		}else {
			System.out.println("내정보 수정 실패");
			session.setAttribute("msg", "내정보수정을 실패하였습니다.");
			session.setAttribute("loc", "revisemyinfo.do?id="+id);
			return "alert";
		}
	}
	
	@RequestMapping(value = "/deletemyinfo.do")
	public String deleteMyinfo(Model model,String id) {
		logger.info("deleteMyinfo");
		model.addAttribute("id", id);
		return "deletemyinfo";
	}
	
	@RequestMapping(value = "/deletemyinfoRes.do")
	public String deleteMyinfoRes(Model model, String id, String pw, HttpServletRequest request) {
		logger.info("deleteMyinfoRes");
		MypageDto dto = new MypageDto();
		dto.setId(id);
		dto.setPw(pw);
		int res = mypagebiz.deleteMyinfo(dto);
		
		HttpSession session = request.getSession();
		if(res > 0) {
			System.out.println("삭제 성공");
			session.setAttribute("msg", "회원탈퇴를 성공하였습니다.");
			session.setAttribute("loc", "section.do");
			return "alert";
		}else {
			System.out.println("삭제 실패");
			session.setAttribute("msg", "회원탈퇴를 실패하였습니다.");
			session.setAttribute("loc", "deletemyinfo.do?id="+id);
			return "alert";
		}
	}

	public String getCurrentDayTime(){      //파일에 구분값을 주기 위한 함수(+현재시간)
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}
}

package com.mvc.prectice.signup.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mvc.prectice.signup.biz.SignupBiz;
import com.mvc.prectice.signup.dto.SignupDto;

@Controller
public class SignupController {

	private Logger logger = LoggerFactory.getLogger(SignupController.class);
	
	@Autowired
	SignupBiz signupbiz;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("/agreement.do")
	public String Agreement(Model model) {
		return "agreement";
	}
	
	@RequestMapping("/signupform.do")
	public String SignupForm(Model model) {
		return "signupform";
	}
	
	@RequestMapping(value = "/idchk.do",method = RequestMethod.POST)
	@ResponseBody
	public void AjaxidChk(@RequestParam("id")String id, HttpServletResponse response) throws IOException {
		int res = 0;
		res = signupbiz.idchk(id);
		
		int chk = 1;  //1은 사용불가
		if(res == 0) {
			chk = 0;   //0은 사용가능
		}
		PrintWriter out = response.getWriter();
		out.println(chk);
	}
	
	@RequestMapping(value = "/ajaxemailchk.do",method = RequestMethod.POST)
	@ResponseBody
	public void AjaxemailChk(@RequestParam("email")String email, HttpServletResponse response) throws IOException {
		int res = 0;
		res = signupbiz.emailchk(email);
		
		int chk = 1;  //1은 사용불가
		if(res == 0) {
			chk = 0;    //0은 사용가능
		}
		PrintWriter out = response.getWriter();
		out.println(chk);
	}
	
	@RequestMapping(value ="/ajaxemailsend.do",method = RequestMethod.POST)
	@ResponseBody
	public void AjaxemailSend(@RequestParam("email")String email, HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		logger.info("AjaxemailSend");
		String setfrom = "kdy41000@gmail.com";
		String tomail = email;
		String title = "ㅇㅇㅇ에서 보낸 인증번호 전송 메일입니다.";
		String authNum = getRamdomPassword(7);
		System.out.println(authNum);
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다.
			messageHelper.setText("인증번호: ["+authNum+"]"); // 메일 내용
			
			mailSender.send(message);
	
		} catch (Exception e) {
			System.out.println(e);
		}

		PrintWriter out = response.getWriter();
		out.println(authNum);
	}
	
	public static String getRamdomPassword(int len) {   //인증번호 생성 함수
	  	  char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7',
	  			'8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 
	  			'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
	  			'U', 'V', 'W', 'X', 'Y', 'Z' };

	  	  int idx = 0;
	  	  StringBuffer sb = new StringBuffer();
	  	  
	  	  //System.out.println("charSet.length :::: "+charSet.length);
	  	  
	  	  for (int i = 0; i < len; i++) {
	  		
	  		  idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를  Int로 추출 (소숫점제거)
	  		  //System.out.println("idx :::: "+idx);
	  		  sb.append(charSet[idx]);
	  	  }

	  	  return sb.toString();
	  	}
	
	@RequestMapping(value = "signupRes.do",method = RequestMethod.POST)
	public String SignupRes(Model model,@RequestParam("profileimg")MultipartFile profileimg,@RequestParam("id")String id, @RequestParam("pw")String pw,
			@RequestParam("name")String name,@RequestParam("email")String email,@RequestParam("phone")String phone,
			@RequestParam("address")String address,@RequestParam("addone")String addone,@RequestParam("detailadd")String detailadd) {
		logger.info("SignupRes");
	
		int res = 0;
		SignupDto signupdto = new SignupDto();
		 //String savePath = "C:\\Workspace_ScrollPaging\\ProjectPrectice\\src\\main\\webapp\\resources\\images\\profileimgstorage";
		String savePath = "root/apache-tomcat-9.0.33/webapps/DEVCouple/src/main/webapp/resources/images/profileimgstorage"; 
		String fullPath = "";
		 String rename = "";
	
		 if(profileimg.isEmpty()) {
			rename = "defaulthuman.png";
			
		 }else {
			String originalFilename = profileimg.getOriginalFilename(); // ???.jpg
		    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
		    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
		     
		    rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
		    fullPath = savePath + "\\" + rename;
		}
		
		if(!profileimg.isEmpty()) {
			try {
				File file = new File(fullPath);
				profileimg.transferTo(file);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		signupdto.setProfileimg(rename);
		signupdto.setId(id);
		signupdto.setPw(pw);
		signupdto.setName(name);
		signupdto.setEmail(email);
		signupdto.setPhone(phone);
		signupdto.setAddress(address);
		signupdto.setAddone(addone);
		signupdto.setDetailadd(detailadd);
		
		System.out.println(signupdto.getProfileimg()+"::****************");
		res = signupbiz.insertAllinfo(signupdto);
		
		if(res > 0) {
			System.out.println("회원가입 성공");
		}else {
			System.out.println("회원가입 실패");
		}
		return "section";
	}
	
	public String getCurrentDayTime(){      //파일에 구분값을 주기 위한 함수(+현재시간)
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}
}

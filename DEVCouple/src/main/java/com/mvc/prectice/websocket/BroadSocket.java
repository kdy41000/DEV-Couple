package com.mvc.prectice.websocket;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.mvc.prectice.chat.biz.ChatBiz;
import com.mvc.prectice.chat.dto.ChatDto;
// WebSocket 호스트 설정
@ServerEndpoint("/broadsocket")
public class BroadSocket {
      
      // 접속 된 클라이언트 WebSocket session 관리 리스트
      private static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());
      // 메시지에서 유저 명을 취득하기 위한 정규식 표현
      private static Pattern pattern = Pattern.compile("^\\{\\{.*?\\}\\}");
      // WebSocket으로 브라우저가 접속하면 요청되는 함수
      @OnOpen
      public void handleOpen(Session userSession) {
      // 클라이언트가 접속하면 WebSocket세션을 리스트에 저장한다.
      sessionUsers.add(userSession);
      // 콘솔에 접속 로그를 출력한다.
      System.out.println("client is now connected...");
      }
      // WebSocket으로 메시지가 오면 요청되는 함수
      @OnMessage
      public void handleMessage(String message, Session userSession) throws IOException {
   
      //　초기 유저 명
      String name = "anonymous";
      
      //DATE 세팅 
      SimpleDateFormat format1 = new SimpleDateFormat ( "HH:mm");
      //SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy년 MM월dd일 HH시mm분ss초");
      		
      Date time = new Date();
      		
      String toTime = format1.format(time);
     // String time2 = format2.format(time);
      		
      System.out.println(toTime);
      //System.out.println(time2);
      
      
      // 메시지로 유저 명을 추출한다.
      Matcher matcher = pattern.matcher(message);
      // 메시지 예: {{유저명}}메시지
      if (matcher.find()) {
      name = matcher.group();
      }
      // 클로져를 위해 변수의 상수화
      final String msg = message.replaceAll(pattern.pattern(), "");
      final String username = name.replaceFirst("^\\{\\{", "").replaceFirst("\\}\\}$", "");
      System.out.println(username+":****************************");
      String[] splitVal = username.split("/");
      // session관리 리스트에서 Session을 취득한다.
      sessionUsers.forEach(session -> {
      // 리스트에 있는 세션과 메시지를 보낸 세션이 같으면 메시지 송신할 필요없다.
      if (session == userSession) {
      return;
      }
      try {
   
      // 리스트에 있는 모든 세션(메시지 보낸 유저 제외)에 메시지를 보낸다. (형식: 유저명 => 메시지)
      //session.getBasicRemote().sendText(username + " => " + msg);
      session.getBasicRemote().sendText(splitVal[0]+"◇"+splitVal[1]+"◇<p style='margin-left:6%;'>"+ splitVal[1] +"</p>"+
                                "<div class='message'>"+
                                "<div class='photo' style='margin-top: -3%;'>"+
                                "<img src='resources/images/profileimgstorage/◇defaulthuman.png◇' style='width:100%; height:50px; border-radius:50%;'/>"+
                                "<div class='online' style='margin-top: -110%;'></div></div>"+
                                "<p class='text' style='margin-top: -3%;'>"+  msg +"</p>"+
                                "<p class='time' style='margin-top: -0.5%; margin-left: -2%;'>"+ toTime +"</p><br/><br/><br/>");
      } catch (IOException e) {
      // 에러가 발생하면 콘솔에 표시한다.
      e.printStackTrace();
      }
      });
      }
      // WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
      @OnClose
      public void handleClose(Session userSession) {
      // session 리스트로 접속 끊은 세션을 제거한다.
      sessionUsers.remove(userSession);
      // 콘솔에 접속 끊김 로그를 출력한다.
      System.out.println("client is now disconnected...");
      }
}
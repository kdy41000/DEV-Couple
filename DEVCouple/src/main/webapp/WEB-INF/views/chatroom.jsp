<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="resources/css/chatroom.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- 메세지 디테일 -->
 <link rel="stylesheet" type="text/css" href="resources/css/chatmsgarea.css"/>
<!-- 메세지 디테일 -->
<style type="text/css">
@media (min-width: 480px) and (max-width: 1024px){
   .startDay{
      margin-left: 45%;
   }
   .doar{
       width: 10%;
   }
   td, th {
    padding: 0.75em 3.0em;
    text-align: center;
    
   }
   .writechatbtn{
      width:8%; height:70px; cursor:pointer;
   }
   
   .write-message{
      width:73%;
   }
}

@media (min-width: 1025px){
   .startDay{
      margin-left: 68%;
   }
   .doar{
      width: 5%;
   }
   td, th {
    padding: 0.75em 1.5em;
    text-align: center;
    
   }
   .writechatbtn{
      width:5%; height:70px; cursor:pointer;
   }
}
   

</style>
</head>
<script type="text/javascript">
   /* 무한 스크롤 eventListner */
   let isEnd = false;
   let lastmsgno = ${lastmsgno };
   var curRoomno = "${roomno}";
   
   $(function(){
      // $(".scrolldowngif").hide();
      $(".messages-chat").scroll(function(){
         //$(".scrolldowngif").show();
         var scrollTop = $(".messages-chat").scrollTop();  //현재 브라우저의 스크롤이 있는 위치
         var documentHeight = $(".messages-chat").height();  //문서의 총 높이
         var windowHeight = $(".messages-chat").height();  //브라우저에 보여지는 높이
         
         console.log(
               "documentHeight : " + $(".messages-chat").height()
               + " | scrollTop : " + $(".messages-chat").scrollTop() 
               + " | windowHeight : " + $(".messages-chat").height()
               + " | scrollTop + windowHeight = " + ($(".messages-chat").scrollTop() + $(".messages-chat").height())
               );
         
          if(scrollTop == 0){
            selectList();
         } 
      });
      
      selectList();
   });
   
   function selectList(){
      if(isEnd == true)    //처음에는 false, true면 끝
         return;
       //alert("selectList 의 lastmsgno "+lastmsgno);
      $.getJSON("ajaxMsgList.do?rownum=" + lastmsgno +"&roomno=" + curRoomno, function(data){
         // 가져온 데이터가 12개 이하일 경우 무한 스크롤 종료
         
         let length = data.length;
         
         //alert(length+"length");
         if(length < 12){
            isEnd = true;
            console.log("------------마지막 데이터까지 가져옴--------------")
            //$(".scrolldowngif").remove();
         }
         msgListAppend(data);   //isEnd가 true면 마지막 데이터를 넣어 함수 실행
      })

      lastmsgno += 12;
      
   }
   
   function msgListAppend(data){   // List 뿌리기
      var userinfo = "${sessionScope.logininfo.id}";
      var beforeMsg = "";
      var beforeTime = "";
      
      var sendList_id = new Array(); 
      var sendList_Msg = new Array(); 
      var sendList_sendtime = new Array(); 
      var sendList_profileimg = new Array(); 
      
      //console.log("온당 data"+data);
      
      //순서 ex) rownum 1 ~ 12 : 1이 가장 최근에 보낸것 
      $.each(data, function(key,val){
         
         sendList_id.push(val.write_id);
         sendList_Msg.push(val.msg);
         sendList_sendtime.push(val.sendtime);
         sendList_profileimg.push(val.profileimg);
         
      })
      
      console.log("온당sendList_profileimg::"+sendList_profileimg);
      
      //순서 : 역배열?
    /*
      var sendList_id_flip = new Array(); 
      var sendList_Msg_flip = new Array(); 
      var sendList_sendtime_flip = new Array(); 
      
      var List_length = sendList_id.length - 1; // 배열 갯수 -1 //11 
      
      for(var i=List_length; i>-1; i--) {
         
         sendList_id_flip[List_length - i] = String(sendList_id[i]);
         sendList_Msg_flip[List_length - i] = String(sendList_Msg[i]);
         sendList_sendtime_flip[List_length - i] = String(sendList_sendtime[i]);
         
      }
      */
      //console.log("온당 정상"+sendList_id);
     // console.log("온당 정상"+sendList_Msg);
     // console.log("온당 정상"+sendList_profileimg);
         
         //alert(val.sendtime); 
         var cnt = 0;
         var chk_cnt = 0;
         var chk_cnt_you = 0;
         
         for (var j=0; j<sendList_id.length; j++) { //12개
         //for(var i=List_length; i>-1; i--) {
            cnt += 1;
            
            if(sendList_id[j] == userinfo){//내가보낸 메세지
               beforeMsg = $("<div class='message text-only'>")
                           .append("<div class='response'>")
                           .append("<p class='text' style='background:#f3ff3a; margin-left:-2%;'>"+ sendList_Msg[j] +"</p>")
               beforeTime = $("<p class='response-time time' style='margin-left: 74%; margin-top: -1.5%;'>"+sendList_sendtime[j]+"</p>")
                         $("#output").prepend(beforeTime).prepend(beforeMsg);
            
                
                         chk_cnt += 1;   
            }else{//상대가 보낸 메세지/*
               beforeMsg = $("<p style='margin-left:6%; margin-bottom: 3.5%;'>"+sendList_id[j] +"</p>"+
                     "<div class='message'><div class='photo' style='margin-top: -3%;'>"+
                     "<img alt='img' src=resources/images/profileimgstorage/"+sendList_profileimg[j]+" style='width:100%; height: 50px; border-radius:50%; margin-top: -15%;'/>"+
                      "<div class='online'style=' margin-top: -110%;'></div></div>"+
                      "<p class='text' style='margin-top: -3%; width:9.5%;'>"+ sendList_Msg[j] +"</p>");
               beforeTime = $("<p class='time' style='margin-top: -1.5%; margin-left: 18%;'>" + sendList_sendtime[j] +"</p>");
                     $("#output").prepend(beforeTime).prepend(beforeMsg);
               //$("#output").prepend(beforeMsg);
                     chk_cnt_you += 1;   
            }
         
         }
         //alert("포문돈 횟수 : "+cnt+", id가 내꺼인것"+chk_cnt+", id가 다른애것: "+chk_cnt_you);
      
   }
   
</script>
 <script type="text/javascript">
 
          $(function(){                               // 유저 리스트 ********************************
             var userinfo = "${sessionScope.logininfo.id}";
             var roomno = "${roomno}";
             var userListVal = "";
             $.ajax({
                url:"insertuserinfo.do",
                type:"post",
                data:{"userid":userinfo,"roomno":roomno},
                dataType:"json",
                success:function(data){
                   //console.log(data);
                   var totalUserCnt = data.length;
                   //alert(totalUserCnt);
                   $("#totalUserCnt").append(totalUserCnt);
                   
                   $.each(data,function(key,val){
                      
                      var gradeStr = "";
                      if(val.grade == 2){
                         gradeStr = "일반유저";
                      }else if(val.grade == 1){
                         gradeStr = "방장";
                      }
                      
                      console.log(key + "::" + val.name + "::" + val.profileimg);
                      
                      userListVal = val.id;
                      
                      var leftUserList = $("<div class='chatUser' onclick='userProfile(`"+val.id+"`);'>")
                      .append("<div class='chatUserIcon'>"+
                       "<img src='resources/images/profileimgstorage/"+val.profileimg+"'/></div>")
                      .append("<div class='chatUserDetails'>"+
                      "<span class='chatUserid'>"+val.id+"</span>"+
                      "<span class='chatUsername'>("+val.name+")</span>"+
                      "<span class='lastMessageTime'>"+gradeStr+"</span>")
                
                      
                      $(".chats").append(leftUserList);
                   })
                },
                error:function(){
                   alert("통신 실패");
                }
                
             })
             
             
          });
</script>

<body>
<div class="messagingApp">
  <div class="appOverlay"></div>
  
  <!-- 접속유저 리스트 -->
  <div class="chatList">
    <header class="chatListHeader">
      <div id="sidebar-btn"></div>
      <h1 class="chatTitle">Chat User List<span style="font-size:13px; float:right; color:#bd9e9e;">(접속자 수:&nbsp;<a id="totalUserCnt" ></a>)</span></h1>
    </header>
    <div class="chats">
        <!-- 접속유저 리스트 들어갈 자리 -->

      <!-- <div class="chatUser" onclick="userProfile();">
      <div class="chatUserIcon"></div></div>
         <div class="chatUserDetails">
         <span class="chatUserid">테스트아이디</span>
         <span class="chatUsername">(테스트이름)</span>
         <span class="lastMessageTime">일반</span></div> -->
       
    </div>
    <div class="chatOptions">
      <input type="text" class="search" placeholder="Search User"/>
    </div>
  </div>
 <!-- 접속유저 리스트 -->
 
   <!-- 메세지 들어갈 곳 -->
      <section class="chat">
        <div class="header-chat">
          <i class="icon fa fa-user-o" aria-hidden="true"></i>
          <p class="name">${chatdto.roomname }</p>
          <span class="startDay" style=" color:#bd9e9e;">(개설일:&nbsp;<fmt:formatDate value="${chatdto.maketime }" pattern="yyyy.MM.dd"/>)</span>
     
           <!-- 방나가기 -->
             <img class="doar" alt="exitbtn" src="https://cdn2.iconfinder.com/data/icons/mobile-web-apps-1/32/open-512.png" 
                onclick="exitRoom();" style=" height:70px; cursor:pointer; margin-left:4%;" onclick=""/>
            <span class="exitRoom" style="color:#ce0e0e; font-weight:bold; cursor:pointer;" onclick="exitRoom();">방나가기</span>
         <!-- 방나가기 -->
        </div>
               
        <div class="messages-chat" style="height:620px; overflow:scroll; overflow-x:hidden;">
        
        <%-- <div class="message">
            <div class="photo" style="background-image: url(https://image.freepik.com/free-vector/robot-icon-bot-sign-design-chatbot-symbol-concept-voice-support-service-bot-online-support-bot-vector-stock-illustration_100456-34.jpg);">
              <div class="online"></div>
            </div>
            <p class="text" style="background-color:#ecb7b8; color:white; font-weight:bold;">${chatdto.roomdescription }</p>
         </div>           --%>
          
        <!-- 상대가 보낸 메세지 -->
        <div class="beforeMsg"></div>
        <!--<p>id</p>
          <div class="message">
          <p>id</p>
           <div class="photo">
              <img alt="img" src="resources/images/profileimgstorage/defaulthuman.png" style="width:100%; border-radius:50%;"/>
              <div class="online"></div>
            </div>
            <p class="text"> Hi, how are you ? </p>
          </div>           
          <p class="time"> 14h58</p>-->
          
           <!-- Server responses get written here *************************************************************** -->
            <div id="output"></div>

        <!-- 상대가 보낸 메세지 끝 -->
        
      <!-- 테스트영역****************** -->
      
      <!-- 유저 명을 입력하는 텍스트 박스(기본 값은 anonymous(익명)) -->
      <!--    <input id="user" type="text" value="anonymous">
         송신 메시지를 작성하는 텍스트 박스
         <input id="textMessage" type="text">
         메세지를 송신하는 버튼
         <input onclick="sendMessage();" value="Send" type="button">
         WebSocket 접속 종료하는 버튼
         <input onclick="disconnect();" value="Disconnect" type="button">
   
         <br /> -->
      <!-- 콘솔 메시지의 역할을 하는 로그 텍스트 에리어.(수신 메시지도 표시한다.) -->
      <!-- <textarea id="messageTextArea" rows="10" cols="50"></textarea> -->
      <!-- 테스트 영역 끝****************************** -->

        <!-- 내가 보낸 메세지 -->     
    <!--  <div class="message text-only">
            <div class="response">
              <p class="text"> Hey Megan ! It's been a while 😃</p>
            </div>
          </div>
          <p class="response-time time"> 15h04</p> -->
        <!-- 내가 보낸 메세지 -->
          
        </div>
   <!-- 메세지 들어갈 곳 -->  
   <!-- 입력 란 -->
        <div class="footer-chat">
         <!--  <i class="icon fa fa-smile-o clickable" style="font-size:25pt;" aria-hidden="true"></i> -->
           <input type="text" id="msg" name="msg" class="write-message" placeholder="Type your message here" onkeypress="if(event.keyCode==13) {sendMessage();}"></input>
         
          <img class="writechatbtn" alt="sendbtn" src="https://static.thenounproject.com/png/1054386-200.png" 
          onclick="sendMessage();" />
        </div>
   <!-- 입력 란 -->           
      </section>

 
</div>
</body>
<script type="text/javascript">
var roomno = "${roomno}";
var searchVal = "";

   $(".search").keyup(function(){               // Search User********************************
      searchVal = $(".search").val();
      //alert("눌러사");
      console.log(searchVal);
      AjaxSearchUser(searchVal);
   
   });
   
   function AjaxSearchUser(paramSearchVal){
      
      $.ajax({
         url:"searchUser.do",
         type:"post",
         dataType:"json",
         data:{"searchVal":paramSearchVal,"roomno":roomno},
         success:function(data){
           console.log(data);
            
            $.each(data,function(key,val){
               //console.log(val.id+"****************");
               
               for(var i = 0; i < $(".chatUserid").length; i++){
                  if($(".chatUserid").eq(i).text() == val.id){
                     //alert("같아");
                     $(".chatUserDetails").eq(i).css("color","red");
                  }
                  if($(".chatUserid").eq(i).text() != val.id || paramSearchVal == ""){
                     $(".chatUserDetails").eq(i).css("color","black");
                  }
               }
            })
         },
         error:function(){
            //alert("통신 실패");
         }
      })
   }
   
   function exitRoom(){                // exit *******************************
      location.href="exitRoom.do?roomno="+roomno+"&id=${sessionScope.logininfo.id}";
   }
</script>
<script type="text/javascript">
   var roomno = "${roomno}";
   
   function userProfile(ParamUserId){              // User Profile************************************
      //alert(ParamUserId);
      var popUrl = "userProfile.do?id="+ParamUserId+"&roomno="+roomno;   //팝업창에 출력될 페이지 URL

      var popOption = "width=370, height=450, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

         window.open(popUrl,"",popOption);
   }
</script>

<script type="text/javascript">
//서버시간 가져오기 
  var xmlHttp;
  var st = srvTime();
  var date = new Date(st);
  var curTimeServer = date.getHours().toString()+":"+date.getMinutes().toString();
  
function srvTime() {
    try {
        //FF, Opera, Safari, Chrome
        xmlHttp = new XMLHttpRequest();
    }
    catch (err1) {
        //IE
        try {
            xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
        }
        catch (err2) {
            try {
                xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
            }
            catch (eerr3) {
                //AJAX not supported, use CPU time.
                alert("AJAX not supported");
            }
        }
    }
    xmlHttp.open('HEAD', window.location.href.toString(), false);
    xmlHttp.setRequestHeader("Content-Type", "text/html");
    xmlHttp.send('');
    return xmlHttp.getResponseHeader("Date");
}

      // Web Socket************************************************************
var webSocket = new WebSocket("ws://172.30.1.34:8787/prectice/broadsocket");
       // 「broadsocket」는 호스트 명
       // WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)
       //var webSocket = new WebSocket("ws://172.30.1.51:8787/prectice/broadsocket");
   
       // 콘솔 텍스트 에리어 오브젝트
      // var messageTextArea = document.getElementById("messageTextArea");
       var output = $("#output");
       var roomno = "${roomno}";
       
       // WebSocket 서버와 접속이 되면 호출되는 함수
       webSocket.onopen = function(message) {
       // 콘솔 텍스트에 메시지를 출력한다.
       //output.append("--------------------------------------------------(웹소켓 이전메세지 출력하고 새로운 메세지는 웹소켓으로 출력하고 디비 인서트)<br/><br/><br/><br/><br/>");
       };
       // WebSocket 서버와 접속이 끊기면 호출되는 함수
       webSocket.onclose = function(message) {
       // 콘솔 텍스트에 메시지를 출력한다.
       messageTextArea.value += "Server Disconnect...\n";
       };
       // WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
       webSocket.onerror = function(message) {
       // 콘솔 텍스트에 메시지를 출력한다.
       messageTextArea.value += "error...\n";
       };
       /// WebSocket 서버로 부터 메시지가 오면 호출되는 함수***********************************
       webSocket.onmessage = function(message) {
       // 콘솔 텍스트에 메시지를 출력한다.
       //alert(message + ":" + message.data);
       
       var roomno_java = message.data.split('◇');
       var message_java = roomno_java[1];
       
       if (roomno_java[0] == roomno){

          $.ajax({
             url:"selectYourImg.do",
             type:"get",
             dataType:"text",
             data:{"id":roomno_java[1]},
             success:function(data){
                  //alert("들어온 상대 이미지:"+data);
                 output.append(roomno_java[2]+data+roomno_java[4] + "<br/>");
                //스크롤바 가장 하단으로 내리기
                  // $(".messages-chat").prop('scrollTop') = $(".messages-chat").prop('scrollHeight');
                   $(".messages-chat").scrollTop($(".messages-chat")[0].scrollHeight); 
             },
             error:function(){
                console.log("통신 실패");
             }
          })
         
       }
       
       };
       
       // Send 버튼을 누르면 호출되는 함수
       function sendMessage() {
       // 유저명 텍스트 박스 오브젝트를 취득
       //var user = document.getElementById("user");
       var user = "${sessionScope.logininfo.id}";
       // 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득
       var message = document.getElementById("msg");
       // 콘솔 텍스트에 메시지를 출력한다.
       //output.append(user.value + "(me) => " + message.value + "<br/>");
       var sendMyMsg = $("<div class='message text-only'>")
                     .append("<div class='response'>")
                     .append("<p class='text' style='background:#f3ff3a; margin-left:-2%;'>"+message.value + "</p><br/>")
       var curTime = $("<p class='response-time time' style='margin-left: 80%; margin-top: -1.5%;'>"+ curTimeServer +"</p>")         
      
      // var ResMsg = sendMyMsg.append(curTime)              
                   // "<div class='response>'"+
                   // "<p class='text'>"+user+":"+message.value + "</p>"+
                   //"</div></div></p class='response-time time'>15h04</p>")
       
      output.append(sendMyMsg).append(curTime);
      insertAjax(message.value , user ,roomno)
       
       // WebSocket 서버에 메시지를 전송(형식　「{{유저명}}메시지」)
       webSocket.send("{{" + roomno +"/"+ user + "}}" + message.value);
       // 송신 메시지를 작성한 텍스트 박스를 초기화한다.
       message.value = "";
       
       //스크롤바 가장 하단으로 내리기
      // $(".messages-chat").prop('scrollTop') = $(".messages-chat").prop('scrollHeight');
       $(".messages-chat").scrollTop($(".messages-chat")[0].scrollHeight); 
       }
       // Disconnect 버튼을 누르면 호출되는 함수
       function disconnect() {
       // WebSocket 접속 해제
       webSocket.close();
       }

       function insertAjax( message, user ,roomno){
          
         $.ajax({
               url:"insertChat.do",
               type:"post",
               data:{"write_id":user,"roomno":roomno, "msg" : message},
               //dataType:"json",
               success:function(data){
                  console.log("insertmsg");
               }, 
               error:function(){
                  console.log("insertmsg failed");
               }
               
          });
       }
</script>
</html>
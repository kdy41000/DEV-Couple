<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/chatbotmain.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
  <div class='chat-wrapper'>
<center class="header"><b>Dev Chatbot</b><br/><img src="resources/images/logo.png" style="width:8%;"/></center>
	
    <div class='chat-message padding' style="height:100px; overflow:scroll; overflow-x:hidden;">
	  <!-- 챗봇 초기 메세지 -->
      <div class='chat-message chat-message-recipient'>
        <img class='chat-image chat-image-default' src='https://data.whicdn.com/images/310378640/original.png' />	
        <div class='chat-message-wrapper'>
          <div class='chat-message-content'>
            <p>안녕하세요.<br/>저는 DEV Couple의 문의사항을 담당할 DEV냥냥이라고 해요.<br/>"안녕하세요"를 입력해보세요~</p>
          </div>

        </div>
        
      </div>
	  <!-- 챗봇 초기 메세지 끝 -->
	  <!-- 메세지 붙일 공간 -->
      <div class="output" ></div>
	  <!-- 메세지 붙일 공간 -->
	  <!-- 내가 보낸 메세지 -->
     <!--  <div class='chat-message chat-message-sender'>

        <div class='chat-message-wrapper'>
          <div class='chat-message-content'>
            <p>Pizza?</p>
            <p>We had sushi last time!</p>
            <p>For me one Vegetariana! Plus some chili oil on it!</p>
           
          </div>

        </div>
      </div> -->
	  <!-- 내가 보낸 메세지 -->
	
    </div>
    <br/><br/><br/><br/><br/><br/><br/>
  </div>
  <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
  <ul class="questionsul">
  	
  	<li><input class="questionlist" type="button" value="DEV Couple이란?" onclick="questionEnsure('DEV Couple이란?');" /></li>
    <li><input class="questionlist" type="button" value="현재 사용 가능한 기능은?" onclick="questionEnsure('현재 사용 가능한 기능은?');"/></li>
  	<li><input class="questionlist" type="button" value="문의사항은 어떻게 보내나요?" onclick="questionEnsure('문의사항은 어떻게 보내나요?');"/></li>
  </ul>
  <br/>
  <input class="sendtag" type="text" placeholder="Write down your questions..." onkeypress="if(event.keyCode==13) {sendMessage();}"/>
  <input class="sendbtn" type="button" value="Send" onclick="sendMessage();"/>
</body>
<script type="text/javascript">
	var output = $(".output");   //메세지 붙일 tag
	var mysend = "";
	var chatbotsend = "";
	var replybotmsg = "";

	
	function onKeyDown()
	{
	     if(event.keyCode == 13)
	     {
	    	 $('html').scrollTop($('html').scrollHeight);
	     }
	}

	function sendMessage(){
		var message = $(".sendtag").val();
		
		if(message == ""){
			return;
		}else{
			mysend = $("<div class='chat-message chat-message-sender'>")
					.append("<div class='chat-message-wrapper'>"+
						    "<div class='chat-message-content'>"+
							"<p>"+ message +"</p></div></div>")
	
			output.append(mysend);
			
			var randomVal = Math.floor(Math.random() * 6) + 1;//1 ~ 6
		    var replybotmsg = "";
			
			if(message.includes("안녕") || message.includes("인사")){
				
				switch (randomVal) {
	            case 1:  replybotmsg = "안낭!";
	                     break;
	            case 2:  replybotmsg = "기래애~~공손하고나~";
	                     break;
	            case 3:  replybotmsg = "방가방가 햄토리다냥~~";
                		break;
	            case 4:  replybotmsg = "인사잘하는고먄~~";
        				break;
	            default: replybotmsg = "안냐옹~";
                		 break;
			    }
			}else if(message.includes("바보")){
				replybotmsg = "너가 더 바보다냥ㅡㅡ";
			}else if(message.includes("사랑")){
				replybotmsg = "사랑해요♥";
			}else if(message.includes("날씨")){
				replybotmsg = "날씨는 네이버에서 검색하라냥!!!";
			}else if(message.includes("졸려") || message.includes("졸리다")){
				replybotmsg = "나도 졸리다냥";
			}else if(message.includes("뭐해") || message.includes("머해") || message.includes("뭐하고") || message.includes("머하고")){
				replybotmsg = "채팅하고 있다냥!";
			}else if(message.includes("고생")){
				replybotmsg = "너도 고생했다냥~^^";
			}else if(message.includes("좋아")){
				replybotmsg = "나도 좋다냥~!";
			}else if(message.includes("동영")){
				switch (randomVal) {
	            case 1:  replybotmsg = "동: 동동이는,  영: 영구래요  ~~>_<~";
	                     break;
	            case 2:  replybotmsg = "동요미는 제일기엽다냥~";
	                     break;
	            case 3:  replybotmsg = "먕먕!";
                		break;
	            case 4:  replybotmsg = "으르릉~~";
        				break;
	            default: replybotmsg = "동영이는 멋있다냥~";
                		 break;
			    }
			}else if(message.includes("보영")){
				switch (randomVal) {
	            case 1:  replybotmsg = "보요미 보고싶지~~~?";
	                     break;
	            case 2:  replybotmsg = "너 보요미 조아하지~?";
	                     break;
	            case 3:  replybotmsg = "먕먕!";
                		break;
	            case 4:  replybotmsg = "아앙~~";
        				break;
	            default: replybotmsg = "보영이는 예쁘다~";
                		 break;
			    }
			}else if(message.includes("너는") || message.includes("이름")){
				replybotmsg = "나는 DEV냥냥이다냥~";
			}else if(message.includes("냥")|| message.includes("이쁜")|| message.includes("이뽀")){
				switch (randomVal) {
	            case 1:  replybotmsg = "잉 죠아";
	                     break;
	            case 2:  replybotmsg = "잉~ 안아죠";
	                     break;
	            case 3:  replybotmsg = "먕먕!";
                		break;
	            case 4:  replybotmsg = "으르릉~~";
        				break;
	            default: replybotmsg = "냥냥냥냥냥~";
                		 break;
			    }
			}else if(message.includes("기여") || message.includes("귀여")){
				replybotmsg = "나도 안다냥~";
			}else if(message.includes("몇살")){
				replybotmsg = "너보단 많다냥!";
			}else if(message.includes("심심")){
				replybotmsg = "DEV냥냥이랑 놀자아~";
			}else if(message.includes("뽀뽀")|| message.includes("쪽쪽")){
				  switch (randomVal) {
		            case 1:  replybotmsg = "사랑해~";
		                     break;
		            case 2:  replybotmsg = "잉~부꾸러";
		                     break;
		            default: replybotmsg = "쪽~";
           		 			 break;
				  }
			}else if(message.includes("보보")|| message.includes("보비")|| message.includes("돔돔")|| message.includes("도미")|| message.includes("동동")|| message.includes("도마")){
				switch (randomVal) {
	            case 1:  replybotmsg = "우웅~~~왜에?";
	                     break;
	            case 2:  replybotmsg = "아앙~~~불려쪄?";
	                     break;
	            case 3:  replybotmsg = "이잉 왜불러 이쁘나아~~";
	                     break;
	            case 4:  replybotmsg = "응! 울 예쁜 동동이~ ";
	                     break;
	            default:  replybotmsg = "냥!";
	                     break;
	        	}
			}else{
		   
		        switch (randomVal) {
		            case 1:  replybotmsg = "질문을 이해 할 수 없어요ㅠㅇㅠ";
		                     break;
		            case 2:  replybotmsg = "ㅇㅅㅇ ????(갸웃갸웃)";
		                     break;
		            case 3:  replybotmsg = "잉~~못알아들엇쪄~";
		                     break;
		            case 4:  replybotmsg = "질문을 이해할 수 없어요 ㅠoㅠ (방울방울) ";
		                     break;
		            case 5:  replybotmsg = "쉽게말해주면 안대냥냥냥~~~~~울먹울먹 ㅠ o ㅠ";
		                     break;
		            case 6:  replybotmsg = "갸웃갸웃 ㅇㅅㅇ?";
		                     break;
		                     
		        }
				
			}
			
			chatbotsend = $("<div class='chat-message chat-message-recipient'>")
			 .append("<img class='chat-image chat-image-default' src='https://data.whicdn.com/images/310378640/original.png' />"+
					 "<div class='chat-message-wrapper'>"+
					 "<div class='chat-message-content'>"+
					 "<p>"+ replybotmsg +"</p></div></div>")
			
			output.append(chatbotsend);
			$(".sendtag").val("");
			$('html').scrollTop($('html').scrollHeight);
			
		}
	}
	
	function questionEnsure(ParamQuestion){
		if(ParamQuestion == "DEV Couple이란?"){
			chatbotsend = $("<div class='chat-message chat-message-recipient'>")
						 .append("<img class='chat-image chat-image-default' src='https://data.whicdn.com/images/310378640/original.png' />"+
								 "<div class='chat-message-wrapper'>"+
								 "<div class='chat-message-content'>"+
								 "<p>DEV Couple은 개발자 커플의 기능구현 연습장소다냥~</p>"+
								 "<p>테마 따윈 없고 그냥 이것저것 구현하는 장소다아~</p></div></div>")
		}else if(ParamQuestion == "현재 사용 가능한 기능은?"){
			chatbotsend = $("<div class='chat-message chat-message-recipient'>")
						 .append("<img class='chat-image chat-image-default' src='https://data.whicdn.com/images/310378640/original.png' />"+
								 "<div class='chat-message-wrapper'>"+
								 "<div class='chat-message-content'>"+
								 "<p>1.개발자 커플의 Skill Intentory(AboutMe메뉴)</p>"+
								 "<p>2.개발관련 게시판(개발Tip메뉴)</p>"+
								 "<p>3.CGV 현재 상영작(Home > CGV Movie)</p>"+
								 "<p>4.회원가입 > 로그인을 하면 쪽지함 방별채팅방을 이용 할 수 있다냥~</p></div></div>")
		}else if(ParamQuestion == "문의사항은 어떻게 보내나요?"){
			chatbotsend = $("<div class='chat-message chat-message-recipient'>")
			 .append("<img class='chat-image chat-image-default' src='https://data.whicdn.com/images/310378640/original.png' />"+
					 "<div class='chat-message-wrapper'>"+
					 "<div class='chat-message-content'>"+
					 "<p>Contact메뉴를 누른다음 답장받을 이메일, 내용을 입력한 다음 </p><p>DEV Couple에게 이메일을 전송하라냥~</p>"+
					 "</div></div>")
		}	
		output.append(chatbotsend);
		$(".chat-message chat-message-recipient").scrollTop($(".chat-message chat-message-recipient")[0].scrollHeight);
	}
	$(function(){
		$(".questionlist").hover(function(){
			$(this).css("background","#ebebeb");
		},function(){
			$(this).css("background","#f5f3f3");
		});
		
		$(".sendbtn").hover(function(){
			$(this).css("background","#4659c3");
		},function(){
			$(this).css("background","#2235a2");
		});
	});
</script>
</html>
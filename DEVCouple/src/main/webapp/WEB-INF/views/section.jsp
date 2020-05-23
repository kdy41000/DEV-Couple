<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV Couple</title>
<link rel="stylesheet" type="text/css" href="resources/css/section.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Nanum+Pen+Script&family=Single+Day&family=Sunflower:wght@500&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="resources/js/typewritter.js"></script>
</head>
<body>
	<div class="webscreen">
		<%@ include file="header.jsp"%><br />
		<br />
		<br />
		<br />
		<br />
		<section style="text-align: center;">
			<img alt="logo" src="resources/images/logo.png" style="width: 10%;" />
			<h1
				style="font-family: -webkit-pictograph; font-size: 50px; color: #6f30a9; margin-top: -1%;">
				<span id="nowTimes"></span>
			</h1>
			<h2 class="applytitle">프로젝트 개요</h2>
			<h3>
				<a href="" id="applytypewriter" class="typewrite" data-period="2000"
					data-type='[ "개발자 커플의 기능구현 연습 장소" ]'> <span class="wrap"></span>
				</a>
			</h3>
			<br />
			<br />
			<!-- 동영이 -->
			<div style="float: left; margin-left: 27%;">
				<img alt="img" src="resources/images/young.png"
					style="width: 33%; height: 160px; border-radius: 100%;" /><br /> <span
					style="font-weight: bold;">DevDongyoung</span><br /> <input
					class="aboutmebtn" type="button"
					onclick="location.href='aboutme.do?id=doma';" value="About Me"
					style="width: 27%; height: 38px; border-radius: 6px; background: #6f30a9; color: white; cursor: pointer; text-align: center;" />
			</div>
			<!-- 동영이 -->
			<!-- 보영이 -->
			<div style="float: left; margin-left: -11%;">
				<img alt="img" src="resources/images/bobo.jpg"
					style="width: 22%; height: 158px; border-radius: 100%;" /><br /> <span
					style="font-weight: bold;">DevBoyoung</span><br /> <input
					class="aboutmebtn" type="button"
					onclick="location.href='aboutme.do?id=bobo';" value="About Me"
					style="width: 18%; height: 38px; border-radius: 6px; background: #6f30a9; color: white; cursor: pointer; text-align: center;" />
			</div>
			<!-- 보영이 -->
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<h2 class="applytitle">사용기술</h2>
			<div class="applycontent">
				<p>JAVA, JSP, Spring Framework, Oracle, CSS3, MediaQuery</p>
				<p>HTML5, JS, JQuery, AJAX, JSON, GSON, WebSocket, Crawling</p>
			</div>
			<br />
			<br />
			<br />
			<h2 class="applytitle">Mobile Project</h2>
			<div style="float: left; margin-left: 32%; cursor: pointer;">
				<img class="pnglogo" src="resources/images/readinghelperlogo.png"
					style="width: 10%; height: 50px; margin: 1% 0% 0% -10%;"
					onclick="location.href='http://49.50.163.88:8787/ReadBook/';" /><br />
				<span class="applycontent" style="margin-left: -10%;">ReadingHelper</span>
			</div>
			<div style="float: left; margin-left: -15%; cursor: pointer;">
				<img class="pnglogo" src="resources/images/coronakillerlogo.png"
					style="width: 10%; height: 50px; margin: 1.1% 0% 0% -10%;"
					onclick="location.href='http://49.50.163.88:8787/Corona_Project/';" /><br />
				<span class="applycontent" style="margin-left: -10%;">CoronaKiller</span>
			</div>
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<!-- 피드 -->
			<img src="https://i.pinimg.com/originals/da/93/29/da9329624e92482359df711a4acabe14.gif" style="width:18%;"/><br/>
			<input type="button" value="일상피드" onclick="location.href='feed.do';" class="aboutmebtn" style="width: 16%; height: 40px; border-radius: 6px; background: #6f30a9; color: white; cursor: pointer; text-align: center; font-weight: bold;"/>
			<!-- 피드 -->
			<br/><br/><br/><br/><br/><br/>
			<!-- 일정관리 -->
			<img src="https://i.pinimg.com/originals/65/ab/66/65ab660f0fd4b6509fd93f846b1693f8.gif" style="width: 15%; height: 170px;"/><br/>
			<input type="button" value="일정관리" onclick="location.href='calendar.do';" class="aboutmebtn"
				style="width: 16%; height: 40px; border-radius: 6px; background: #6f30a9; color: white; cursor: pointer; text-align: center; font-weight: bold;"/>
			<!-- 일정관리 -->
			<br/><br/><br/><br/><br/><br/>
			<!-- 영화정보 -->
			<img
				src="https://cdn.dribbble.com/users/1568191/screenshots/3468993/videezy2.gif"
				style="width: 18%; height: 220px;" /><br />
			    <input type="button" value="영화정보"
				onclick="location.href='movieinfo.do';" class="aboutmebtn"
				style="width: 16%; height: 40px; border-radius: 6px; background: #6f30a9; color: white; cursor: pointer; text-align: center; font-weight: bold;" />
			<!-- 영화정보 -->
		</section>
		<!-- 챗봇 -->
		<img class="chatbotcat" src="https://i.pinimg.com/originals/a1/30/9f/a1309f4feb1c68fde20a409831522d30.gif" onclick="chatbot();" style="width:10%; height:180px; float:right; margin-top: -3%; cursor:pointer;"/>
		<!-- 챗봇 -->
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<%@ include file="footer.jsp"%>
	</div>
	<!---------------------------------------------------------------------------->
	<div class="mobilescreen">
		<div style="margin-top: -0.9%;">
			<%@ include file="header.jsp"%>
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<section style="text-align: center;">
			<img alt="logo" src="resources/images/logo.png" style="width: 20%;" />
			<h1
				style="font-family: inherit; font-size: 50px; color: #6f30a9; margin-top: -1%;">
				<span id="nowTimesMobile"></span>
			</h1>
			<h2 class="applytitle">프로젝트 개요</h2>
			<h3>
				<a href="" id="applytypewriter" class="typewrite" data-period="2000"
					data-type='[ "개발자 커플의 기능구현 연습 장소" ]'> <span class="wrap"></span>
				</a>
			</h3>
			<br />
			<br />
			<br />
			<br />
			<br />
			<!-- 동영이 -->
			<div style="float: left; margin-left: 25%;">
				<img alt="img" src="resources/images/young.png"
					style="width: 33%; height: 160px; border-radius: 100%;" /><br /> <span
					style="font-weight: bold;">DevDongyoung</span><br /> <input
					class="aboutmebtn" type="button"
					onclick="location.href='aboutme.do?id=doma';" value="About Me"
					style="width: 27%; height: 36px; border-radius: 6px; background: #6f30a9; color: white; cursor: pointer; text-align: center;" />
			</div>
			<!-- 동영이 -->
			<!-- 보영이 -->
			<div style="float: left; margin: 10% 0% 0% 12%;">
				<img alt="img" src="resources/images/bobo.jpg"
					style="width: 22%; height: 158px; border-radius: 100%;" /><br /> <span
					style="font-weight: bold;">DevBoyoung</span><br /> <input
					class="aboutmebtn" type="button"
					onclick="location.href='aboutme.do?id=bobo';" value="About Me"
					style="width: 18%; height: 38px; border-radius: 6px; background: #6f30a9; color: white; cursor: pointer; text-align: center;" />
			</div>
			<!-- 보영이 -->
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<h2 class="applytitle" style="margin-top: 40%;">사용기술</h2>
			<div class="applycontent">
				<p>JAVA, JSP, Spring Framework, Oracle, CSS3, MediaQuery</p>
				<p>HTML5, JS, JQuery, AJAX, JSON, GSON, WebSocket, Crawling</p>
			</div>
			<br />
			<br />
			<br />
			<br />
			<br />
			<h2 class="applytitle">Mobile Project</h2>
			<div style="float: left; margin-left: 15%; cursor: pointer;">
				<img src="resources/images/readinghelperlogo.png"
					style="width: 10%; height: 50px; margin: 1% 0% 0% -10%;"
					onclick="location.href='http://49.50.163.88:8787/ReadBook/';" /><br />
				<span class="applycontent" style="margin-left: -10%;">ReadingHelper</span>
			</div>
			<div style="float: left; margin-left: -30%; cursor: pointer;">
				<img src="resources/images/coronakillerlogo.png"
					style="width: 10%; height: 50px; margin: 1.1% 0% 0% -10%;"
					onclick="location.href='http://49.50.163.88:8787/Corona_Project/';" /><br />
				<span class="applycontent" style="margin-left: -10%;">CoronaKiller</span>
			</div>
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
		    <!-- 피드 -->
			<img src="https://i.pinimg.com/originals/da/93/29/da9329624e92482359df711a4acabe14.gif" style="width:27%;"/><br/>
			<input type="button" value="일상피드" onclick="location.href='feed.do';" class="aboutmebtn" style="width: 16%; height: 40px; border-radius: 6px; background: #6f30a9; color: white; cursor: pointer; text-align: center; font-weight: bold;"/>
			<!-- 피드 -->
			<br/><br/><br/><br/><br/><br/>
			<!-- 일정관리 -->
			<img src="https://i.pinimg.com/originals/65/ab/66/65ab660f0fd4b6509fd93f846b1693f8.gif" style="width: 30%; height: 170px;"/><br/>
			<input type="button" value="일정관리" onclick="location.href='calendar.do';" class="aboutmebtn"
				style="width: 16%; height: 40px; border-radius: 6px; background: #6f30a9; color: white; cursor: pointer; text-align: center; font-weight: bold;"/>
			<!-- 일정관리 -->
			<br/><br/><br/><br/><br/><br/>
			<!-- 영화정보 -->
			<img
				src="https://cdn.dribbble.com/users/1568191/screenshots/3468993/videezy2.gif"
				style="width: 30%; height: 220px;" /><br />
				<input type="button" value="영화정보"
				onclick="location.href='movieinfo.do';" class="aboutmebtn"
				style="width: 16%; height: 40px; border-radius: 6px; background: #6f30a9; color: white; cursor: pointer; text-align: center; font-weight: bold;" />
			<!-- 영화정보 -->
		</section>
		<!-- 챗봇 -->
		<img class="chatbotcat" src="https://i.pinimg.com/originals/a1/30/9f/a1309f4feb1c68fde20a409831522d30.gif" onclick="chatbot();" style="width:17%; height:180px; float:right; cursor:pointer;"/>
		<!-- 챗봇 -->
		<div style="margin-top: 25%;">
			<%@ include file="footer.jsp"%>
		</div>
	</div>
</body>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {

		// 시간을 딜레이 없이 나타내기위한 선 실행
		realTimer();

		// 이후 0.5초에 한번씩 시간을 갱신한다.
		setInterval(realTimer, 500);
	});

	// 시간을 출력
	function realTimer() {
		const nowDate = new Date();
		const hour = nowDate.getHours();
		const min = nowDate.getMinutes();
		const sec = nowDate.getSeconds();

		document.getElementById("nowTimes").innerHTML = hour + ":"
				+ addzero(min) + ":" + addzero(sec);

		document.getElementById("nowTimesMobile").innerHTML = hour + ":"
				+ addzero(min) + ":" + addzero(sec);
	}

	// 1자리수의 숫자인 경우 앞에 0을 붙여준다.
	function addzero(num) {
		if (num < 10) {
			num = "0" + num;
		}
		return num;
	}

	$(".aboutmebtn").hover(function() {
		$(this).css("background", "#af56bd");
	}, function() {
		$(this).css("background", "#6f30a9");
	})

	$(".pnglogo").hover(function() {
		$(this).css("opacity", "0.8");
	}, function() {
		$(this).css("opacity", "1");
	})
	
	$(".chatbotcat").hover(function(){
		$(this).css("opacity","0.6");
	},function(){
		$(this).css("opacity", "1");
	})
</script>
<script type="text/javascript">
	function chatbot(){
		var url= "chatbotmain.do";    //팝업창 페이지 URL
		var winWidth = 650;
	    var winHeight = 600;
	    var popupOption= "width="+winWidth+", height="+winHeight+", status=no";    //팝업창 옵션(optoin)
		window.open(url,"",popupOption);
	}
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV Couple</title>
<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="headerbody" style="margin-top: -0.4%; margin-left: -0.4%;">
<header class="header">
  <a href="section.do" class="headerMainlogo">DEV Couple</a>
  <input class="menu-btn" type="checkbox" id="menu-btn" />
  <label class="menu-icon" for="menu-btn"><span class="navicon"></span></label>
  <c:if test="${empty sessionScope.logininfo }">
	  <ul class="headermenu">
	    <li class="headerli"><a class="headeratag" href="#about" onclick="location.href='boardlist.do?currentpage=1';">개발Tip</a></li>
	    <li class="headerli"><a class="headeratag" href="#about" onclick="location.href='feed.do';">일상피드</a></li>
	    <li class="headerli"><a class="headeratag" href="#about" onclick="location.href='chatlist.do';">채팅방</a></li>
	    <li class="headerli"><a class="headeratag" href="#about" onclick="location.href='contact.do';">CONTACT</a></li>
	    <li class="headerli"><a class="headeratag" href="#careers" onclick="location.href='login.do';">로그인</a></li>
	    <li class="headerli"><a class="headeratag" href="#contact" onclick="location.href='agreement.do';">회원가입</a></li>
	  </ul>
   </c:if>  
   <c:if test="${!empty sessionScope.logininfo }">
	  <ul class="headermenu">
	    <li class="headerli"><a class="headeratag" href="#about" onclick="location.href='boardlist.do?currentpage=1';">개발Tip</a></li>
	    <li class="headerli"><a class="headeratag" href="#about" onclick="location.href='feed.do';">일상피드</a></li>
	    <li class="headerli"><a class="headeratag" href="#about" onclick="location.href='chatlist.do';">채팅방</a></li>
	    <li class="headerli"><a class="headeratag" href="#about" onclick="location.href='contact.do';">CONTACT</a></li>
	    <li class="headerli"><a class="headeratag" href="#careers" onclick="location.href='logout.do';">로그아웃</a></li>
	  	<li class="headerli"><a class="headeratag" href="#careers" onclick="location.href='mypage.do?id=${sessionScope.logininfo.id }';">마이페이지</a></li>
	  </ul>
   </c:if>  
</header>
</div>
</body>
</html>
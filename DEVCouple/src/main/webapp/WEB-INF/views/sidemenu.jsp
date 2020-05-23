<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV Couple</title>
<link rel="stylesheet" type="text/css" href="resources/css/sidemenu.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/sidemenu.js"></script>
</head>
<body>
<input type="hidden" class="maintech" value="up"/>
<!-- MENU -->
<div id="menu-wrapper">
  <div id="menu-bar"></div>
  
  <div id="menu-nav">
    <ul>
      <li onclick="location.href='mypage.do?id=${sessionScope.logininfo.id }';">MyPage</li>
      <li onclick="location.href='revisemyinfo.do?id=${myinfo.id}';">내정보 수정</li>
      <li onclick="location.href='deletemyinfo.do?id=${myinfo.id}';">회원탈퇴</li>
      <li onclick="location.href='lettergetlist.do?id=${sessionScope.logininfo.id }&currentpage=1';">쪽지함</li>
    </ul>
  </div>
  
  <div id="menu-tab" onclick="toggleTech();" class="closed">MyPage</div>
</div>
<!-- MENU -->


</body>
</html>
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
<link rel="stylesheet" type="text/css" href="resources/css/userProfile.css"/>
</head>
<body>
<div class="side_wrapper">
  <section class="about-dev">
    <header class="profile-card_header">
      <div class="profile-card_header-container">
        <div class="profile-card_header-imgbox">
          <img src="resources/images/profileimgstorage/${chatdto.profileimg }" alt="Mewy Pawpins" />
        </div>
        <h1>${chatdto.id }<span>${chatdto.name }</span></h1>
      </div>
    </header>
    <div class="profile-card_about">
      <h2>About Me</h2>
      <c:if test="${chatdto.grade eq 1 }">
      	<p><a style="font-weight:bold;">등급:</a> 방장</p>
      </c:if>
      <c:if test="${chatdto.grade eq 2 }">
      	<p><a style="font-weight:bold;">등급:</a> 일반유저</p>
      </c:if>
      <p><a style="font-weight:bold;">이메일:</a> ${chatdto.email }</p>
      <p><a style="font-weight:bold;">전화번호:</a> ${chatdto.phone }</p>
      
      <footer class="profile-card_footer">
       
         
        <p><a class="back-to-profile" href="#" onclick="location.href='letterReSend.do?id=${sessionScope.logininfo.id}&sender=${chatdto.id }';">쪽지 보내기</a></p>
      </footer>
    </div>
  </section>
</div>
</body>
</html>
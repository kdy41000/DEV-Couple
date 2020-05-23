<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV Couple</title>
<link rel="stylesheet" type="text/css" href="resources/css/sidemenumobile.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<script type="text/javascript">
/*********************************************
 * Uses jQuery!
*********************************************/
function myFunction(x) {
  x.classList.toggle("change");
  $("#mobile-menu").toggleClass("menu-hidden", 800, "easeOutQuint");
};

</script>
<body>
<div class="mobilemenubody">
<div class="container center " onclick="myFunction(this)" style="border: 1px solid white;">
        <div class="bar1"></div>
        <p class="bar2">menu</p>
        <div class="bar3" style="margin-top:1%;"></div>
</div>
      <ul id ="mobile-menu" class="menu-hidden">
        <li class="mobilelitag" ><a class="mobileatag" href="mypage.do?id=${sessionScope.logininfo.id }">MyPage</a></li>
        <li class="mobilelitag" ><a class="mobileatag" href="revisemyinfo.do?id=${myinfo.id}">내정보 수정</a></li>
        <li class="mobilelitag" ><a class="mobileatag" href="deletemyinfo.do?id=${myinfo.id}">회원탈퇴</a></li>
        <li class="mobilelitag" ><a class="mobileatag" href="lettergetlist.do?id=${sessionScope.logininfo.id }&currentpage=1">쪽지함</a></li>
      </ul>
</div>
</body>
</html>
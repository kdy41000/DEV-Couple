<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@media (min-width: 480px) and (max-width: 1024px){
   .mobilescreen{
      display:show;
   }
   .webscreen{
      display:none;
   }
   
}
@media (min-width: 1025px){
   .mobilescreen{
      display:none;
   }
   .webscreen{
      display:show;
   }
   
}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="webscreen">
<div style="margin-top:0.3%; margin-left:0.4%;">
<%@ include file="header.jsp" %>
</div>
<br/><br/><br/>
<%@ include file="sidemenu.jsp" %>
<section>
   <div style="text-align:center; margin-top:10%;">
      <h1 style="font-size:30px;">MyPage</h1><br/><br/>
   </div>
   <div style=" text-align:center;">
      <img src="resources/images/profileimgstorage/${myinfo.profileimg }" style="width:10%; height:200px; border-radius:50%;"/>
      <br/><br/>
      <p><b>ID: </b> ${myinfo.id }</p>
      <p><b>이름: </b> ${myinfo.name }</p>
      <p><b>이메일: </b> ${myinfo.email }</p>
      <p><b>전화번호: </b> ${myinfo.phone }</p>
      <p><b>주소: </b> (${myinfo.address })  ${myinfo.addone }  ${myinfo.detailadd }</p>
   </div><br/><br/>
   <div>
      <img class="revisebtn" onclick="location.href='revisemyinfo.do?id=${myinfo.id}';" src="https://cdn1.iconfinder.com/data/icons/mobile-device/512/reload-loading-process-blue-round-512.png" style="width:8%; margin-left:37%; cursor:pointer;">
      <img class="deletebtn" onclick="location.href='deletemyinfo.do?id=${myinfo.id}';" src="https://cdn1.iconfinder.com/data/icons/round-ui/123/47-512.png" style="width:8%; margin-left:10%; cursor:pointer;">
   </div>
</section>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<%@include file="footer.jsp" %>
</div>
<!---------------------------------------------------------------------------->
<div class="mobilescreen">
<%@ include file="header.jsp" %>
<br/><br/><br/><br/>
<%@ include file="sidemenumobile.jsp" %>
<section>
   <div style="text-align:center; margin-top:43%;">
      <h1 style="font-size:40px;">MyPage</h1>
   </div><br/><br/>
   <div style=" text-align:center; font-size:28px;">
      <img src="resources/images/profileimgstorage/${myinfo.profileimg }" style="width:20%; height:200px; border-radius:50%;"/>
      <br/><br/>
      <p><b>ID: </b> ${myinfo.id }</p>
      <p><b>이름: </b> ${myinfo.name }</p>
      <p><b>이메일: </b> ${myinfo.email }</p>
      <p><b>전화번호: </b> ${myinfo.phone }</p>
      <p><b>주소: </b> (${myinfo.address })  ${myinfo.addone }  ${myinfo.detailadd }</p>
   </div><br/><br/>
   <div>
      <img class="revisebtn" onclick="location.href='revisemyinfo.do?id=${myinfo.id}';" src="https://cdn1.iconfinder.com/data/icons/mobile-device/512/reload-loading-process-blue-round-512.png" style="width:8%; margin-left:37%; cursor:pointer;">
      <img class="deletebtn" onclick="location.href='deletemyinfo.do?id=${myinfo.id}';" src="https://cdn1.iconfinder.com/data/icons/round-ui/123/47-512.png" style="width:8%; margin-left:10%; cursor:pointer;">
   </div>
</section>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<%@include file="footer.jsp" %>
</div>
</body>
<script type="text/javascript">
   $(".revisebtn").hover(function(){
      $(this).css("opacity","0.8");
   },function(){
      $(this).css("opacity","1");
   });
   
   $(".deletebtn").hover(function(){
      $(this).css("opacity","0.8");
   },function(){
      $(this).css("opacity","1");
   });
</script>
</html>
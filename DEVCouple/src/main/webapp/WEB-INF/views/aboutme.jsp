<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
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
<link rel="stylesheet" type="text/css" href="resources/css/aboutme.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="webscreen">
<%@ include file="header.jsp" %><br/><br/><br/>
<c:if test="${empty aboutmedto }">
<section style="height:650px;">
   <img alt="nowrite" src="https://www.epicentrofestival.com/wp-content/uploads/2019/12/This-Free-Icons-Png-Design-Of-Gray-Pencil-Icon-Gray-Pencil-720x762.jpg" style="width:5%; margin-top:15%; margin-left:48%;"><br/>
   <p style="text-align:center;">작성된 글이 없습니다.</p>
   <c:if test="${sessionScope.logininfo.id eq id}">
      <img class="writebtn" onclick="writebtn();" alt="writebtn" src="https://cdn3.iconfinder.com/data/icons/social-messaging-ui-color-line/254000/79-512.png" style="width:3%; margin:10% 0% 0% 90%; cursor:pointer;"/>
   </c:if>
</section>
</c:if>
<c:if test="${!empty aboutmedto }">
<div class="aboutmebody">
   <header>

   <div class="container">

      <div class="profile">

         <div class="profile-image">

            <img class="profileimg" src="resources/images/profileimgstorage/${aboutmedto.profileimg }" alt="" style="width:55%; height:260px; border:2px solid pink"">

         </div>

         <div class="profile-user-settings">

            <h1 class="profile-user-name">${aboutmedto.name }</h1>
            
      <c:if test="${sessionScope.logininfo.id eq id}">
            <button id="revisebtn" class="btn profile-edit-btn" onclick="reviseaboutme();">Edit Profile</button>
            <img id="deletebtn" onclick="location.href='deleteaboutme.do?seq=${aboutmedto.seq}&id=${aboutmedto.id }';" alt="deletebtn" src="https://cdn0.iconfinder.com/data/icons/social-messaging-ui-color-shapes/128/trash-circle-red-512.png" style="width:5%; float:right; cursor:pointer; margin: 7% 45% 0% 0%;"/>
      </c:if>
            <button class="btn profile-settings-btn" aria-label="profile settings"><i class="fas fa-cog" aria-hidden="true"></i></button>

         </div>

         <!-- <div class="profile-stats">

            <ul>
               <li></li>
            </ul>

         </div> -->

         <div class="profile-bio">

            <p><span class="profile-real-name">E-MAIL:</span> ${aboutmedto.email }</p>
            <p><span class="profile-real-name">PHONE: </span> ${aboutmedto.phone }</p>
            <p><span class="profile-real-name">ADDRESS: </span> ${aboutmedto.addone }(${aboutmedto.address })</p>
            <p><span class="profile-real-name">Cerification: </span>${aboutmedto.certification }</p>
            <p><span class="profile-real-name">SITE: </span><a href="${aboutmedto.site }" style="color: black;">${aboutmedto.site }</a></p>

         </div>

      </div>
      <!-- End of profile section -->

   </div>
   <!-- End of container -->
   <hr style="width:55%; border:1px solid #e6e6e6;"/>
   <div style="margin-left:30%;">
      <span>${aboutmedto.content }</span>
   </div>
</header>
</div>
</c:if>
<div style="margin-top:5%;"> 
<%@ include file="footer.jsp" %>
</div>
</div>
<!---------------------------------------------------------------------------->
<div class="mobilescreen">
<div style="margin-top:-0.8%;">
<%@ include file="header.jsp" %>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<c:if test="${empty aboutmedto }">
<section style="height:1500px;">
   <img alt="nowrite" src="https://www.epicentrofestival.com/wp-content/uploads/2019/12/This-Free-Icons-Png-Design-Of-Gray-Pencil-Icon-Gray-Pencil-720x762.jpg" style="width:5%; margin-top:75%; margin-left:48%;"><br/>
   <p style="text-align:center;">작성된 글이 없습니다.</p>
   <c:if test="${sessionScope.logininfo.id eq id}">
      <img class="writebtn" onclick="writebtn();" alt="writebtn" src="https://cdn3.iconfinder.com/data/icons/social-messaging-ui-color-line/254000/79-512.png" style="width:3%; margin:10% 0% 0% 90%; cursor:pointer;"/>
   </c:if>
</section>
</c:if>
<c:if test="${!empty aboutmedto }">
<div class="aboutmebody">
   <header>

   <div class="container">

      <div class="profile">

         <div class="profile-image" style="margin-top: -300%;">

            <img class="profileimg" src="resources/images/profileimgstorage/${aboutmedto.profileimg }" alt="" style="width:130%; height:300px; margin-left:150%; border:2px solid pink">
            
         </div>

         <div class="profile-user-settings" style="margin: 60% 0% 0% -20%;">

            <h1 class="profile-user-name">${aboutmedto.name }</h1>
            
      <c:if test="${sessionScope.logininfo.id eq id}">
            <button id="revisebtn" class="btn profile-edit-btn" onclick="reviseaboutme();">Edit Profile</button>
            <img id="deletebtn" onclick="location.href='deleteaboutme.do?seq=${aboutmedto.seq}&id=${aboutmedto.id }';" alt="deletebtn" src="https://cdn0.iconfinder.com/data/icons/social-messaging-ui-color-shapes/128/trash-circle-red-512.png" style="width: 8%; float: right; cursor: pointer; margin: 14% 10% 0% 0%;"/>
      </c:if>
            <button class="btn profile-settings-btn" aria-label="profile settings"><i class="fas fa-cog" aria-hidden="true"></i></button>

         </div>

         <!-- <div class="profile-stats">

            <ul>
               <li></li>
            </ul>

         </div> -->

         <div class="profile-bio" style="margin-left: -95%; font-size: 18px;">

            <p><span class="profile-real-name">E-MAIL:</span> ${aboutmedto.email }</p>
            <p><span class="profile-real-name">PHONE: </span> ${aboutmedto.phone }</p>
            <p><span class="profile-real-name">ADDRESS: </span> ${aboutmedto.addone }(${aboutmedto.address })</p>
            <p><span class="profile-real-name">Cerification: </span>${aboutmedto.certification }</p>
            <p><span class="profile-real-name">SITE: </span><a href="${aboutmedto.site }" style="color: black;">${aboutmedto.site }</a></p>

         </div>

      </div>
      <!-- End of profile section -->

   </div>
   <!-- End of container -->
   <hr style="width:85%; border:1px solid #e6e6e6;"/>
   <div style="font-size:18px; padding: 50px;">
      <span>${aboutmedto.content }</span>
   </div>
</header>
</div>
</c:if> 
<%@ include file="footer.jsp" %>
</div>
</body>
<script type="text/javascript">
   $(".writebtn").hover(function(){
      $(this).css("opacity","0.8");
   },function(){
      $(this).css("opacity","1");
   });
   
   $("#revisebtn").hover(function(){
      $(this).css("background","#f1f1f1");
   },function(){
      $(this).css("background","white");
   });
   
   $("#deletebtn").hover(function(){
      $(this).css("opacity","0.8");
   },function(){
      $(this).css("opacity","1");
   });
   
   function writebtn(){
      var id = "${id}";
      var openWin;
      
      var popUrl = "writeaboutme.do?id="+id;   //팝업창에 출력될 페이지 URL

      var popOption = "width=900, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

      window.name="parentForm";
      openWin = window.open(popUrl,"childForm",popOption);
   }
   
   function reviseaboutme(){
      var id = "${id}";
      var openWin;
      
      var popUrl = "reviseaboutme.do?id="+id;   //팝업창에 출력될 페이지 URL

      var popOption = "width=900, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

      window.name="parentForm";
      openWin = window.open(popUrl,"childForm",popOption);
   }
</script>
</html>
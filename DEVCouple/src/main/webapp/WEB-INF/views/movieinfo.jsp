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
<link rel="stylesheet" type="text/css" href="resources/css/movieinfo.css"/>
<style type="text/css">
@media (min-width: 480px) and (max-width: 1024px){
   .searchTitle{
      text-align:center;
       font-size: 20px;
       color: #da5d35;
       margin-top: -10%;
   }
         
   #selectAreabox{
      margin-top: 3%;
       margin-left: 20%;
       border: 1px solid #da5d35;
         border-radius: 5px;
         width: 30%;
         height: 40px;
         font-size: 25px;
   }
         
   .searchArea{
      width: 25%;
       height: 45px;
       border-radius: 10px;
       font-size: 22px;
       background: #a821bf;
          color: white;
          cursor: pointer;
   }   
   
   .moviesection{
      margin-top:15%;
   }
   
   .curTitle{
      margin-top:10%;
   }
}
@media (min-width: 1025px){
   .searchTitle{
      margin-left:43%; font-size:18px; color:#da5d35;
   }
         
   #selectAreabox{
      margin-left:41%; border:1px solid #da5d35; border-radius:5px; width:8%; height:30px; font-size:15px;
   }
         
   .searchArea{
      width:8%; height:35px; border-radius:10px; font-size:15px; background:#a821bf; color:white; cursor:pointer;
   }   
}   
</style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
   var moviesoon = "";
   
   $.ajax({
      url:"moviesoon.do",
      type:"post",
      dataType:"json",
      success:function(data){
         console.log(data);
         $.each(data,function(key,val){
            if(key < data.length-1){
               moviesoon = $("<div class='moviecontents'>")
               .append("<h2 style='color:#3f51b5;'>"+ val.rank +"</h2>")
               .append("<a href='https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query="+val.movieTitle+"'><img class='movieimg' src='"+ val.img +"' /></a>")
               .append("<p><b>관람가:</b>"+ val.movieAge +"</p>")
               .append("<p><b>제목:</b>"+ val.movieTitle +"</p>")
               .append("<p><b>예매율:</b>"+ val.movieRate +"</p>")
               .append("<p><b>개봉일:</b>"+ val.movieOpenDate +"</p>")
               .append("<p><img src='https://cdn3.iconfinder.com/data/icons/cosmo-color-basic-1/40/favorite-512.png' style='width: 1%; margin: 0% -1.3% -0.3% 0.3%;'/></p>")
               .append("<hr style='width:50%; border:1px solid #e0e0e0;'>")
         
            $(".moviesoon").append(moviesoon);
            }else{
               moviesoon = $("<div class='moviecontents'>")
               .append("<h2 style='color:#3f51b5;'>"+ val.rank +"</h2>")
               .append("<a href='https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query="+val.movieTitle+"'><img class='movieimg' src='"+ val.img +"'/></a>")
               .append("<p><b>관람가:</b>"+ val.movieAge +"</p>")
               .append("<p><b>제목:</b>"+ val.movieTitle +"</p>")
               .append("<p><b>예매율:</b>"+ val.movieRate +"</p>")
               .append("<p><b>개봉일:</b>"+ val.movieOpenDate +"</p>")
               .append("<p><img src='https://cdn3.iconfinder.com/data/icons/cosmo-color-basic-1/40/favorite-512.png' style='width: 1%; margin: 0% -1.3% -0.3% 0.3%;'/></p>")
            
               $(".moviesoon").append(moviesoon);
            }
         })
         
         
      },error:function(){
         console("통신 에러");
      }
   })
});   

</script>
<body>
<div class="movieheader">
<%@ include file="header.jsp" %>
</div>
<br/><br/><br/><br/><br/>
<section class="moviesection">
   <div>
      <h2 class="searchTitle">Today's 극장별 상영시간표</h2>
      <select id="selectAreabox">
         <option value="0145">CGV화정</option>
         <option value="0054">CGV일산</option>
         <option value="0055">CGV죽전</option>
         <option value="0196">CGV서현</option>
         <option value="0004">CGV오리</option>
         <option value="0181">CGV판교</option>
         <option value="0056">CGV강남</option>
      </select>&nbsp;&nbsp;&nbsp;
      <input type="button" class="searchArea" value="검색" onclick="searchArea();"/>
   </div>
   <br/><br/><br/>
   <h2 class="curTitle">현재 상영작</h2>
   <c:forEach items="${movieinfo }" var="movie">
      <div class="moviecontents">
         <h2 style="color:#923919;">${movie.rank }</h2>
         <img class="movieimg" src="${movie.img }" onclick="location.href='https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=${movie.movieTitle }';"/>
         <p><b>관람가:</b> ${movie.movieAge }</p>
         <p><b>제목:</b> ${movie.movieTitle }</p>
         <p><b>예매율:</b> ${movie.movieRate }</p>
         <p><b>개봉일:</b> ${movie.movieOpenDate }</p>
         <p>${movie.like }<img src="https://cdn3.iconfinder.com/data/icons/cosmo-color-basic-1/40/favorite-512.png" style="width: 1%; margin: 0% -1.3% -0.3% 0.3%;"/></p>
      <div>
      <hr style="width:50%; border:1.5px solid #e0e0e0;"/>
   </c:forEach>
</table>
   <br/>
   <h2 class="soonTitle">상영예정작</h2>
   <div class="moviesoon" style="text-align:center;"></div>
</section><br/><br/>
<%@ include file="footer.jsp" %>   
</body>
<script type="text/javascript">
   function searchArea(){
      var AreaCode = $("#selectAreabox option:selected").val();
      
      let today = new Date();   
      let year = today.getFullYear(); // 년도
      let month = today.getMonth() + 1;  // 월
      let date = today.getDate();  // 날짜
      
      month = month < 10 ? "0" + month:month;
      date = date < 10 ? "0" + date:date;
      
      var todayRes = year + month + date;
      
      location.href="http://m.cgv.co.kr/Schedule/?tc="+AreaCode+"&t=T&ymd="+todayRes+"&src="
   }
   
   $(".searchArea").hover(function(){
      $(this).css("background","#c44cd8");
   },function(){
      $(this).css("background","#a821bf")
   });
</script>
</html>
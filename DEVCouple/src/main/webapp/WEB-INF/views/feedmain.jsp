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
<link rel="stylesheet" type="text/css" href="resources/css/feedmain.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/feedmaincomment.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="feedheader">
<%@ include file="header.jsp" %><br/><br/><br/><br/><br/><br/>
</div>
<!-- 작성된 피드가 없을 때 -->
<c:if test="${empty feedlist }">
<img class="nofeed" alt="nowrite" src="https://www.epicentrofestival.com/wp-content/uploads/2019/12/This-Free-Icons-Png-Design-Of-Gray-Pencil-Icon-Gray-Pencil-720x762.jpg"><br/>
   <p style="text-align:center;">작성된 글이 없습니다.</p>
</c:if>   
<!-- 작성된 피드가 없을 때 -->   
<!-- 글쓰기 버튼 -->
<c:if test="${!empty sessionScope.logininfo.id }">
	<c:if test="${empty feedlist }">
		<img class="writebtn" onclick="writebtn();" alt="writebtn" src="https://cdn3.iconfinder.com/data/icons/social-messaging-ui-color-line/254000/79-512.png" />
	</c:if> 
	<c:if test="${!empty feedlist }">
		<img class="writebtntrue" onclick="writebtn();" alt="writebtn" src="https://cdn3.iconfinder.com/data/icons/social-messaging-ui-color-line/254000/79-512.png" />
	</c:if> 
</c:if>
<!-- 글쓰기 버튼 -->
<div class="feed-container">
<c:forEach items="${feedlist }" var="feeddto">

<!-- 사진있는 태그 -->
<c:if test="${!empty feeddto.img }">
  <div class="feed-border clearfix">
    <div class="feed-options"><i class="fa fa-sort-desc"></i></div>
    <div class="feed-body clearfix">
    
      <img src="resources/images/profileimgstorage/${feeddto.profileimg }" style="width:8%; height:60px; border-radius:50px; float:left; margin:2.5% 0% 0% 2%;" />
      <div class="feed-content">
        <div class="username"><a class="feedatag" href="#">@${feeddto.id }</a></div>
        <p>${feeddto.content }</p>
        <!-- 삭제버튼 -->
        <c:if test="${sessionScope.logininfo.id eq feeddto.id }">
        <img class="deletebtn" onclick="location.href='deletefeed.do?feedno=${feeddto.feedno}';" src="https://cdn1.iconfinder.com/data/icons/round-ui/123/47-512.png" style="width:8%; float:left; margin-left:100%; margin-top:-13%; cursor:pointer;">
      	</c:if>
      	<!-- 삭제버튼 -->
      </div>
      <img src="resources/feedstorage/img/${feeddto.img }" style=" width:60%; height:auto; margin-left: 20%;"/>
    </div>
    <div class="feed-footer clearfix">
      <div class="footer-left">
        <span class="footer-time"><fmt:formatDate value="${feeddto.wrtdate }" pattern="yyyy.MM.dd HH:mm:ss"/></span>
      </div>
      <!-- Like버튼 -->
      <!-- 완전 비어있을 때-->
      <c:if test="${empty comparablelikestatus and !empty sessionScope.logininfo.id }">
      	<img class="likebtn" onclick="likestatus(${feeddto.feedno});" src="https://w7.pngwing.com/pngs/877/316/png-transparent-facebook-like-button-computer-icons-youtube-social-media-youtube-orange-logo-social-media-thumbnail.png" style="width:3%; float:left; margin-top:-0.5%; cursor:pointer;"/>
      </c:if>
       <!--완전 비어있을 때 -->
      
      
      <c:if test="${ !empty sessionScope.logininfo.id }"><!-- 로그인 있는애들 -->
     		<c:set var="privatecompare" />
      
	      <!-- 해당 피드에 LikeStatus상태가 들어있을 때 -->
	      <c:if test="${!empty comparablelikestatus }">
		       <!-- Like/Bad 구분자 전역변수 -->
		  		
		      <c:forEach items="${comparablelikestatus }" var="compareDto">
		  	
			    <c:if test="${compareDto.feedno eq feeddto.feedno }">
			   		<c:if test="${compareDto.likestatus eq 0}">
		    			<img class="likebtn" onclick="likestatus(${feeddto.feedno});" src="https://w7.pngwing.com/pngs/877/316/png-transparent-facebook-like-button-computer-icons-youtube-social-media-youtube-orange-logo-social-media-thumbnail.png" style="width:3%; float:left; margin-top:-0.5%; cursor:pointer;"/>
	      			</c:if>
	      			<c:if test="${compareDto.likestatus eq 1}">
		    			<img class="likebtn" onclick="likeminus(${feeddto.feedno});" src="https://cdn.iconscout.com/icon/premium/png-512-thumb/unlike-7-161678.png" style="width:3%; float:left; margin-top:-0.5%; cursor:pointer;"/>
	      			</c:if>
	      			<c:set var="privatecompare">${compareDto.feedno }</c:set>
		      	</c:if>
		      	
			  </c:forEach>
			  
			  <!-- 디비값 없을 때-->
		       <c:if test="${privatecompare ne feeddto.feedno}">
		      	<img class="likebtn" onclick="likestatus(${feeddto.feedno});" src="https://w7.pngwing.com/pngs/877/316/png-transparent-facebook-like-button-computer-icons-youtube-social-media-youtube-orange-logo-social-media-thumbnail.png" style="width:3%; float:left; margin-top:-0.5%; cursor:pointer;"/>
		       </c:if>
      		<!-- 디비값 없을 때-->
			 
		  </c:if>
	  
	  </c:if><!-- 로그인 있는애들 -->
	   <!-- 해당 피드에 LikeStatus상태가 들어있을 때 -->
      <!-- Like버튼 -->
       <!-- Like,Comment Count출력부분 -->
       <div class="footer-right" style="margin: -3.5% 0% 0% 87%;">
        <span class="favs"><img src="https://www.freepngimg.com/thumb/heart/67620-heart-instagram-icons-button-computer-like.png" style="width:30%; float: left; margin-top: -5%;"/>
        <c:forEach items="${likecountlist }" var="likecount">
         	<c:if test="${likecount.feedno eq feeddto.feedno }">
         		<a>${likecount.likecount }</a>
         	</c:if>
        </c:forEach>
        </span>
        <span class="divisor"></span>
        <span class="comment"><img src="https://toppng.com/uploads/preview/vector-icon-of-a-speech-bubble-facebook-comments-icon-11562966871wdesdj5arq.png" style="width:20%;"/> 
        <c:forEach items="${commentcountlist }" var="commentcount">
        		<c:if test="${commentcount.feedno eq feeddto.feedno }">
        			<a id="commentcnt${feeddto.feedno }">${commentcount.commentcount }</a>
        		</c:if>
        </c:forEach>	
        </span>
      </div>
      <!-- Like,Comment Count출력부분 -->
      </div>
      <!-- 코멘트영역 -->
      	<div class="comments-container">
      			<!-- 코멘트 작성 영역 -->
      			<c:if test="${!empty sessionScope.logininfo.id }">
				<div class="comment-main-level">
					<!-- Avatar -->
					<img src="resources/images/profileimgstorage/${sessionScope.logininfo.profileimg }" style="width:7%; height:50px; border-radius:50px; float:left;" />
						<input class="commentwrtarea" id="${feeddto.feedno }" type="text" name="recomment" onkeypress="if(event.keyCode==13) {writecomment(${feeddto.feedno});}" required />
						<input class="commentwrtbtn" type="button" onclick="writecomment(${feeddto.feedno});" value="send"/>										
				</div><br/><br/><br/>
				</c:if>
				<!-- 코멘트 작성 영역 -->
					<span class="re${feeddto.feedno }"></span>
					
				<!-- 코멘트 달릴 영역 -->
				<c:forEach items="${commentlist }" var="commentdto">
				<c:if test="${feeddto.feedno eq commentdto.feedno }">
				<div class="comment-main-level">
					<!-- Avatar -->
					<img src="resources/images/profileimgstorage/${commentdto.profileimg }" style="width:7%; height:50px; border-radius:50px;" />
					<!-- Contenedor del Comentario -->
					<div class="comment-box">
						<div class="comment-head">
							<span class="comment-name by-author">${commentdto.reid }</span>
							<span><fmt:formatDate value="${commentdto.redate }" pattern="yyyy.MM.dd HH:mm:ss"/></span>
							<!-- 코멘트 삭제버튼 -->
							<c:if test="${sessionScope.logininfo.id eq commentdto.reid }">
								<img class="deletemycommentbtn" onclick="deleteMyComment(${commentdto.reno});" src="https://www.clipartmax.com/png/middle/120-1209780_delete-circle-icon-png-target-logo.png" style="width:3.5%; cursor:pointer;"/>
							</c:if>
							<!-- 코멘트 삭제버튼 -->
						</div>
						<div class="comment-content">
							${commentdto.recomment }
						</div>
					</div>
				</div><br/><br/>
				</c:if>
				</c:forEach>
				<!-- 코멘트 달릴 영역 -->

		</div>
	<!-- 코멘트 영역 -->
  </div>
</c:if>
<!-- 사진있는 태그 -->
<!-- 비디오있는 태그 -->
<c:if test="${!empty feeddto.video }">
	<div class="feed-border clearfix">
	    <div class="feed-options"><i class="fa fa-sort-desc"></i></div>
	    <div class="feed-body clearfix">
	      <img src="resources/images/profileimgstorage/${feeddto.profileimg }" style="width:8%; height:60px; border-radius:50px; float:left; margin:2.5% 0% 0% 2%;" />
	      
	      <div class="feed-content">
	        <div class="username"><a class="feedatag" href="#">@${feeddto.id }</a></div>
	        <p>${feeddto.content }</p>
	        <!-- 삭제버튼 -->
	        <c:if test="${sessionScope.logininfo.id eq feeddto.id }">
	        <img class="deletebtn" onclick="location.href='deletefeed.do?feedno=${feeddto.feedno}';" src="https://cdn1.iconfinder.com/data/icons/round-ui/123/47-512.png" style="width:8%; float:left; margin-left:100%; margin-top:-13%; cursor:pointer;">
	     	</c:if>
	     	<!-- 삭제버튼 -->
	      </div>
	     <video controls autoplay muted width="500px" style="margin-left: 18%;"> 
		   <source src="resources/feedstorage/video/${feeddto.video }" type="video/mp4"> 
		</video>
	    </div>
	    <div class="feed-footer clearfix">
	      <div class="footer-left">
	        <span class="footer-time"><fmt:formatDate value="${feeddto.wrtdate }" pattern="yyyy.MM.dd HH:mm:ss"/></span>
	      </div>
	      <!-- Like버튼 -->
	      <!-- 완전 비어있을 때-->
	      <c:if test="${empty comparablelikestatus and !empty sessionScope.logininfo.id }">
	      	<img class="likebtn" onclick="likestatus(${feeddto.feedno});" src="https://w7.pngwing.com/pngs/877/316/png-transparent-facebook-like-button-computer-icons-youtube-social-media-youtube-orange-logo-social-media-thumbnail.png" style="width:3%; float:left; margin-top:-0.5%; cursor:pointer;"/>
	      </c:if>
	       <!--완전 비어있을 때 -->
	      
	      
	      <c:if test="${ !empty sessionScope.logininfo.id }"><!-- 로그인 있는애들 -->
	     		<c:set var="privatecompare" />
	      
		      <!-- 해당 피드에 LikeStatus상태가 들어있을 때 -->
		      <c:if test="${!empty comparablelikestatus }">
			       <!-- Like/Bad 구분자 전역변수 -->
			  		
			      <c:forEach items="${comparablelikestatus }" var="compareDto">
			  	
				    <c:if test="${compareDto.feedno eq feeddto.feedno }">
				   		<c:if test="${compareDto.likestatus eq 0}">
			    			<img class="likebtn" onclick="likestatus(${feeddto.feedno});" src="https://w7.pngwing.com/pngs/877/316/png-transparent-facebook-like-button-computer-icons-youtube-social-media-youtube-orange-logo-social-media-thumbnail.png" style="width:3%; float:left; margin-top:-0.5%; cursor:pointer;"/>
		      			</c:if>
		      			<c:if test="${compareDto.likestatus eq 1}">
			    			<img class="likebtn" onclick="likeminus(${feeddto.feedno});" src="https://cdn.iconscout.com/icon/premium/png-512-thumb/unlike-7-161678.png" style="width:3%; float:left; margin-top:-0.5%; cursor:pointer;"/>
		      			</c:if>
		      			<c:set var="privatecompare">${compareDto.feedno }</c:set>
			      	</c:if>
			      	
				  </c:forEach>
				  
				  <!-- 디비값 없을 때-->
			       <c:if test="${privatecompare ne feeddto.feedno}">
			      	<img class="likebtn" onclick="likestatus(${feeddto.feedno});" src="https://w7.pngwing.com/pngs/877/316/png-transparent-facebook-like-button-computer-icons-youtube-social-media-youtube-orange-logo-social-media-thumbnail.png" style="width:3%; float:left; margin-top:-0.5%; cursor:pointer;"/>
			       </c:if>
	      		<!-- 디비값 없을 때-->
				 
			  </c:if>
		  
		  </c:if><!-- 로그인 있는애들 -->
		   <!-- 해당 피드에 LikeStatus상태가 들어있을 때 -->
	      <!-- Like버튼 -->
      	  <!-- Like,Comment Count출력부분 -->
	       <div class="footer-right" style="margin: -3.5% 0% 0% 87%;">
	        <span class="favs"><img src="https://www.freepngimg.com/thumb/heart/67620-heart-instagram-icons-button-computer-like.png" style="width:30%; float: left; margin-top: -5%;"/>
	        <c:forEach items="${likecountlist }" var="likecount">
        		<c:if test="${likecount.feedno eq feeddto.feedno }">
         			<a>${likecount.likecount }</a>
         		</c:if>
        	</c:forEach>
	        </span>
	        <span class="divisor"></span>
	        <span class="comment"><img src="https://toppng.com/uploads/preview/vector-icon-of-a-speech-bubble-facebook-comments-icon-11562966871wdesdj5arq.png" style="width:20%;"/>
	        <c:forEach items="${commentcountlist }" var="commentcount">
        		<c:if test="${commentcount.feedno eq feeddto.feedno }">
        			<a id="commentcnt${feeddto.feedno }">${commentcount.commentcount }</a>
        		</c:if>
        	</c:forEach>
	        </span>
	      </div>   
	      <!-- Like,Comment Count출력부분 -->
	      </div>
	      <!-- 코멘트영역 -->
      	<div class="comments-container">
      			<!-- 코멘트 작성 영역 -->
      			<c:if test="${!empty sessionScope.logininfo.id }">
				<div class="comment-main-level">
					<!-- Avatar -->
					<img src="resources/images/profileimgstorage/${sessionScope.logininfo.profileimg }" style="width:7%; height:50px; border-radius:50px; float:left;" />
						<input class="commentwrtarea" id="${feeddto.feedno }" type="text" name="recomment" onkeypress="if(event.keyCode==13) {writecomment(${feeddto.feedno});}" required/>
						<input class="commentwrtbtn" type="button" onclick="writecomment(${feeddto.feedno});" value="send" />										
				</div><br/><br/><br/>
				</c:if>
				<!-- 코멘트 작성 영역 -->
					<span class="re${feeddto.feedno }"></span>
				<!-- 코멘트 달릴 영역 -->
				<c:forEach items="${commentlist }" var="commentdto">
				<c:if test="${feeddto.feedno eq commentdto.feedno }">
				<div class="comment-main-level">
					<!-- Avatar -->
					<img src="resources/images/profileimgstorage/${commentdto.profileimg }" style="width:7%; height:50px; border-radius:50px;" />
					<!-- Contenedor del Comentario -->
					<div class="comment-box">
						<div class="comment-head">
							<span class="comment-name by-author">${commentdto.reid }</span>
							<span><fmt:formatDate value="${commentdto.redate }" pattern="yyyy.MM.dd HH:mm:ss"/></span>
							<!-- 코멘트 삭제버튼 -->
							<c:if test="${sessionScope.logininfo.id eq commentdto.reid }">
								<img class="deletemycommentbtn" onclick="deleteMyComment(${commentdto.reno});" src="https://www.clipartmax.com/png/middle/120-1209780_delete-circle-icon-png-target-logo.png" style="width:3.5%; cursor:pointer;"/>
							</c:if>
							<!-- 코멘트 삭제버튼 -->
						</div>
						<div class="comment-content">
							${commentdto.recomment }
						</div>
					</div>
				</div><br/><br/>
				</c:if>
				</c:forEach>
				<!-- 코멘트 달릴 영역 -->

		</div>
	<!-- 코멘트 영역 -->
	  </div>
</c:if>
<!-- 비디오있는 태그 -->
<!-- 내용만 있는 태그 -->
<c:if test="${empty feeddto.img and empty feeddto.video}">
	<div class="feed-border clearfix">
    <div class="feed-options"><i class="fa fa-sort-desc"></i></div>
    <div class="feed-body clearfix">
    
      <img src="resources/images/profileimgstorage/${feeddto.profileimg }" style="width:8%; height:60px; border-radius:50px; float:left; margin:2.5% 0% 0% 2%;" />
      <div class="feed-content">
        <div class="username">
        	<a class="feedatag" href="#">@${feeddto.id }</a></div>
        <p>${feeddto.content }</p>
        <!-- 삭제버튼 -->
        <c:if test="${sessionScope.logininfo.id eq feeddto.id }">
        <img class="deletebtn" onclick="location.href='deletefeed.do?feedno=${feeddto.feedno}';" src="https://cdn1.iconfinder.com/data/icons/round-ui/123/47-512.png" style="width:8%; float:left; margin-left:100%; margin-top:-13%; cursor:pointer;">
      	</c:if>
      	<!-- 삭제버튼 -->
      </div>
    </div>
    <div class="feed-footer clearfix">
      <div class="footer-left">
        <span class="footer-time"><fmt:formatDate value="${feeddto.wrtdate }" pattern="yyyy.MM.dd HH:mm:ss"/></span>
      </div>

      <!-- Like버튼 -->
      <!-- 완전 비어있을 때-->
      <c:if test="${empty comparablelikestatus and !empty sessionScope.logininfo.id }">
      	<img class="likebtn" onclick="likestatus(${feeddto.feedno});" src="https://w7.pngwing.com/pngs/877/316/png-transparent-facebook-like-button-computer-icons-youtube-social-media-youtube-orange-logo-social-media-thumbnail.png" style="width:3%; float:left; margin-top:-0.5%; cursor:pointer;"/>
      </c:if>
       <!--완전 비어있을 때 -->
      
      
      <c:if test="${ !empty sessionScope.logininfo.id }"><!-- 로그인 있는애들 -->
     		<c:set var="privatecompare" />
      
	      <!-- 해당 피드에 LikeStatus상태가 들어있을 때 -->
	      <c:if test="${!empty comparablelikestatus }">
		       <!-- Like/Bad 구분자 전역변수 -->
		  		
		      <c:forEach items="${comparablelikestatus }" var="compareDto">
		  	
			    <c:if test="${compareDto.feedno eq feeddto.feedno }">
			   		<c:if test="${compareDto.likestatus eq 0}">
		    			<img class="likebtn" onclick="likestatus(${feeddto.feedno});" src="https://w7.pngwing.com/pngs/877/316/png-transparent-facebook-like-button-computer-icons-youtube-social-media-youtube-orange-logo-social-media-thumbnail.png" style="width:3%; float:left; margin-top:-0.5%; cursor:pointer;"/>
	      			</c:if>
	      			<c:if test="${compareDto.likestatus eq 1}">
		    			<img class="likebtn" onclick="likeminus(${feeddto.feedno});" src="https://cdn.iconscout.com/icon/premium/png-512-thumb/unlike-7-161678.png" style="width:3%; float:left; margin-top:-0.5%; cursor:pointer;"/>
	      			</c:if>
	      			<c:set var="privatecompare">${compareDto.feedno }</c:set>
		      	</c:if>
		      	
			  </c:forEach>
			  
			  <!-- 디비값 없을 때-->
		       <c:if test="${privatecompare ne feeddto.feedno}">
		      	<img class="likebtn" onclick="likestatus(${feeddto.feedno});" src="https://w7.pngwing.com/pngs/877/316/png-transparent-facebook-like-button-computer-icons-youtube-social-media-youtube-orange-logo-social-media-thumbnail.png" style="width:3%; float:left; margin-top:-0.5%; cursor:pointer;"/>
		       </c:if>
      		<!-- 디비값 없을 때-->
			 
		  </c:if>
	  
	  </c:if><!-- 로그인 있는애들 -->
	   <!-- 해당 피드에 LikeStatus상태가 들어있을 때 -->
      <!-- Like버튼 -->
      <!-- Like,Comment Count출력부분 -->
      <div class="footer-right" style="margin: -3.5% 0% 0% 87%;">
        <span class="favs"><img src="https://www.freepngimg.com/thumb/heart/67620-heart-instagram-icons-button-computer-like.png" style="width:30%; float: left; margin-top: -5%;"/>
        <c:forEach items="${likecountlist }" var="likecount">
        	<c:if test="${likecount.feedno eq feeddto.feedno }">
         		<a>${likecount.likecount }</a>
         	</c:if>
        </c:forEach>
        </span>
        <span class="divisor"></span>
        <span class="comment"><img src="https://toppng.com/uploads/preview/vector-icon-of-a-speech-bubble-facebook-comments-icon-11562966871wdesdj5arq.png" style="width:20%;"/> 
        <c:forEach items="${commentcountlist }" var="commentcount">
        		<c:if test="${commentcount.feedno eq feeddto.feedno }">
        			<a id="commentcnt${feeddto.feedno }">${commentcount.commentcount }</a>
        		</c:if>
        </c:forEach>
        </span>
      </div> 
      <!-- Like,Comment Count출력부분 -->    
      </div>
      
      <!-- 코멘트영역 -->
      	<div class="comments-container">
      			<!-- 코멘트 작성 영역 -->
      			<c:if test="${!empty sessionScope.logininfo.id }">
				<div class="comment-main-level">
					<!-- Avatar -->
					<img src="resources/images/profileimgstorage/${sessionScope.logininfo.profileimg }" style="width:7%; height:50px; border-radius:50px; float:left;" />
						<input class="commentwrtarea" id="${feeddto.feedno }" type="text" name="recomment" onkeypress="if(event.keyCode==13) {writecomment(${feeddto.feedno});}" required/>
						<input class="commentwrtbtn" type="button" onclick="writecomment(${feeddto.feedno});" value="send"/>										
				</div><br/><br/><br/>
				</c:if>
				<!-- 코멘트 작성 영역 -->
					<span class="re${feeddto.feedno }"></span>
				<!-- 코멘트 달릴 영역 -->
				<c:forEach items="${commentlist }" var="commentdto">
				<c:if test="${feeddto.feedno eq commentdto.feedno }">
				<div class="comment-main-level">
					
					<!-- Avatar -->
					<img src="resources/images/profileimgstorage/${commentdto.profileimg }" style="width:7%; height:50px; border-radius:50px;" />
					<!-- Contenedor del Comentario -->
					<div class="comment-box">
						<div class="comment-head">
							<span class="comment-name by-author">${commentdto.reid }</span>
							<span><fmt:formatDate value="${commentdto.redate }" pattern="yyyy.MM.dd HH:mm:ss"/></span>
							<!-- 코멘트 삭제버튼 -->
							<c:if test="${sessionScope.logininfo.id eq commentdto.reid }">
								<img class="deletemycommentbtn" onclick="deleteMyComment(${commentdto.reno});" src="https://www.clipartmax.com/png/middle/120-1209780_delete-circle-icon-png-target-logo.png" style="width:3.5%; cursor:pointer;"/>
							</c:if>
							<!-- 코멘트 삭제버튼 -->
						</div>
						<div class="comment-content">
							${commentdto.recomment }
						</div>
					</div>
					
				</div><br/><br/>

				</c:if>
				</c:forEach>
				<!-- 코멘트 달릴 영역 -->

		</div>
	<!-- 코멘트 영역 -->
  </div>
</c:if>
<!-- 내용만 있는 태그 -->
</c:forEach>
</div>
<div class="feedfooter">
<%@ include file="footer.jsp" %>
</div>
</body>
<script type="text/javascript">
	
	function likeminus(paramminusfeedno){  //bad
		var likemyid = "${sessionScope.logininfo.id}";
		
		$.ajax({
			url:"updatelikestatus.do",
			data:{"feedno":paramminusfeedno,"likeid":likemyid},
			dataType:"text",
			type:"post",
			success:function(data){
				location.reload();
			},
			error:function(){
				beautyAlt("통신실패");
			}
		})
	}

	function likestatus(paramlikefeedno){   //good
		
		var likeid = "${sessionScope.logininfo.id}";
		
		$.ajax({
			url:"insertlikestatus.do",
			data:{"feedno":paramlikefeedno,"likeid":likeid},
			dataType:"text",
			type:"post",
			success:function(data){
				location.reload();
			},
			error:function(){
				beautyAlt("통신실패");
			}
		})
	}

	function deleteMyComment(paramreno){
		/* alert(paramreno); */
		$.ajax({
			url:"deletemycomment.do",
			data:{"reno":paramreno},
			dataType:"text",
			type:"post",
			success:function(data){
				location.reload();
			},
			error:function(){
				beautyAlt("통신 실패");
			}
		})
	}

	function writecomment(paramfeedno){
		//alert(paramfeedno);
		var reid = "${sessionScope.logininfo.id}";
		var recomment = $("#"+ paramfeedno +"").val();
		var reprependtag = $(".re"+ paramfeedno +"");
		var commentcount = Number($("#commentcnt"+ paramfeedno + "").text()) + 1;
		//alert("코멘트 총갯수: "+commentcount);
		//alert("입력한값:" + recomment);
		//alert("붙일기준점:" + $(".re"+ paramfeedno +""));
		//댓글 작성 후 가져올 가장 마지막 댓글 하나의 정보
		var rewrtimg = "";  //댓글 쓴 사람의 프로필사진
		var rewrtid = "";  //댓글 쓴 사람의 id
		var rewrtdate = ""; //댓글 쓴 사람의 날짜
		var rewrtcomment = "";  //댓글 쓴 사람의 댓글
		var rewrtno = "";    //댓글 쓴 사람의 pk
		
		if(recomment == ""){
			beautyAlt("댓글을 작성해주세요.");
		}else{
			$.ajax({
				url:"writecommentform.do",
				type:"post",
				data:{"feedno":paramfeedno,"reid":reid,"recomment":recomment},
				dataType:"json",
				success:function(data){

					$.each(data,function(key,val){
						console.log(key + " : " + val);
						if(key == "profileimg"){
							rewrtimg = val;
						}
						if(key == "id"){
							rewrtid = val;
						}
						if(key == "redate"){
							rewrtdate = val;
						}
						if(key == "recomment"){
							rewrtcomment = val;
						}
						if(key == "reno"){
							rewrtno = val;
						}
					})
					var newprependTag = $("<div class='comment-main-level'>"+
										  "<img src=resources/images/profileimgstorage/"+ rewrtimg +" style='width:7%; height:50px; border-radius:50px;'/>"+
										  "<div class='comment-box'>"+
										  "<div class='comment-head'>"+
										  "<span class='comment-name by-author'>"+ rewrtid +"</span>"+
										  "<span>"+ rewrtdate +"</span><img class='deletemycommentbtn' onclick='deleteMyComment("+ rewrtno +");' src='https://www.clipartmax.com/png/middle/120-1209780_delete-circle-icon-png-target-logo.png' style='width:3.5%; cursor:pointer;'/></div>"+
										  "<div class='comment-content'>"+ rewrtcomment +"</div></div></div><br/><br/>")
										
					reprependtag.prepend(newprependTag);
					$("#commentcnt"+ paramfeedno +"").html("<a id='commentcnt"+ paramfeedno +"'>"+ commentcount +"</a>");
					
					$("#"+ paramfeedno +"").val("");
				},
				error:function(){
					beautyAlt("통신 실패");
				}
			})
		}
	}

	function writebtn(){
		  var openWin;
	  		
  		  var popUrl = "feedwrite.do?id=${sessionScope.logininfo.id}";
  		  var popOption = "width=900, height=500, resizable=no, scrollbars=no, status=no;"; 
		  window.name = "parentForm";

          openWin = window.open(popUrl,"childForm", popOption); 
	}

	$(function(){
		$(".writebtn").hover(function(){
			$(this).css("opacity","0.6");
		},function(){
			$(this).css("opacity","1");
		});
		
		$(".deletebtn").hover(function(){
			$(this).css("opacity","0.6");
		},function(){
			$(this).css("opacity","1");
		});
		
		$(".likebtn").hover(function(){
			$(this).css("opacity","0.8");
		},function(){
			$(this).css("opacity","1");
		});
		
		$(".deletemycommentbtn").hover(function(){
			$(this).css("opacity","0.8");
		},function(){
			$(this).css("opacity","1");
		});
		
		$(".commentwrtbtn").hover(function(){
			$(this).css("opacity","0.8");
		},function(){
			$(this).css("opacity","1");
		});
		
		$(".feedatag").click(function(){
			var targetId = $(this).text();
			var splitval = targetId.split("@");
			var targetResId = splitval[1];
			var myid = "${sessionScope.logininfo.id}";
			
			if(myid == ""){
				beautyAlt("로그인이 필요합니다.");
				return false;
			}else{
				var openWin;
		  		
		  		var popUrl = "fromfeedlettersend.do?id="+targetResId+"&sender="+myid;
		  		var popOption = "width=370, height=450, resizable=no, scrollbars=no, status=no;";
				window.name = "parentForm";

		        openWin = window.open(popUrl,"childForm", popOption); 
			}
			
		})
	});
	
</script>
</html>
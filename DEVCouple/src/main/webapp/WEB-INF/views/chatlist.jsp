<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" type="text/css" href="resources/css/chatlist.css"/>
</head>
<body>
<div class="webscreen">
<%@ include file="header.jsp" %><br/><br/><br/><br/><br/>
<div class="chatbody">
<c:choose>
   <c:when test="${empty chatList }">
      <p style="text-align:center; margin-top:18%;">===========채팅방이 존재하지 않습니다.==========</p>
   </c:when>
   <c:otherwise>
      <ul class="chatlist">
         <c:forEach items="${chatList}" var="list">   
              <li class="chatlist__item">
                <figure class="chatlist__image" onclick="location.href='chatroom.do?roomno=${list.roomno }';">
                  <img src="resources/images/profileimgstorage/${list.profileimg }" alt="roomimg" class="chatlist__avatar">
                </figure>

              <main class="chatlist__main" onclick="goChatRoom(${list.roomno });">
                  <div class="chatlist__title">${list.roomname }</div>
                  <div class="chatlist__text">${list.roomdescription }</div>
                  <div class="chatlist__text">방장:&nbsp;${list.id }(${list.name })</div>
                </main>

                <aside class="chatlist__aside">
      
                  <time class="chatlist__text">
                                                   개설일:&nbsp;<fmt:formatDate value="${list.maketime }" pattern="yyyy.MM.dd"/>
                  </time><br/>
                </aside>
                <!-- 방장 삭제 권한 -->
                <c:if test="${sessionScope.logininfo.id eq list.id }">
                   <img alt="delete" src="https://cdn3.iconfinder.com/data/icons/social-messaging-ui-color-line/254000/82-512.png" 
                    style="width:5%; float:right;" onclick="deleteRoom(${list.roomno });"/>
                </c:if>
                <!-- 방장 삭제 권한 -->
              </li>
              
         </c:forEach>
      </ul>
   </c:otherwise>
</c:choose>
</div>
   <!-- 채팅방 만들기 버튼 -->
   <c:if test="${!empty sessionScope.logininfo.id }">
	   <div class="makebtnbody">
	      <a class="btnatag" onclick="openChild()">MakeRoom</a>
	   </div>
   </c:if>	      
   <!-- 채팅방 만들기 버튼 -->
<div style="margin-top:13%;">   
<%@ include file="footer.jsp" %>
</div>
</div>
<!---------------------------------------------------------------------------->
<div class="mobilescreen">
<%@ include file="header.jsp" %><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<div class="chatbody">
<c:choose>
   <c:when test="${empty chatList }">
      <p style="text-align:center; margin-top:18%;">===========채팅방이 존재하지 않습니다.==========</p>
   </c:when>
   <c:otherwise>
      <ul class="chatlist">
         <c:forEach items="${chatList}" var="list">   
              <li class="chatlist__item">
                <figure class="chatlist__image" onclick="location.href='chatroom.do?roomno=${list.roomno }';">
                  <img src="resources/images/profileimgstorage/${list.profileimg }" alt="roomimg" class="chatlist__avatar">
                </figure>

              <main class="chatlist__main" onclick="goChatRoom(${list.roomno });">
                  <div class="chatlist__title">${list.roomname }</div>
                  <div class="chatlist__text">${list.roomdescription }</div>
                  <div class="chatlist__text">방장:&nbsp;${list.id }(${list.name })</div>
                </main>

                <aside class="chatlist__aside">
      
                  <time class="chatlist__text">
                                                   개설일:&nbsp;<fmt:formatDate value="${list.maketime }" pattern="yyyy.MM.dd"/>
                  </time><br/>
                </aside>
                <!-- 방장 삭제 권한 -->
                <c:if test="${sessionScope.logininfo.id eq list.id }">
                   <img alt="delete" src="https://cdn3.iconfinder.com/data/icons/social-messaging-ui-color-line/254000/82-512.png" 
                    style="width:5%; float:right;" onclick="deleteRoom(${list.roomno });"/>
                </c:if>
                <!-- 방장 삭제 권한 -->
              </li>
              
         </c:forEach>
      </ul>
   </c:otherwise>
</c:choose>
</div>
   <!-- 채팅방 만들기 버튼 -->
   <c:if test="${!empty sessionScope.logininfo.id }">
	   <div class="makebtnbody">
	      <a class="btnatag" onclick="openChild()" style="margin-top: 10%; margin-left:-10%;">MakeRoom</a>
	   </div>   
	</c:if>	   
   <!-- 채팅방 만들기 버튼 -->
<div style="margin-top:96%;">   
<%@ include file="footer.jsp" %>
</div>
</div>
</body>
<script type="text/javascript">
    
        var openWin;
       var id = "${sessionScope.logininfo.id }";
        function openChild()
        {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("chatForm.do?id="+id,
                    "childForm", "width=500, height=500, resizable = no, scrollbars = no ");    
        }
        
        function deleteRoom(param){
           //alert(param);
           var conf = confirm("정말로 삭제하시겠습니까?");
           if(conf == true){   
              location.href="deleteRoom.do?roomno="+param+"";       
           }else{
              event.stopPropagation();
           }
        }
        
        function goChatRoom(paramroomno){
        	var myid = "${sessionScope.logininfo.id }";
        	
        	if(myid == ""){
        		beautyAlt("로그인이 필요합니다.");
        		return false;
        	}else{
        		location.href="chatroom.do?roomno="+paramroomno;
        	}
        }

   </script>
</html>
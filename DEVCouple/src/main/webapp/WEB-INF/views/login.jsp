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
<link rel="stylesheet" type="text/css" href="resources/css/signupform.css"/>
</head>
<body>
<div class="webscreen">
<div style="margin-top:2%;">
<%@ include file="header.jsp" %>
</div>
<div class="body" style="height:730px;">
   
   <form action="loginRes.do" method="post" style="margin-top:-2%;">
      <h3 id="logo" style="margin-top:30%;">Login</h3>
      <label for="username" style="margin-left:18%;">ID</label>
      <input type="text" name="id" placeholder="아이디 입력" style="width: 65%; margin-left: 18%;"/>
      <label for="username" style="margin-left:18%;">PW</label>
      <input type="password" name="pw" placeholder="비밀번호 입력" style="width: 65%; margin-left: 18%;"/>
      <input type="submit" value="로그인" style="margin-right: 17%;"/>
   </form>   
</div><br/><br/><br/><br/><br/><br/>
<%@ include file="footer.jsp" %>   
</div>
<!---------------------------------------------------------------------------->
<div class="mobilescreen">
<%@ include file="header.jsp" %><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

<div class="body" style="height:730px;">
   
   <form action="loginRes.do" method="post" style="margin-top:-2%;">
      <h3 id="logo" style="margin-top:30%;">Login</h3>
      <label for="username" style="margin-left:18%;">ID</label>
      <input type="text" name="id" placeholder="아이디 입력" style="width: 65%; margin-left: 18%;"/>
      <label for="username" style="margin-left:18%;">PW</label>
      <input type="password" name="pw" placeholder="비밀번호 입력" style="width: 65%; margin-left: 18%;"/>
      <input type="submit" value="로그인" style="margin-right: 17%;"/>
   </form>   
</div><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<div style="margin-top:15%;">
<%@ include file="footer.jsp" %>
</div>
</div>

</body>
</html>
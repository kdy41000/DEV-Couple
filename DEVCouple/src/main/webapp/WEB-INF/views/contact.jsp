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
<link rel="stylesheet" type="text/css" href="resources/css/contact.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="webscreen">
<%@ include file="header.jsp" %><br/><br/><br/><br/><br/><br/><br/>
<div class="contacthtml">
<div id="page-wrapper" class="clearfix">
    <h1 class="contacth1">Contact</h1>
    <p class="contacthp">문의사항 및 요청사항을 전송해 주세요.</p>

    <form action="contactRes.do" method="post" id="file-form">
      <div class="field">
        <input class="contactinput" type="text" name="name" id="filename" placeholder="이름을 입력해주세요...">
      </div>
      <div class="field">
        <input class="contactinput" type="email" name="email" id="filename" placeholder="이메일을 입력해주세요...">
      </div>
      <div class="field">
        <textarea class="contacttextarea" name="content" id="content" placeholder="내용을 입력해주세요..." style="resize:none;"></textarea>
      </div>
      <div class="field">
        <button class="contactbutton" type="button" onclick="send();">Send</button>
        <div id="messages"></div>
      </div>
    </form>
   <img alt="img" src="https://cdn.pixabay.com/photo/2018/02/04/01/54/paper-planes-3128885_960_720.png" style="width:20%; margin:8% 0% 0% 5%;"/>
  </div>
</div><br/><br/><br/> 
<%@ include file="footer.jsp" %> 
</div>
<!---------------------------------------------------------------------------->
<div class="mobilescreen">
<%@ include file="header.jsp" %><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<div class="contacthtml">
<div id="page-wrapper" class="clearfix" style="height: 800px; width: 90%; margin-top: 15%;">
    <h1 class="contacth1" style="text-align:center;">Contact</h1>
    <p class="contacthp" style="text-align:center;">문의사항 및 요청사항을 전송해 주세요.</p><br/>
   <img alt="img" src="https://cdn.pixabay.com/photo/2018/02/04/01/54/paper-planes-3128885_960_720.png" style="width:20%; margin:0% 0% 0% 40%;"/><br/><br/>
    <form action="contactRes.do" method="post" id="file-form">
      <div class="field">
        <input class="contactinput" type="text" name="name" id="filename" placeholder="이름을 입력해주세요..." style="margin-left:10%;">
      </div>
      <div class="field">
        <input class="contactinput" type="email" name="email" id="filename" placeholder="이메일을 입력해주세요..." style="margin-left:10%;">
      </div>
      <div class="field">
        <textarea class="contacttextarea" name="content" id="content" placeholder="내용을 입력해주세요..." style="resize:none; margin-left:10%;"></textarea>
      </div>
      <div class="field">
        <button class="contactbutton" type="button" onclick="send();" style="margin-left:47%;">Send</button>
        <div id="messages"></div>
      </div>
    </form>
   
  </div>
</div><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<%@ include file="footer.jsp" %> 
</div>
</body>
<script type="text/javascript">
   function send(){
      if($("input[name=name]").val() == ""){
    	 beautyAlt("이름을 입력해주세요.");
         return false;
      }else if($("input[name=email]").val() == ""){
    	 beautyAlt("이메일을 입력해주세요.");
         return false;
      }else if($("#content").val() == ""){
    	 beautyAlt("내용을 입력해주세요.");
         return false;
      }else{
         $("#file-form").submit();
      }
   }
</script>
</html>
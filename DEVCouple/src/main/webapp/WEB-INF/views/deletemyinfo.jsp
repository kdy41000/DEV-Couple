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
<div style="text-align:center; margin-top:12%;">
   <h1>회원탈퇴</h1>
   <p>회원탈퇴를 위한 비밀번호를 입력해 주세요.</p>
</div><br/><br/>
<form id="deleteform" action="deletemyinfoRes.do" method="post">
   <input type="hidden" name="id" value="${id }"/>
   <input type="password" name="pw" placeholder="비밀번호를 입력해 주세요." style="border:1px solid #6f3ba9; border-radius:10px; width:20%; height:35px; font-size:15px; margin-left:40%;"/>
   <br/><br/>
   <input class="deletebtn" type="button" onclick="chkfunc();" value="회원탈퇴" style="width:20%; height:35px; border-radius:10px; color:white; background:red; font-weight:bold; font-size:15px; margin-left:40%; cursor:pointer;"/>
</form>
</section>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<%@ include file="footer.jsp" %>
</div>
<!---------------------------------------------------------------------------->
<div class="mobilescreen">
<%@ include file="header.jsp" %>
<br/><br/><br/><br/>
<%@ include file="sidemenumobile.jsp" %>
<section>
<div style="text-align:center; margin-top:57%; font-size:30px;">
   <h1>회원탈퇴</h1>
   <p>회원탈퇴를 위한 비밀번호를 입력해 주세요.</p>
</div><br/><br/>
<form id="deleteform" action="deletemyinfoRes.do" method="post">
   <input type="hidden" name="id" value="${id }"/>
   <input type="password" name="pw" placeholder="비밀번호를 입력해 주세요." style="border:1px solid #6f3ba9; border-radius:10px; width:50%; height:45px; font-size:20px; margin-left:25%;"/>
   <br/><br/>
   <input class="deletebtn" type="button" onclick="chkfunc();" value="회원탈퇴" style="width:50%; height:45px; border-radius:10px; color:white; background:red; font-weight:bold; font-size:20px; margin-left:25%; cursor:pointer;"/>
</form>
</section>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<%@ include file="footer.jsp" %>
</div>
</body>
<script type="text/javascript">
   $(".deletebtn").hover(function(){
      $(this).css("background","#fb4747");
   },function(){
      $(this).css("background","red");
   });

   function chkfunc(){
      if($("input[name=pw]").val() == ""){
    	 beautyAlt("비밀번호를 입력해 주세요.");
         return false;
      }else{
         $("#deleteform").submit();
      }
   }
</script>
</html>
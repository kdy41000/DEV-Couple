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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/signupform.css"/>
</head>
<!-- 버튼 클릭 시 다른 함수 실행 -->
<script type="text/javascript">
function uploadimg(){
   $("input[name=profileimg]").trigger('click');
}
</script>
<body>
<div style="margin-top:-10%;">
<%@ include file="header.jsp" %>
</div>
<div class="body">
  <form id="signupTotalChk" method="post" action="signupRes.do" enctype="multipart/form-data">
   
  <h3 id="logo" style="margin-top:7%;">SignUp</h3><br/><br/><br/>
  <input type='file' name="profileimg" value="" onchange="readURL(this);" style="display:none;"/>
  <img id="blah" alt="defaultimg" src="resources/images/profileimgstorage/defaulthuman.png" style="max-width: 100%; width: 150px; height:150px; border-radius:200px; margin: 0% 0% 0% 40%; border:1px solid #e4cbcb;"/>
  <br/><br/><br/>
  <input type="button" value="프로필사진 등록" onclick="uploadimg();" style="width: 30%; margin-left:35%; background:#ead3d3; color: white; font-weight:bold; cursor:pointer;"/><br/>
  
  <label for="username">ID</label>
  <input type="text" name="id" placeholder="아이디를 입력해주세요." autocomplete="off" required />
  <input type='button' value='중복확인' onclick='idchk();' style="background:#ead3d3; color:white; width:30%; font-weight:bold; cursor:pointer;"/>
  <div class="idchkRes" title="n"></div>
  
  <label for="password">Password</label>
  <input type="password" id="password" name="pw" placeholder="비밀번호를 입력해주세요." autocomplete="off" required />

  <label for="username">Name</label>
  <input type="text" name="name" placeholder="이름을 입력해주세요." autocomplete="off" required />
  
  <label for="username">Email</label>
  <input type="email"  name="email" placeholder="이메일을 입력해주세요." autocomplete="off" required />
  <input type="button" value="이메일 인증" onclick="emailchk();" style="width: 30%; background:#ead3d3; color: white; font-weight:bold; cursor:pointer;"/>
  <br/>
  <img id="loading" alt="loading" src="resources/images/loading.gif" style="display:none; width:50%; height:300px;"/>
  <div class="emailchkRes" title="n"></div>
  <br/>
  <label for="username">Phone</label>
  <input type="text" name="phone" placeholder="전화번호를 입력해주세요." autocomplete="off" required />   
  
    
  <label for="username">Address</label>
  <input type="text" name="address" onclick="Postcode();" placeholder="클릭 후 주소를 입력해주세요." autocomplete="off" readonly/>   

  <label for="username">PostCode</label>
  <input type="text" name="addone" onclick="Postcode();" placeholder="클릭 후 주소를 입력해주세요." autocomplete="off" readonly/>   
  
  <label for="username">Detail Address</label>
  <input type="text" name="detailadd" placeholder="상세주소를 입력해주세요" autocomplete="off" required />   
  
  <input type="button" onclick="chkAll();" value="Signup" style="background:red; color:white; font-weight:bold; cursor:pointer;"/>

</form>
</div><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<%@ include file="footer.jsp" %>
<script type="text/javascript">
function idchk(){
   var id = $("input[name=id]").val();
   if(id == ""){
	   beautyAlt("아이디를 입력해주세요.");
   }else{
      $.ajax({
         url:"idchk.do",
         type:"post",
         data:{"id":id},
         success:function(data){
            if(data == 0){  //사용가능
                //beautyAlt("사용가능");
                $(".idchkRes").html("<label class='idchkRes' title='y' style='color:blue; font-weight:bold; margin: -6.5% 0% 0% 32%;'>사용가능한 아이디 입니다.</label>");
             }else{         //사용불가
                $(".idchkRes").html("<label class='idchkRes' title='n' style='color:red; font-weight:bold; margin: -6.5% 0% 0% 32%;'>이미 사용중인 아이디 입니다.</label>");
             }
         },
         error:function(){
        	 beautyAlt("통신에러");
         }
      })
   }
}
</script>
<!-- 이미지 미리보기 & 이메일 중복체크-->
<script type="text/javascript">

var getAuthNum = "";

function readURL(input) {
   if (input.files && input.files[0]) {
   var reader = new FileReader();
      reader.onload = function (e) {
      $('#blah').attr('src', e.target.result);
      $('#blah').show();
      }
   reader.readAsDataURL(input.files[0]);
   }
}

function emailchk(){
   var email =   $("input[name=email]").val();
   var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/; // 이메일이 적합한지 검사할 정규식
    if(email==""){
    	beautyAlt("이메일을 입력해주세요");
    }else if(!emailRegExp.test(email)){
    	beautyAlt("이메일 형식이 올바르지 않습니다.");
        return false;
    }else{
       $.ajax({
          url:"ajaxemailchk.do",
          type:"post",
          data:{"email":email},
          success:function(data){
             console.log(data);
             if(data == 0){  //사용가능
                //alert("사용가능");
                emailSendStart(email);
                //$(".emailchkRes").html("<label class='emailResStatus' title='y' style='color:blue; font-weight:bold; margin: -6.5% 0% 0% 32%;'>사용가능한 이메일 입니다.</label>");
             }else{         //사용불가
                $(".emailchkRes").html("<label class='emailResStatus' title='n' style='color:red; font-weight:bold; margin: -6.5% 0% 0% 32%;'>이미 사용중인 이메일 입니다.</label>");
             }
          },
          error:function(){
        	  beautyAlt("통신에러");
          }
       })
    }
}
   function emailSendStart(emailSendinfo){
      $.ajax({
         url:"ajaxemailsend.do",
         type:"post",
         data:{"email":emailSendinfo},
         beforeSend : function() {
              $("#loading").show();
          },
         success:function(data){  //이메일 인증번호 전송 후, 인증번호란 보이게 설정
             $("#loading").hide();
            if(data.length > 0){
               console.log(data);
               beautyAlt("인증번호가 이메일로 전송되었습니다.");
               getAuthNum = $.trim(data);
               console.log(getAuthNum);
               $(".emailchkRes").html("<input type='text' id='inputAuthNum' placeholder='인증번호를 입력해주세요.' style='width:30%;'/>");
               $(".emailchkRes").append("<input type='button' value='인증' onclick='authNumChk();' style='background:#babaec; border:1px solid #babaec; color:white; width:30%; margin: -8% 0% 0% 33%; font-weight:bold; cursor:pointer;'/>");
            }else{
            	beautyAlt("이메일 전송을 실패하였습니다. 고객센터로 문의 주십시오.")
            }
         },error:function(){
            
         }
      })
   }
   
   function authNumChk(){
      
      if($("#inputAuthNum").val() == ""){
    	  beautyAlt("인증번호를 입력해주세요.");
      }
      if(getAuthNum == $("#inputAuthNum").val()){
    	  beautyAlt("인증번호가 일치");
         $(".emailchkRes").html("<label class='emailchkRes' title='y' style='color:blue; font-weight:bold; margin: -6.5% 0% 0% 32%;'>이메일이 인증되었습니다.</label>");
         $("input[name=email]").attr('readonly',true);
      }else if (getAuthNum != $("#inputAuthNum").val()){
    	  beautyAlt("인증번호가 일치하지 않습니다.");
      }
   }
</script>
<!-- 도로명API -->
<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function Postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("input[name=address]").val(data.zonecode);
                $("input[name=addone]").val(roadAddr);

            }
        }).open();
    }
</script>
<!-- 도로명API -->
<!-- 유효성 검사 -->
<script type="text/javascript">
   
   function chkAll(){
      //alert("클릭했다.");
      if($("input[name=id]").val()==""){
    	  beautyAlt("아이디를 입력해주세요.");
         return false;
      }else if($("#idchkRes").title=="n"){
    	  beautyAlt("아이디 중복체크를 진행해주세요.");
         return false;
      }else if($("input[name=pw]").val()==""){
    	  beautyAlt("비밀번호를 입력해주세요.");
         return false;
      }else if($("input[name=name]").val()==""){
    	  beautyAlt("이름을 입력해주세요.");
         return false;
      }else if($("input[name=email]").val()==""||$(".emailchkRes").title=="n"){
    	  beautyAlt("이메일을 확인해주세요.");
         return false;
      }else if($("input[name=phone]").val()==""){
    	  beautyAlt("전화번호를 입력해주세요.");
         return false;
      }else if($("input[name=address]").val() ==""){
    	  beautyAlt("주소를 확인해주세요.");
         return false;
      }else if($("input[name=addone]").val() ==""){
    	  beautyAlt("주소를 확인해주세요.");
         return false;
      }else if($("input[name=detailadd]").val()==""){
    	  beautyAlt("상세주소를 입력해주세요.");
         return false;
      }else{
         $("#signupTotalChk").submit();
      }
   }
</script>
</body>
</html>
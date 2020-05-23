<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
	* { box-sizing:border-box; }

/* basic stylings ------------------------------------------ */
body 				 { background:url(https://scotch.io/wp-content/uploads/2014/07/61.jpg); }
.container 		{ 
  font-family:'Roboto';
  width:600px; 
  margin:30px auto 0; 
  display:block; 
  background:#FFF;
  padding:10px 50px 50px;
}
h2 		 { 
  text-align:center; 
  margin-bottom:50px; 
}
h2 small { 
  font-weight:normal; 
  color:#888; 
  display:block; 
}
.footer 	{ text-align:center; }
.footer a  { color:#53B2C8; }

/* form starting stylings ------------------------------- */
.group 			  { 
  position:relative; 
  margin-bottom:45px; 
}
input 				{
  font-size:18px;
  padding:10px 10px 10px 5px;
  display:block;
  width:300px;
  border:none;
  border-bottom:1px solid #757575;
}
input:focus 		{ outline:none; }

/* LABEL ======================================= */
label 				 {
  color:#999; 
  font-size:18px;
  font-weight:normal;
  position:absolute;
  pointer-events:none;
  left:5px;
  top:10px;
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}

/* active state */
input:focus ~ label, input:valid ~ label 		{
  top:-20px;
  font-size:14px;
  color:#5264AE;
}

/* BOTTOM BARS ================================= */
.bar 	{ position:relative; display:block; width:300px; }
.bar:before, .bar:after 	{
  content:'';
  height:2px; 
  width:0;
  bottom:1px; 
  position:absolute;
  background:#5264AE; 
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}
.bar:before {
  left:50%;
}
.bar:after {
  right:50%; 
}

/* active state */
input:focus ~ .bar:before, input:focus ~ .bar:after {
  width:50%;
}

/* HIGHLIGHTER ================================== */
.highlight {
  position:absolute;
  height:60%; 
  width:100px; 
  top:25%; 
  left:0;
  pointer-events:none;
  opacity:0.5;
}

/* active state */
input:focus ~ .highlight {
  -webkit-animation:inputHighlighter 0.3s ease;
  -moz-animation:inputHighlighter 0.3s ease;
  animation:inputHighlighter 0.3s ease;
}

/* ANIMATIONS ================ */
@-webkit-keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
@-moz-keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
@keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}

form{
    margin-left: 17%;
}

.submitbtn{
	color: #fff;
    background-color: #2C3E50;
    border-color: #2C3E50;
    cursor: pointer;
}
</style>
</head>
<body>
<div class="container">
  
  <h2>Feed 작성<small>일상 속 이야기를 사람들에게 공유해 보세요.</small></h2>
  
  <form name="insertresform" action="feedwriteRes.do" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${id }"/>
     <input type="file" name="img" onchange="readURL();" style="display:none;"/>
     <input type="file" name="video" onchange="readURL();" style="display:none;"/>
     <button class="imgbtn" onclick="uploadimg();" type="button" style="width: 35%; height:35px; background:#dda5b8; color: white; font-weight:bold; cursor:pointer;">이미지업로드</button>
     <button class="videobtn" onclick="uploadvideo();" type="button" style="width: 35%; height:35px; background:#dda5b8; color: white; font-weight:bold; cursor:pointer;">동영상업로드</button>
    <br/><br/><br/>
    <div class="output">
		<img id="blahimg" src="https://ak.picdn.net/shutterstock/videos/1030885892/thumb/5.jpg" style="display:none; width: 55%; margin-left: 10%;"/>
    </div>
    <br/><br/><br/>
   <!--  <div class="group">      
      <input type="file" name="img">
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>이미지업로드</label>
    </div> -->
    <!-- <div class="group">      
      <input type="file" name="video">
      <span class="highlight"></span>
      <span class="bar"></span>
      <label style="top:-17px">동영상업로드</label>
    </div> -->
    
    <div class="group">      
      <input type="text" name="content" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label style="top:-17px">내용</label>
    </div>
    
    <input type="button" onclick="writeRes();" value="작성" class="submitbtn"/>
  </form>
  
</div>
</body>
<script type="text/javascript">
	function uploadimg(){
		$("input[name=img]").trigger('click');
		
	}
	
	function uploadvideo(){
		$("input[name=video]").trigger('click');
		
	}
	
	function readURL() {
		  $("#blahimg").show();
		  $(".imgbtn").remove();
		  $(".videobtn").remove();
	}

	function writeRes(){
		if($("input[name=content]").val() == ""){
			beautyAlt("내용을 입력해주세요.");
		}else{
			insertresform.target="parentForm";
			insertresform.submit();
			self.close();
		}
	}

	$(function(){
		$(".submitbtn").hover(function(){
			$(this).css("background","#4c6177");
		},function(){
			$(this).css("background","#2C3E50");
		});
		
		$(".imgbtn").hover(function(){
			$(this).css("background","#cf7795");
		},function(){
			$(this).css("background","#dda5b8");
		});
		
		$(".videobtn").hover(function(){
			$(this).css("background","#cf7795");
		},function(){
			$(this).css("background","#dda5b8");
		});
	});
</script>
<script type="text/javascript">
	function beautyAlt(msg){
		
		Swal.fire({
			  title: msg,
			  text: "버튼을 클릭해 주세요!",
			  icon: 'warning',
			  confirmButtonColor: '#3085d6',
			  confirmButtonText: '확인'
			})
	}
</script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</html>
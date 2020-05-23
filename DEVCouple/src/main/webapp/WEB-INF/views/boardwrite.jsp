<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV Couple</title>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Nanum+Pen+Script&family=Single+Day&family=Sunflower:wght@500&display=swap" rel="stylesheet">
<!-- summernote 소스 시작 -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
<!-- summernote 소스 끝 -->
<!-- 부트 스트랩이 중첩되는 경우에는 에러가 날 수 있음 -->

</head>
<body style="background:#f5f2f3;">

	
	<!-- summernote 실행 -->
<script>
	$(document).ready(function() {
		$('#summernote').summernote({	//summernote 실행
			width:900,
			height:400 , 
			minHeight: null,             // set minimum height of editor
		    maxHeight: null,             // set maximum height of editor
		    focus: true                  // set focus to editable area after initializing summe		
		});
		
	});	
	
	
	
</script>
<form name="writeresform" class="writeresform" method="post" style="margin-top:5%; margin-left:5%;">
<h2 class="applytitle">Write Notice</h2><br/>
<input type="hidden" name="id" value="${id }"/>
<input type="text" name="title" placeholder=" Write down title here..." style="width:30%; height:35px; font-size:15px; border:1px solid pink; border-radius:1%;"/><br/><br/>
<textarea id="summernote" name ="content"></textarea>
<input type="button" onclick="writeRes();" class="writebtn" value="Write" style="width:30%; height:35px; background:red; font-size:15px; color:white; border-radius:1%; font-weight:bold"/>
</form>

</body>
<script type="text/javascript">
	function writeRes(){
		if($("input[name=title]").val() == ""){
			beautyAlt("제목을 입력해 주세요.");
			return false;
		}else{
			window.opener.name = "parentPage"; // 부모창의 이름 설정
		    document.writeresform.target = "parentPage"; // 타켓을 부모창으로 설정
		    document.writeresform.action ="boardwriteRes.do";
		    document.writeresform.submit();
		    self.close();
		    
		}
	}
	
	function revisedetail(){
		var seq = "${boarddto.seq }";
		var openWin;
		
		var popUrl = "updateboard.do?seq="+seq;	//팝업창에 출력될 페이지 URL

		var popOption = "width=900, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.name="parentForm";
		openWin = window.open(popUrl,"childForm",popOption);
	}
</script>
<script type="text/javascript">
	$(".writebtn").hover(function(){
		$(this).css("background","pink").css("color","black");
	},function(){
		$(this).css("background","red").css("color","white");
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
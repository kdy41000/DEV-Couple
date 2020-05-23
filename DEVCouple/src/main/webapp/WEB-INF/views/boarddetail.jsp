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
<title>DEV Couple</title>
<style type="text/css">
	@media (min-width: 480px) and (max-width: 1024px){
	.mobilescreen{
		display:show;
	}
	.webscreen{
		display:none;
	}
	td, th {
    padding: 0.75em 3.0em;
    text-align: center;
    
	}
	.replycontents {
    margin: 2% 0% 0% 15%;
    background: #f7f7f7;
    padding: 10px;
    width: 50%;
    height: 55px;
    border-radius: 10px;
    }
    .writtencontent {
 	float: left;
    margin: 6% 0% 0% -45%;
	}
	.rightfontcontent {
    margin: 0% 0% -2% 23.5%;
    color: #7f7f7f;
	}
	.movefont{
	margin-right: 5%;
	color:#7f7f7f;
	float:right;
	}
	.boarddetailfooter{
	margin-top: 65%;
	}
}

@media (min-width: 1025px){
	.mobilescreen{
		display:none;
	}
	.webscreen{
		display:show;
	}
	td, th {
    padding: 0.75em 1.5em;
    text-align: center;
    
	}
	.replycontents {
    margin: 2% 0% 0% 15%;
    background: #f7f7f7;
    padding: 10px;
    width: 44%;
    height: 55px;
    border-radius: 10px;
    }
    .writtencontent {
    float: left;
    margin: 3.5% 0% 0% -28%;
	}
	.rightfontcontent {
    margin: -2.5% 0% 0% 68.5%;
    color: #7f7f7f;
	}
	.movefont{
    margin-right: 5%;
	color:#7f7f7f;
	float:right;
	}
}
	

</style>
<link rel="stylesheet" type="text/css" href="resources/css/boarddetail.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<script type="text/javascript">
	$(function(){
		var seq = "${boarddto.seq}";
		var id = "${sessionScope.logininfo.id}";
		var deletebtn = "";
		
		$.getJSON("selectRecentReplyList.do?seq="+seq,function(data){
			console.log(data);
			
			$.each(data,function(key,val){

					//console.log(key +  " : : " + val.writer);
					
					var replycontents = $("<div class='replycontents'>")
					.append("<img class='writtenpersonimg' alt='img' src='resources/images/profileimgstorage/"+ val.profileimg +"'/>"+
							"<span class='writtenid'>"+ val.writer +" ("+ val.replydate +")</span>"+
							"<span class='writtencontent'>"+ val.replycontent +"</span>")	
					
					var starloc = $("<div class='starloc'>")
					
					for(var i = 0; i < val.star; i++){
						starloc.append("<img class='star' alt='star' src='https://freepngimg.com/download/star/36741-4-3d-gold-star-transparent-background.png'/>")
					}
					if(id == val.writer){
						deletebtn = $("<img class='deletereplybtn' src='https://cdn3.iconfinder.com/data/icons/social-messaging-ui-color-line/254000/82-512.png' onclick='deletereplybtn("+ val.replyseq +")';'/>")
					}
					$(".replyArea").append(replycontents).append(starloc).append(deletebtn)

				})
				 
		})	
	});
	
	function deletereplybtn(replyseq){
		var seq = "${boarddto.seq}";
		
		location.href="deletereply.do?replyseq="+replyseq+"&seq="+seq;
	}
</script>
<body>
<%@ include file="header.jsp" %><br/><br/><br/><br/><br/>
<section >
<!-- WEB 스크린  -->
	<div class="webscreen">
		<h1 style="text-align:center;">${boarddto.title }</h1>
		<div class="rightfontcontent">
			<span>NO: ${boarddto.seq }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span>글작성자: ${boarddto.id }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span>조회수: ${boarddto.cnt }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span>작성일: <fmt:formatDate value="${boarddto.wrtdate }" pattern="yyyy.MM.dd HH:mm"/></span>
		</div><br/><br/>
		<hr style="width:90%; border: 0.5px solid #551A8B;"/>
		<span class="movefont">
			<a class="movelink" href="section.do">Home</a> > 
			<a class="movelink" href="boardlist.do?currentpage=1">List</a> > 
			<a class="currentdetailtitle" href="boarddetail.do?seq=${boarddto.seq }">${boarddto.title }</a>
		</span>
		<br/><br/>
		<div>
			<span style="text-align:center;" >${boarddto.content }</span>
		</div>
		<br/><br/><br/>
			<c:if test="${boarddto.id eq sessionScope.logininfo.id }">
				<img alt="revise" src="https://cdn0.iconfinder.com/data/icons/weby-flat-files-folder-documents/64/Filesfolders-05-512.png" 
				id="revisedetailbtn" onclick="revisedetail();"/>
				<img alt="delete" src="https://cdn1.iconfinder.com/data/icons/round-ui/123/47-512.png" 
				id="deletedetailbtn" onclick="location.href='boarddelete.do?seq=${boarddto.seq}';"/>
			</c:if>
			<input id="backlistbtn" type="button" value="목록"/>
		<br/><br/><br/>
		<hr style="width:70%; border: 0.5px solid #551A8B;"/>
		<div style="margin-left:15%;">
			<h1>Reply</h1>
			<div class="selectTotalstar" style="margin-left:34%;">
				<img class="selectstar" id="starone" alt="star" src="https://freepngimg.com/download/star/36741-4-3d-gold-star-transparent-background.png" />
				<img class="selectstar" id="startwo" src="https://freepngimg.com/download/star/36741-4-3d-gold-star-transparent-background.png" />
				<img class="selectstar" id="starthree" src="https://freepngimg.com/download/star/36741-4-3d-gold-star-transparent-background.png" />
				<img class="selectstar" id="starfour" src="https://freepngimg.com/download/star/36741-4-3d-gold-star-transparent-background.png" />
				<img class="selectstar" id="starfive" src="https://freepngimg.com/download/star/36741-4-3d-gold-star-transparent-background.png" />
			</div>
			<form id="insertReple" action="insertReple.do">
				<input type="hidden" name="seq" value="${boarddto.seq }">
				<input type="hidden" name="writer" value="${sessionScope.logininfo.id}">
				<input type="hidden" id ="star" name="star" value="">
				<textarea class="replytextarea" name="replycontent" rows="4" cols="100"></textarea>
			</form>
		</div>
		<input class="replywritebtn" type="button" value="Write" />
		<!-- Reply 영역 -->
		<div class="replyArea" style="height:500px; overflow:scroll; overflow-x:hidden;">
		</div>	
		<!-- Reply 영역 끝-->
	</div>
	<!-- WEB 스크린 끝 -->
	<!-- 모바일 스크린  -->
		<div class="mobilescreen">
			<h1 style="text-align:center;">${boarddto.title }</h1>
			<div class="rightfontcontent">
				<span>NO: ${boarddto.seq }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>글작성자: ${boarddto.id }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>조회수: ${boarddto.cnt }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>작성일: <fmt:formatDate value="${boarddto.wrtdate }" pattern="yyyy.MM.dd HH:mm"/></span>
			</div><br/><br/>
			<hr style="width:90%; border: 0.5px solid #551A8B;"/>
			<span class="movefont" style="margin-left: 70.5%;">
				<a class="movelink" href="section.do">Home</a> > 
				<a class="movelink" href="boardlist.do?currentpage=1">List</a> > 
				<a class="currentdetailtitle" href="boarddetail.do?seq=${boarddto.seq }">${boarddto.title }</a>
			</span>
			<br/><br/>
			<div>
				<span style="text-align:center;" >${boarddto.content }</span>
			</div>
			<br/><br/><br/>
				<c:if test="${boarddto.id eq sessionScope.logininfo.id }">
					<img alt="revise" src="https://cdn0.iconfinder.com/data/icons/weby-flat-files-folder-documents/64/Filesfolders-05-512.png" 
					id="revisedetailbtn" style="margin-left: 65%;" onclick="revisedetail();"/>
					<img alt="delete" src="https://cdn1.iconfinder.com/data/icons/round-ui/123/47-512.png" 
					id="deletedetailbtn" onclick="location.href='boarddelete.do?seq=${boarddto.seq}';"/>
				</c:if>
				<input id="backlistbtn" type="button" value="목록"/>
			<br/><br/><br/>
			<hr style="width:70%; border: 0.5px solid #551A8B;"/>
			<div style="margin-left:15%;">
				<h1>Reply</h1>
				<div class="selectTotalstar" style="margin-left: 52%;">
					<img class="selectstar" style="width: 5%;" id="starone" alt="star" src="https://freepngimg.com/download/star/36741-4-3d-gold-star-transparent-background.png" />
					<img class="selectstar" style="width: 5%;" id="startwo" src="https://freepngimg.com/download/star/36741-4-3d-gold-star-transparent-background.png" />
					<img class="selectstar" style="width: 5%;" id="starthree" src="https://freepngimg.com/download/star/36741-4-3d-gold-star-transparent-background.png" />
					<img class="selectstar" style="width: 5%;" id="starfour" src="https://freepngimg.com/download/star/36741-4-3d-gold-star-transparent-background.png" />
					<img class="selectstar" style="width: 5%;" id="starfive" src="https://freepngimg.com/download/star/36741-4-3d-gold-star-transparent-background.png" />
				</div>
				<form id="insertReple" action="insertReple.do">
					<input type="hidden" name="seq" value="${boarddto.seq }">
					<input type="hidden" name="writer" value="${sessionScope.logininfo.id}">
					<input type="hidden" id ="star" name="star" value="">
					<textarea class="replytextarea" style="width:550px;"name="replycontent" rows="4" cols="100"></textarea>
				</form>
				<input class="replywritebtn" type="button" value="Write" style="margin: -13% 18% 0% 0%;"/>
			</div>
			
			<!-- Reply 영역 -->
			<div class="replyArea" style="height:500px; overflow:scroll; overflow-x:hidden;">
			</div>	
			<!-- Reply 영역 끝-->
		</div>
	<!-- 모바일 스크린 끝 -->
</section>
<div class="boarddetailfooter">	
<%@ include file="footer.jsp" %>
</div>
</body>
<script type="text/javascript">
var selectStarCnt=5;
	$(".replywritebtn").hover(function(){
		$(this).css("background","#733ba7").css("border","1px solid #733ba7");
	},function(){
		$(this).css("background","#551A8B").css("border","1px solid #551A8B");
	});
	
	$("#backlistbtn").hover(function(){
		$(this).css("background","#f39ab8").css("border","1px solid #f39ab8");
	},function(){
		$(this).css("background","#e6799e").css("border","1px solid #e6799e");
	});
	
	$("#revisedetailbtn").hover(function(){
		$(this).css("opacity","0.5");
	},function(){
		$(this).css("opacity","1");
	});
	
	$("#deletedetailbtn").hover(function(){
		$(this).css("opacity","0.5");
	},function(){
		$(this).css("opacity","1");
	});
	
	$(".selectstar").hover(function(){
		$(this).css("opacity","0.5");
	},function(){
		$(this).css("opacity","1");
	});
	
	$("#starone").click(function(){
		selectStarCnt = 1;
		$(".selectstar").remove();
		$(".selectTotalstar").append("<img class='selectedstar' alt='star' src='https://freepngimg.com/download/star/36741-4-3d-gold-star-transparent-background.png' />&nbsp; x 1")
	});
	
	$("#startwo").click(function(){
		selectStarCnt = 2;
		$(".selectstar").remove();
		$(".selectTotalstar").append("<img class='selectedstar' alt='star' src='https://freepngimg.com/download/star/36741-4-3d-gold-star-transparent-background.png' />&nbsp; x 2")
	});
	
	$("#starthree").click(function(){
		selectStarCnt = 3;
		$(".selectstar").remove();
		$(".selectTotalstar").append("<img class='selectedstar' alt='star' src='https://freepngimg.com/download/star/36741-4-3d-gold-star-transparent-background.png' />&nbsp; x 3")
	});
	
	$("#starfour").click(function(){
		selectStarCnt = 4;
		$(".selectstar").remove();
		$(".selectTotalstar").append("<img class='selectedstar' alt='star' src='https://freepngimg.com/download/star/36741-4-3d-gold-star-transparent-background.png' />&nbsp; x 4")
	});
	
	$("#starfive").click(function(){
		selectStarCnt = 5;
		$(".selectstar").remove();
		$(".selectTotalstar").append("<img class='selectedstar' alt='star' src='https://freepngimg.com/download/star/36741-4-3d-gold-star-transparent-background.png' />&nbsp; x 5")
	});
	
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
$(".replywritebtn").click(function(){
	 $('#star').val(selectStarCnt);
	 document.getElementById('insertReple').submit();
});

</script>
</html>
<%@page import="com.mvc.prectice.board.dto.PagingDto"%>
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
	.webheader{
		display:none;
	}
	
	.mobileheader{
		display:show;
	}
	
	.webbr{
		display:none;
	}
	
	.mobilebr{
		display:show;
	}
	.webfooter{
		display:none;
	}
	
	.mobilefooter{
		display:show;
	}
	td, th {
	    padding: 0.75em 3.0em;
	    text-align: center;
	}
	
	.inputClassTag{
		width: 25%;
	    height: 35px;
	    border: 1px solid #ffcdd6;
	    border-radius: 5%;
	    margin-left: 1%;
	    z-index:3
	}
	
	.searchTag{
		width: 13%;
	    height: 35px;
	    border: 1px solid #ffcdd6;
	    border-radius: 5%; margin-left:30%;
	    z-index:3
	}
	
	.letterselectbtn{
		float:right;
		margin: -2.5% -29% 0% 0%; font-size: 13px;
	}
	
	.poibtn{
		border:1px solid #178117; color:#178117; border-radius:10px; width:13%; height:30px; cursor:pointer; background:white;
		margin-top:5%;
	}
	
	#searchbtn{
	    margin: -2% 0% 0% 12%;
	}
	
	#writeboardbtn{
		margin-right: -5%;
    	margin-top: 1%;
	}
}
@media (min-width: 1025px){
	.webheader{
		display:show;
	}
	
	.mobileheader{
		display:none;
	}

	.webbr{
		display:show;
	}
	
	.mobilebr{
		display:none;
	}
	
	.webfooter{
		display:show;
	}
	
	.mobilefooter{
		display:none;
	}
	td, th {
	    padding: 0.75em 1.5em;
	    text-align: center;  
	}
	
	.inputClassTag{
		width: 10%;
	    height: 25px;
	    border: 1px solid #ffcdd6;
	    border-radius: 5%;
	}
	
	.searchTag{
		width: 8%;
	    height: 25px;
	    border: 1px solid #ffcdd6;
	    border-radius: 5%; margin-left:70%;
	}
	
	.letterselectbtn{
		margin: -0.5% 0% 0% 139%; font-size: 13px;
	}
	
	.poibtn{
		border:1px solid #178117; color:#178117; border-radius:10px; width:7%; height:30px; cursor:pointer; background:white;
	}
	
	#searchbtn{
	    margin-top: -0.7%;
	}

}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/boardlist.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/pagination.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/letterbtn.css"/>
</head>
<%
	PagingDto currentpage = (PagingDto)session.getAttribute("pagingdto");
	int pagegroup = (int)Math.ceil((double)currentpage.getCurrentpage()/currentpage.getUnderpagescale());
	int startseq = currentpage.getUnderpagescale() * (pagegroup - 1) + 1;
	int endseq = currentpage.getUnderpagescale() * pagegroup;
	int totalpage = currentpage.getTotalpage();
%>

<body>
<div class="webheader">
<%@ include file="header.jsp" %>
</div>
<div class="mobileheader" style="margin-top:-0.8%;">
<%@ include file="header.jsp" %>
</div>
<div class="webbr">
<br/><br/><br/><br/><br/><br/><br/><br/>
</div>
<div class="mobilebr">
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</div>
<div class="mobileheader">

</div>
<section style="height:650px;">
	<!-- 검색어 입력 영역 -->
	<select class="searchTag">
		<option>작성자</option>
		<option>제목</option>
	</select>
	<input type="text" name="inputVal" class="inputClassTag" placeholder="검색어를 입력해주세요."/>
    <div class="letterwrapper" id="searchbtn" onclick="search();">
		<a class="letterselectbtn" href="#">Search</a>
	</div>
	<!-- 검색어 입력 영역 -->	
	<!-- poi -->
	<input class="poibtn" type="button" value="Download Excel" onclick="location.href='poi.do';"/>
	<!-- poi -->
	<table>
		<thead>
			<tr>
				<th>NO</th>
				<th>WRITER</th>
				<th style="width:30%;">TITLE</th>
				<th>DATE</th>
				<th>CNT</th>
			</tr>
		</thead>	
		
		<tbody class="defaultList">	
		<c:choose>
			<c:when test="${empty boardlist }">
			<tr>
				<td colspan="5" align="center">=========작성된 글이 없습니다.==========</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach items="${boardlist }" var="boardDto">
				<tr>
					<td class="user-name">${boardDto.seq }</td>
					<td class="user-name">${boardDto.id }</td>
					<td class="user-name"><a href="boarddetail.do?seq=${boardDto.seq }" style="color: #7c8d87;">${boardDto.title }</a></td>
					<td class="user-name"><fmt:formatDate value="${boardDto.wrtdate }" pattern="yyyy.MM.dd HH:mm"/></td>
					<td class="user-name">${boardDto.cnt }</td>
				</tr>
			</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	
	<!-- 페이징 영역 -->
 	<div class="pagination">
	<c:if test="${empty sessionScope.backParam }">
<%
	if(pagegroup > 1){
%>	
	<a href="${sessionScope.listGubun }?currentpage=<%=startseq - 1 %>" class="prev str">Prev</a>
<%
	}
	for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
%>
	<a href="${sessionScope.listGubun }?currentpage=<%=pagenum %>" class="pager"><%=pagenum %></a>
<%
	}
	if(endseq < currentpage.getTotalpage()){
%>	
	<a href="${sessionScope.listGubun }?currentpage=<%=endseq + 1 %>" class="next str">Next</a>
<%
	}
%>	
	</c:if>
	
	<c:if test="${!empty sessionScope.backParam }">
<%
	if(pagegroup > 1){
%>	
	<a href="${sessionScope.listGubun }?inputVal=${sessionScope.backParam }&currentpage=<%=startseq - 1 %>" class="prev str">Prev</a>
<%
	}
	for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
%>
	<a href="${sessionScope.listGubun }?inputVal=${sessionScope.backParam }&currentpage=<%=pagenum %>" class="pager"><%=pagenum %></a>
<%
	}
	if(endseq < currentpage.getTotalpage()){
%>	
	<a href="${sessionScope.listGubun }?inputVal=${sessionScope.backParam }&currentpage=<%=endseq + 1 %>" class="next str">Next</a>
<%
	}
%>	
	</c:if>
	</div>
	<!-- 페이징 영역 -->
	<!-- 글쓰기 버튼 -->
	<c:if test="${!empty sessionScope.logininfo.id }">	
		<div class="letterwrapper">
			<a class="letterselectbtn" id="writeboardbtn" href="#" onclick="writeboard();">글쓰기</a>
		</div>
	</c:if>
	<!-- 글쓰기 버튼 -->
</section>
<div class="webfooter">
<br/><br/><br/><br/><br/>
</div>
<div class="mobilefooter">
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>		
</div>
<%@ include file="footer.jsp" %>	
</body>
<script type="text/javascript">
	$(function(){
		if(${sessionScope.listGubun == 'searchid.do'}){
			$(".searchTag option:eq(0)").attr("selected","selected");
		}else if(${sessionScope.listGubun == 'searchtitle.do'}){
			$(".searchTag option:eq(1)").attr("selected","selected");
		}else{
			$(".searchTag option:eq(0)").attr("selected","selected");
		}
		
		if(${!empty sessionScope.backParam}){
			$("input[name=inputVal]").val('${sessionScope.backParam}');
		}else{
			$("input[name=inputVal]").val('');
		}
	});
	
	function search(){

		var searchTag = $(".searchTag").val();
		var inputVal = $("input[name=inputVal]").val();
		console.log(searchTag);
		
		if(inputVal ==""){
			beautyAlt("검색어를 입력해주세요.");
			return false;
		}else if(searchTag == "작성자"){
			location.href="searchid.do?currentpage=1&inputVal="+inputVal;
		}else if(searchTag == "제목"){
			location.href="searchtitle.do?currentpage=1&inputVal="+inputVal;
		}
		
	}
</script>
<script type="text/javascript">
	function writeboard(){
		var id = "${sessionScope.logininfo.id}";
		var openWin;
		
		var popUrl = "boardwrite.do?id="+id;	//팝업창에 출력될 페이지 URL
		var popOption = "width=900, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		//	window.open(popUrl,"",popOption);
		
			 // window.name = "부모창 이름"; 
            window.name = "parentForm";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open(popUrl,"childForm", popOption);    

	}
	
	$(".poibtn").hover(function(){
		$(this).css("background","#178117").css("color","white");
	},function(){
		$(this).css("background","white").css("color","#178117");
	});
</script>
</html>
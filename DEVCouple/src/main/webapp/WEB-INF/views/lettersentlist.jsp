<%@page import="com.mvc.prectice.letter.dto.LetterPagingDto"%>
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
   div.material-table table th {
  font-size: 15px;
  font-weight: 500;
  color: #757575;
  cursor: pointer;
  white-space: nowrap;
  padding: 0;
  height: 70px;
  padding-left: 56px;
  vertical-align: middle;
  outline: none !important;
}

div.material-table table tr td {
  padding: 0 0 0 56px;
  height: 60px;
  font-size: 15px;
  color: rgba(0, 0, 0, 0.87);
  border-bottom: solid 1px #DDDDDD;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  text-align: center;
}
   
}
@media (min-width: 1025px){
   .mobilescreen{
      display:none;
   }
   .webscreen{
      display:show;
   }
   div.material-table table th {
  font-size: 12px;
  font-weight: 500;
  color: #757575;
  cursor: pointer;
  white-space: nowrap;
  padding: 0;
  height: 56px;
  padding-left: 56px;
  vertical-align: middle;
  outline: none !important;
}

div.material-table table tr td {
  padding: 0 0 0 56px;
  height: 48px;
  font-size: 13px;
  color: rgba(0, 0, 0, 0.87);
  border-bottom: solid 1px #DDDDDD;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  text-align: center;
}
   
}
</style>
<link rel="stylesheet" type="text/css" href="resources/css/letterlist.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/letterbtn.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/pagination.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/letterlist.js"></script>
</head>
<%
   LetterPagingDto currentpage = (LetterPagingDto)request.getAttribute("pagingdto");
   int pagegroup = (int)Math.ceil((double)currentpage.getCurrentpage()/currentpage.getUnderpagescale());
   int startseq = currentpage.getUnderpagescale() * (pagegroup - 1) + 1;
   int endseq = currentpage.getUnderpagescale() * pagegroup;
   int totalpage = currentpage.getTotalpage();
%>
<body>
<div class="webscreen">
<%@ include file="header.jsp" %><br/><br/><br/><br/>
<section>
   <div class="row" style="height:600px;">
     <div id="admin" class="col s12">
       <div class="card material-table">
         <div class="table-header">
           <span class="table-title">보낸 쪽지함</span>
           <div class="selectMyLetter" style="margin-left3%;">
              <!-- 쪽지함 선택버튼 -->
               <div class="letterwrapper">
              <a class="letterselectbtn" href="#" style="margin: 40% 0% 0% 100%;"
                 onclick="location.href='lettergetlist.do?id=${sessionScope.logininfo.id }&currentpage=1';">받은 쪽지함</a>
            </div>
            <div class="letterwrapper">
              <a class="letterselectbtn" href="#" style="margin: -37.5% 0% 0% 220%;"
                 onclick="location.href='lettersentlist.do?id=${sessionScope.logininfo.id }&currentpage=1';">보낸 쪽지함</a>
            </div>
            <!-- 쪽지함 선택버튼 끝 -->
            </div>
         </div>
         <table id="datatable">
      <thead>
      <tr>
          <th>No</th>
            <th>보낸사람</th>
            <th>제목</th>
            <th>보낸시간</th>
      </tr>
      </thead>
      <tbody>
      <c:if test="${empty letterList }">
            <td colspan="5">=========보낸쪽지가 없습니다.=========</td>
      </c:if>
      <c:if test="${!empty letterList }">
      <c:forEach items="${letterList }" var="letterList">
         <tr>
            <td>${letterList.rnum }</td>
            <td>${letterList.sender }</td>
            <td><a href="#" onclick="opendetail(${letterList.letterseq},${letterList.rnum });">${letterList.lettertitle }</a></td>
            <td><fmt:formatDate value="${letterList.lettertime }" pattern="yyyy.MM.dd HH:mm"/></td>

         </tr>
      </c:forEach>
      </c:if>
      </tbody>
       </table>
       </div>
     </div>
     <!-- 페이징 영역 -->
 <div class="pagination">   
<%
   if(pagegroup > 1){
%>   
   <a href="lettersentlist.do?id=${sessionScope.logininfo.id }&currentpage=<%=startseq - 1 %>" class="prev str">Prev</a>
<%
   }
   for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
%>
   <a href="lettersentlist.do?id=${sessionScope.logininfo.id }&currentpage=<%=pagenum %>" class="pager"><%=pagenum %></a>
<%
   }
   if(endseq < currentpage.getTotalpage()){
%>   
   <a href="lettersentlist.do?id=${sessionScope.logininfo.id }&currentpage=<%=endseq + 1 %>" class="next str">Next</a>
<%
   }
%>   
 </div>
   <!-- 페이징 영역 -->
   </div>
   
</section><br/><br/><br/><br/><br/><br/><br/><br/>      
<%@ include file="footer.jsp" %>   
</div>
<!---------------------------------------------------------------------------->
<div class="mobilescreen">
<div style="margin-top: -0.8%;">
<%@ include file="header.jsp" %>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<section>
   <div class="row" style="height:600px;">
     <div id="admin" class="col s12">
       <div class="card material-table">
         <div class="table-header" style="padding: 5%;">
           <span class="table-title" style="margin: -10% 0% 0% 45%; font-size:33px;">보낸 쪽지함</span>
           <div class="selectMyLetter" style="margin-left:3%;">
              <!-- 쪽지함 선택버튼 -->
               <div class="letterwrapper">
              <a class="letterselectbtn" href="#" style="margin: 70% 0% 0% -210%;"
                 onclick="location.href='lettergetlist.do?id=${sessionScope.logininfo.id }&currentpage=1';">받은 쪽지함</a>
            </div>
            <div class="letterwrapper">
              <a class="letterselectbtn" href="#" style="margin: -40% 0% 0% -10%;"
                 onclick="location.href='lettersentlist.do?id=${sessionScope.logininfo.id }&currentpage=1';">보낸 쪽지함</a>
            </div>
            <!-- 쪽지함 선택버튼 끝 -->
            </div>
         </div>
         <table id="datatable">
      <thead>
      <tr>
          <th>No</th>
            <th>보낸사람</th>
            <th>제목</th>
            <th>보낸시간</th>
      </tr>
      </thead>
      <tbody>
      <c:if test="${empty letterList }">
            <td colspan="5">=========보낸쪽지가 없습니다.=========</td>
      </c:if>
      <c:if test="${!empty letterList }">
      <c:forEach items="${letterList }" var="letterList">
         <tr>
            <td>${letterList.rnum }</td>
            <td>${letterList.sender }</td>
            <td><a href="#" onclick="opendetail(${letterList.letterseq},${letterList.rnum });">${letterList.lettertitle }</a></td>
            <td><fmt:formatDate value="${letterList.lettertime }" pattern="yyyy.MM.dd HH:mm"/></td>

         </tr>
      </c:forEach>
      </c:if>
      </tbody>
       </table>
       </div>
     </div>
     <!-- 페이징 영역 -->
 <div class="pagination">   
<%
   if(pagegroup > 1){
%>   
   <a href="lettersentlist.do?id=${sessionScope.logininfo.id }&currentpage=<%=startseq - 1 %>" class="prev str" style="font-size: 23px; line-height: 25px;">Prev</a>
<%
   }
   for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
%>
   <a href="lettersentlist.do?id=${sessionScope.logininfo.id }&currentpage=<%=pagenum %>" class="pager" style="font-size: 23px; line-height: 25px;"><%=pagenum %></a>
<%
   }
   if(endseq < currentpage.getTotalpage()){
%>   
   <a href="lettersentlist.do?id=${sessionScope.logininfo.id }&currentpage=<%=endseq + 1 %>" class="next str" style="font-size: 23px; line-height: 25px;">Next</a>
<%
   }
%>   
 </div>
   <!-- 페이징 영역 -->
   </div>
   
</section><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>         
<%@ include file="footer.jsp" %>   
</div>
</body>
<script type="text/javascript">
   function opendetail(ParamSeq,rnum){
   
      var popUrl = "lettersentdetail.do?letterseq="+ParamSeq+"&rnum="+rnum;   //팝업창에 출력될 페이지 URL

      var popOption = "width=370, height=450, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

         window.open(popUrl,"",popOption);

      
   }
</script>
</html>
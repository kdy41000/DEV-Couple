<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/chatForm.css"/>
<meta charset="UTF-8">
<title>DEV Couple</title>
</head>
<body>
<section style="height:800px;">
	<div class="container">
  
  <h2>방 만들기<small>Inputs</small></h2>
 
  <form id="roomMakeForm" name="roomMakeForm">
 	<input type="hidden" id="id" name="id" value="${id }"/>
 
    <div class="inputStyleClass" style="margin-left: 20%; -ms-overflow-style: none;">
	    <div class="group">      
	      <input type="text" id="roomname" name="roomname" required>
	      <span class="highlight"></span>
	      <span class="bar"></span>
	      <label>방 제목</label>
	    </div>
	      
	    <div class="group">      
	      <input type="text" id="roomdescription" name="roomdescription" required>
	      <span class="highlight"></span>
	      <span class="bar"></span>
	      <label>방 설명</label>
	    </div>
	    
	    <input type="button" value="만들기" onclick="window_close()">
    </div>
  </form>
     
  <p class="footer">
     <a href="https://scotch.io/tutorials/css/google-material-design-input-boxes-in-css3" target="_blank">tutorial</a> by <a href="https://scotch.io" target="_blank">scotch.io</a>
  </p>
  
</div>
</section>
<script type="text/javascript">
	window.onload = function(){
		var id = document.getElementById("id").value;
	}
	function window_close(url)
	{
		var myurl = "chatInsertForm.do?roomname="+document.roomMakeForm.roomname.value+"&roomdescription="+document.roomMakeForm.roomdescription.value+"&id="+document.roomMakeForm.id.value;
		window.opener.location = myurl
		window.close();
	}
</script>
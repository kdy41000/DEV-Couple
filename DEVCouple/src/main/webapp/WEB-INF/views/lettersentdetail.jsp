<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <!-- I disable the zomming capabilities on mobile using user-scalable=no -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>DEV Couple</title>
 <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
 <div class="container-fluid">
            <h1 class="text-center text-primary">Letter</h1>
            <div class="col-xs-12">
                <div class="form-group row">
                    <form name="simpleForm">

                    <label for="letterseq">NO</label>
                    <input type="text" name="letterseq" value="${rnum }" class="form-control" readonly><br />

                    <label for="id">수신자</label>
                    <input type="text" name="id" value="${letterdto.id }" class="form-control" readonly><br />

                    <label for="sender">발신자</label>
                    <input type="text" name="sender" value="${letterdto.sender }" class="form-control" readonly><br />

                    <label for="lettertitle">제목</label>
                    <input type="lettertitle" name="lettertitle" value="${letterdto.lettertitle }" class="form-control" readonly><br />
					
					<label for="lettercontent">내용</label>
                   	<textarea name="lettercontent" class="form-control" style="height:200px;" readonly>${letterdto.lettercontent }</textarea><br/>

                    </form>
                </div>
            </div>
        </div>
</body>
<script type="text/javascript" src="resources/js/letterdetail.js"></script>
</html>
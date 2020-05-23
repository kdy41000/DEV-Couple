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
					
                    <button class="btn btn-block btn-primary" type="submit" value="submit" 
                    	onclick="resend();">답장하기</button>

                    </form>
                </div>
            </div>
        </div>
</body>
<script type="text/javascript" src="resources/js/letterdetail.js"></script>
<script type="text/javascript">

	function resend(){
		console.log("resend함수 들어왔다.");
		
		var openWin;
		var popUrl = "letterReSend.do";	//팝업창에 출력될 페이지 URL

		var popOption = "width=370, height=450, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		//	window.open(popUrl,"",popOption);
		// window.name = "부모창 이름"; 
        window.name = "parentForm";
        
        window.open("", pop_title, popOption) ;
         
        var simpleForm = document.simpleForm ;
        simpleForm.target = pop_title ;
        simpleForm.action = popUrl ;
         
        simpleForm.submit() ;

	}
</script>
</html>
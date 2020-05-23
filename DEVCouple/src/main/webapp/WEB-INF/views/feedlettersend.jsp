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
                    <form name="simpleForm" action="feedSendletterRes.do" method="post">

                    <label for="id">수신자</label>
                    <input type="text" name="id" value="${id }" class="form-control" readonly><br />

                    <label for="sender">발신자</label>
                    <input type="text" name="sender" value="${sender }" class="form-control" readonly><br />

                    <label for="lettertitle">제목</label>
                    <input type="lettertitle" name="lettertitle" class="form-control" required><br />
					
					<label for="lettercontent">내용</label>
                   	<textarea name="lettercontent" id="lettertextarea" class="form-control" style="height:200px;" required></textarea><br/>
					
                    <button class="btn btn-block btn-primary" type="submit" value="submit" onclick="ResendRes();" style="background:red;">전송</button>

                    </form>
                </div>
            </div>
        </div>
</body>
<script type="text/javascript" src="resources/js/letterdetail.js"></script>
<script type="text/javascript">
	function ResendRes(){
		if($("input[name=lettertitle]").val() == ""){
			beautyAlt("제목을 입력해주세요.");
			return false;
		}else if($("#lettertextarea").val().length == 0){
			beautyAlt("내용을 입력해주세요.");
			return false;
		}else{
			simpleForm.target = "parentForm";
			simpleForm.submit();
			self.close();
		}
	}
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
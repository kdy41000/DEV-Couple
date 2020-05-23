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
<style type="text/css">
	@media (min-width: 480px) and (max-width: 1024px){
		 #toast {
            visibility: hidden;     
            bottom: 100px;                    
            border-radius: 25px;   
            background-color: #666666;    
            color: #FFFFFF;    
            padding: 15px 25px;  
            border:1px dotted blue; 
			width:45%; 
			height:130px;
			float:right; 
			position:relative; 
			margin: -7% 0% 0% 69%;
			cursor:pointer;   
        }
		
	}
	@media (min-width: 1025px){
		 #toast {
            visibility: hidden;     
            bottom: 100px;                    
            border-radius: 25px;   
            background-color: #666666;    
            color: #FFFFFF;    
            padding: 15px 25px;  
            border:1px dotted blue; 
			width:25%; 
			height:130px;
			float:right; 
			position:relative; 
			margin: -7% 0% 0% 69%;
			cursor:pointer;   
        }
		
	}
        #toast.show {
            visibility: visible;    
            animation: fade-in 1000ms, fade-out 1000ms 2000ms;
        }
      
        @keyframes fade-in {
 			
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        @keyframes fade-out {
       		
            from {
                opacity: 1;
            }
            to {
                opacity: 0;
            }
        }
</style>
</head>
<body>
<footer style="border:1px solid #dedede; width: 100%; position: absolute;
    left: 0;">
	<div style="padding:30px;">	
		<address style="text-align:center; font-weight:bold; font-family: 'Lato', Arial, sans-serif;">
			Copyright&copy; 2020 Developed by DEV DY & DEV BY 
		</address>	
	</div>	
	<div id="toast"><img alt="letter" src="resources/images/letteralram.png" style="width:27%; height:130px;"/>
		<div style="margin:-28% 0% 0% 37%;">
			<p>보낸사람: <a id="sender"></a><p>
			<p>제목: <a id="lettertitle"></a></p>
			<p>내용: 
				<a id="lettercontent"></a>
			</p>
		</div>
	</div>
</footer>
</body>
<script type="text/javascript">
	var memberid = "";
	var lastLetterSeq = 0;
	const toast = document.getElementById('toast');  // id가 toast인 요소 div
	let isToastShown = false;
	
	$(function(){
		if(${!empty sessionScope.logininfo }){       // 세션에 로그인정보가 있을시에만 작동
			memberid = "${sessionScope.logininfo.id}";
			getLastLetterSeq();         // 처음에 마지막 쪽지번호를 먼저 알아야된다.(시간차보다 먼저 실행되어야 함)
			AjaxLetterCall();           // 시간차로 계속해서 처음에 뽑은 쪽지번호와 비교 & 쪽지내용 출력		
		}	
	});

	function getLastLetterSeq(){
		$.ajax({
			url:"getLastLetterSeq.do",
			type:"post",
			dataType:"text",
			data:{"id":memberid},
			success:function(data){
				console.log("처음에 한번나와야되는 seq::" + data);
				lastLetterSeq = data;
			},
			error:function(){
				console.log("통신 실패");
			}
		})	
	}
	
	function AjaxLetterCall(){
		
		console.log("세션에 저장되어있을 시 계속 나와야되는 id:" + memberid);
		$.ajax({
			url:"ajaxLetterCall.do",
			type:"post",
			dataType:"json",
			data:{"id":memberid},
			success:function(data){
				//console.log(data);
				$.each(data, function(key, val){
					
					if(key == "sender"){         //Toast방식의 쪽지에 내용을 지속적으로 갱신
						$("#sender").text(val);
					}
					if(key == "lettertitle"){    //Toast방식의 쪽지에 내용을 지속적으로 갱신
						$("#lettertitle").text(val);
					}
					if(key =="lettercontent"){   //Toast방식의 쪽지에 내용을 지속적으로 갱신
						var lettercontent = val.substr(0,7)+".....";
						$("#lettercontent").text(lettercontent);
					}
					if(key == "letterseq"){
						console.log("letterseq::" + val);            //지속적으로 갱신할 letterseq
						console.log("lastLetterSeq::" + lastLetterSeq);     //처음에 한번만 사용할 lastLetterSeq

						if(lastLetterSeq < val){            // 새로운 쪽지가 도착하면
							//if (isToastShown) return;   // 토스트 메시지가 띄어져 있다면(true상태일 경우) 함수를 끝냄
					  		 isToastShown = true;
					  		 toast.classList.add('show');    // show라는 클래스를 추가해서 토스트 메시지를 띄우는 애니메이션을 발동시킴
					      	 setTimeout(function () {
					      	 // 3000ms 후에 show 클래스를 제거함
					      	 toast.classList.remove('show');
					      	 isToastShown = false;
					  	 	}, 3000);
						
						}
						lastLetterSeq = val;      // 쪽지를 띄우고 다시 같은 값으로 맞춰준다.
					}
					
				});
			},
			error:function(){
				console.log("통신 에러");
			}
		})
		setTimeout(AjaxLetterCall,10000);
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
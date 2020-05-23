<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/fullcalendar.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/daygrid.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/timegrid.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/fullcalendar.js"></script>
<script type="text/javascript" src="resources/js/daygrid.js"></script>
<script type="text/javascript" src="resources/js/timegrid.js"></script>
<script type="text/javascript" src="resources/js/interaction.js"></script>
<style type="text/css">
	@media (min-width: 480px) and (max-width: 1024px){
		.calmain{
			margin-top:30%;
		}
	
		.calendarfooter{
			margin-top:55%;
		}
	}
</style>
</head>
<!-- 캘린더 초기 설정 -->
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');
	  var clickCnt = 0;
	  var titlepk = "";
	  var myid = "${sessionScope.logininfo.id}";
	  
	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	    defaultView: 'dayGridMonth',
	    header: {
	      left: 'prev,next today',
	      center: 'title',
	      right: 'addEventButton'
	    },
	    eventSources: [
	    	{
	    	    url: '172.30.1.34:8787/DEVCouple/prectice/calendarList.do',
	    		type: 'post',
	    		dataType: 'json'
	    	    /* 'title':'제목1',
	    		'start':'2020-05-10',
	    		'end':'2020-05-15' */
	    	} 
	    ],
	    
	  //locale:"ko"  //캘린더 한글 설정
		customButtons: {
 			addEventButton: {
    		text: 'add schedule',
    		click: function() {
    			if(myid == ""){
    				beautyAlt("일정작성 권한이 없습니다.");
    				return false;
    			} else if(myid != "doma" && myid != "bobo"){
    				beautyAlt("일정작성 권한이 없습니다.");
    				return false;
    			}else{
			        var openWin;
			  		
			  		var popUrl = "calendarwrite.do";
			  		var popOption = "width=900, height=500, resizable=no, scrollbars=no, status=no;"; 
	    			    window.name = "parentForm";
	    	            openWin = window.open(popUrl,"childForm", popOption);   
    			}  
	        }
	      }
	    },
	    
	    eventRender: function (info) {
	    	
	        info.el.addEventListener('click', function() { 
	        	
	          if(myid == ""){
				  beautyAlt("일정관리 권한이 없습니다.");
				  return false;
			  }else if(myid != "doma" && myid != "bobo"){
				  beautyAlt("일정관리 권한이 없습니다.");
				  return false;
			  }else{
	  		      clickCnt++;
			  }
	          
	  		  if (clickCnt === 1) {
	              oneClickTimer = setTimeout(function() {
	                  clickCnt = 0;
	                  titlepk = info.event.title;
	                  
	                  var openWin;
	  		  		
	  		  		  var popUrl = "calendarupdate.do?title="+titlepk;
	  		  		  var popOption = "width=900, height=500, resizable=no, scrollbars=no, status=no;"; 
	      			  window.name = "parentForm";

	      	          openWin = window.open(popUrl,"childForm", popOption); 
	                  
	              }, 400);
	          } else if (clickCnt === 2) {
	              clearTimeout(oneClickTimer);
	              clickCnt = 0;
	              titlepk = info.event.title;
	              
	              if(confirm("일정을 삭제하시겠습니까?") == true){
		              $.ajax({
		            	  url:"calendardelete.do",
		            	  type:"post",
		            	  data:{"title":titlepk},
		            	  success:function(data){
		            		  location.reload();
		            	  },
		            	  error:function(){
		            		  beautyAlt("통신 실패");
		            	  }
		              })
	              }else{
	            	  return false;
	              }
	             
	            }    
  			  
	        });
	        
	      }
	  
	  });
	  calendar.render();
	});
</script>
<body>
<%@ include file="header.jsp" %><br/><br/><br/><br/><br/>
<div class="calmain">
<div class="out" style="center"></div>
<div id='calendar'></div>
</div>
<div class="calendarfooter">
<%@ include file="footer.jsp" %>
</div>
</body>
</html>
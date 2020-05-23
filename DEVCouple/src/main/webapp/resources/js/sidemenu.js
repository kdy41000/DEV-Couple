// open top tab menu
function toggleTech(){
		if($(".maintech").val() == "up"){
			$('#menu-nav').slideDown();
			$(".maintech").val("down");
		}else if($(".maintech").val() == "down"){
			$("#menu-nav").slideUp();
			$(".maintech").val("up");
		}
}
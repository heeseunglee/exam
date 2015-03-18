
/**
*  이벤트 배너 슬라이드 효과
*/
setInterval(function(){
	if($("#banner1").css("right") == "0px") {
		
		$("#banner2").css("right", "-100%");
		$("#banner1").animate({right: "100%"}, 500, "swing", $("#banner2").animate({right: "0%"}, 500, "swing"));
		return;
	
	} else if($("#banner2").css("right") == "0px") {
		
		$("#banner3").css("right", "-100%");
		$("#banner2").animate({right: "100%"}, 500, "swing", $("#banner3").animate({right: "0%"}, 500, "swing"));
		return;
	
	} else if($("#banner3").css("right") == "0px") {
		
		$("#banner1").css("right", "-100%");
		$("#banner3").animate({right: "100%"}, 500, "swing", $("#banner1").animate({right: "0%"}, 500, "swing"));
		return;

	}
}, 6000); // - 배너 슬라이드쇼 간격(밀리초)


$("#left_btn_wrap").click(function() {
if($("#banner1").css("right") == "0px") {
		
		//alert("now : banner1");
		$("#banner3").css("right", "100%");
		$("#banner3").animate({right: "0%"}, 500, "swing", $("#banner1").animate({right: "-100%"}, 500, "swing"));
		return;
	
	} else if($("#banner3").css("right") == "0px") {
		
		//alert("now : banner3");
		$("#banner2").css("right", "100%");
		$("#banner2").animate({right: "0%"}, 500, "swing", $("#banner3").animate({right: "-100%"}, 500, "swing"));
		return;
		
	} else if($("#banner2").css("right") == "0px") {
		
		//alert("now : banner3");
		$("#banner1").css("right", "100%");
		$("#banner1").animate({right: "0%"}, 500, "swing", $("#banner2").animate({right: "-100%"}, 500, "swing"));
		return;
	}
});



$("#right_btn_wrap").click(function() {
	if($("#banner1").css("right") == "0px") {
		
		$("#banner2").css("right", "-100%");
		$("#banner1").animate({right: "100%"}, 500, "swing", $("#banner2").animate({right: "0%"}, 500, "swing"));
		return;
	
	} else if($("#banner2").css("right") == "0px") {
		
		$("#banner3").css("right", "-100%");
		$("#banner2").animate({right: "100%"}, 500, "swing", $("#banner3").animate({right: "0%"}, 500, "swing"));
		return;
	
	} else if($("#banner3").css("right") == "0px") {
		
		$("#banner1").css("right", "-100%");
		$("#banner3").animate({right: "100%"}, 500, "swing", $("#banner1").animate({right: "0%"}, 500, "swing"));
		return;

	}
});



















/**
 *  서브메뉴 드랍다운
 */

$("#navBar ul").mouseover(function(){
	//alert("over");
	$("#navBar_sub").css("display","block");
});

$("#navBar_sub").mouseout(function(){ 
	$("#navBar_sub").css("display","none");
});
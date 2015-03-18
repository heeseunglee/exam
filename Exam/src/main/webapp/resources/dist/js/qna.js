/**
 * 	 질문/답변 게시판 동적 생성
 */
$(document).ready(function(){
		
		console.log(Json.length);
		
		if ( Json.length > 0 ) {
			for ( var i = 0; i < Json.length; i++ ) {
				
				var tag = "";
				
				if( Json[i].secret == 'y' && Json[i].writer != userSeq) {
					
					tag += "<tr class='secret' onclick='QNAClose()'>";
				
				} else {
					
					tag += "<tr class='line line"+ Json[i].seq + "' onclick='QNAView(" + Json[i].seq +")'>";
				}			
				
				
				tag += "<td class='QNA_seq'>" + Json[i].seq + "</td>";
				tag += "<td class='QNA_subject'>";
				
				if( Json[i].answer ) {
					tag += "<img src='/exam/resources/images/icons/re_icon.png' />&nbsp;&nbsp;";
				} else {
					tag += "<img src='/exam/resources/images/icons/re_ready.png' />&nbsp;&nbsp;";
				}
				
				tag += Json[i].subject; 
				
				if( Json[i].secret == 'y') {
					tag += "&nbsp;&nbsp;<img src='/exam/resources/images/icons/1424897400_lock.png' style='width: 13px;' />";
				}
				
				tag += "</td>";
				tag += "<td class='QNA_writer'>" + Json[i].name + "</td>";
				tag += "<td class='QNA_regDate'>" + Json[i].regDate + "</td>";
				tag += "</tr>";
				
				//console.log(tag);
				
				$("#QNA").append(tag);
			}
		
		} else if ( Json.length == 0 ){
			
			$("#QNA").append("<tr><td style='padding: 150px 0px; text-align: center;' colspan='4' >게시물이 존재하지 않습니다.</td></tr>");
		}
		
	});

	var flag = false;
	var active = 0;
	
	function QNAView(seq) {
		
		var seq = seq;
		//alert(seq);
		
		
		if ( !flag ) {
			
			$.ajax({
				type: "GET",
				url: "/exam/community/qna/view.action",
				data: "seq=" + seq,
				success: function(view){
					
					console.log(view);
				
					var obj = $.parseJSON(view);
					
					console.log(obj);
					
					if(obj.answer == 'null' || obj.answer == null) {
						obj.answer = "아직 답변이 등록되지 않았습니다.<br />" +
									"빠른 시간 내에 답변할 수 있도록 노력하겠습니다.";
					}
					
					var tag = "";
					tag += "<tr class='view'>";
					tag += "<td id='view_Q'>Q.</td>";
					tag += "<td colspan='3'>" + obj.content + "</td>";
					tag += "</tr>";
					tag += "<tr class='view'>";
					tag += "<td id='view_A'>A.</td>";
					tag += "<td colspan='3'>" + obj.answer + "</td>";
					tag += "</tr>";
					$(".line" + seq).css("backgroundColor","#6897f7");
					$(".line" + seq + " td").css("color","#FFFFFF");
					$(".line" + seq).after(tag);
					
					flag = true;
					active = seq;
				}
			});
			
		} else if ( flag ) {
			
			$(".view").remove();
			$(".line" + active).css("backgroundColor","inherit");
			$(".line" + active + " td").css("color","inherit");
			flag = false;
			active = 0;
		}

	}

	function QNAClose() {
		
		$(".view").remove();
		$(".line" + active).css("backgroundColor","inherit");
		$(".line" + active + " td").css("color","inherit");
		flag = false;
		active = 0;
	}
	

	
	
	
	
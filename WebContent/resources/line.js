$(function(){
		for(var i=1 ; i<14 ; i++){
			$("#"+i).hide();
		}
	})
	
	function shortestDView(stationName){
		$("#shortestD").toggle();
		$("#end").val(stationName);
		$("#start").val("");
		for(var i=1 ; i<14 ; i++){
			$("#"+i).hide();
		}
	}
	
	function stationView(stationIndex){
		for(var i=1 ; i<14 ; i++){
			$("#"+i).hide();
		}
		$(stationIndex).show();
	}
	
	function startStation(stationName){
		$("#start").val(stationName);
	}
	
	function reverse(){
		var start = $("#start").val();
		var end = $("#end").val();
		$("#start").val(end);
		$("#end").val(start);
	}
	
	function doAjax(){
		var start = $("#start").val();
		var end = $("#end").val();
		
		if(start == end || start == "" || start == null || end == "" || end == null){
			alert("출발역과 도착역을 다시 확인해주세요");
		} else {
			$.ajax({
				type: "GET",
				url: "metroApi.do?start="+start+"&end="+end,
				success: function(data){
					$("#result").toggleClass("hideToggle"); $("#result01").toggleClass("hideToggle"); $("#result02").toggleClass("hideToggle"); $("#resultButton").toggleClass("hideToggle");
					$("#result01").html("");
					var d = data.split("/");
					$("#result02").html(d[2]);
					var d01 = d[0].split(",");
					var d02 = d[1].split(",");
						
					for(var i=0 ; i<d01.length ; i++){
						d01[i] = d01[i].substring(2,4);
						var span = document.createElement("span");
						
						switch(d01[i]){
							case "01":
								d01[i] = "1";
								span.setAttribute("style", "color:#3161AB");
								break;
								
							case "02":
								d01[i] = "2";
								span.setAttribute("style", "color:#17AC4E");
								break;
								
							case "03":
								d01[i] = "3";
								span.setAttribute("style", "color:#F37F1A");
								break;
								
							case "04":
								d01[i] = "4";
								span.setAttribute("style", "color:#14B4F0");
								break;
								
							case "05":
								d01[i] = "5";
								span.setAttribute("style", "color:#A259A2");
								break;
								
							case "06":
								d01[i] = "6";
								span.setAttribute("style", "color:#D4972E");
								break;
								
							case "07":
								d01[i] = "7";
								span.setAttribute("style", "color:#69773C");
								break;
								
							case "08":
								d01[i] = "8";
								span.setAttribute("style", "color:#EC147E");
								break;
								
							case "09":
								d01[i] = "9";
								span.setAttribute("style", "color:#AA8C43");
								break;
							
							case "69":
								d01[i] = "인천1";
								span.setAttribute("style", "color:#6691C9");
								break;
								
							case "78":
								d01[i] = "인천2";
								span.setAttribute("style", "color:#FFB850");
								break;
								
							case "75":
								d01[i] = "분당";
								span.setAttribute("style", "color:#EDB217");
								break;
								
							case "77":
								d01[i] = "신분당";
								span.setAttribute("style", "color:#A8022D");
								break;
								
							case "63":
								d01[i] = "경의중앙";
								span.setAttribute("style", "color:#7DC4A5");
								break;
								
							case "67":
								d01[i] = "경춘";
								span.setAttribute("style", "color:#26A97F");
								break;
								
							case "65":
								d01[i] = "공항";
								span.setAttribute("style", "color:#71B8E5");
								break;
								
							case "79":
								d01[i] = "의정부";
								span.setAttribute("style", "color:#FF8E00");
								break;
								
							case "71":
								d01[i] = "수인";
								span.setAttribute("style", "color:#EDB217");
								break;
								
							case "80":
								d01[i] = "에버라인";
								span.setAttribute("style", "color:#77C371");
								break;
								
							case "81":
								d01[i] = "경강";
								span.setAttribute("style", "color:#2673F2");
								break;
						}
						
						if(i < d01.length-2){
							span.textContent = d02[i] + "(" + d01[i] + ")→";
						} else if (i == d01.length-2) {
							span.textContent = d02[i] + "(" + d01[i] + ")"
						}
						
						$("#result01").append(span);
					}
					
				},
				error: function(){
					alert("서버 통신 실패. 다시 한번 시도해주세요");
				}
			})
		}
	}
	
	function END(){
		$("#result01").toggleClass("hideToggle");
		$("#result02").toggleClass("hideToggle");
		$("#result").toggleClass("hideToggle");
		$("#resultButton").toggleClass("hideToggle");
		$("#start").val("");
		$("#end").val("");
		$("#shortestD").toggle();
		for(var i=1 ; i<14 ; i++){
			$("#"+i).hide();
		}
	}
	function funLoad(){
        var Cheight = $(window).height();
        $('#menu').css({'height':Cheight+'px'});
    }
    window.onload = funLoad;
    window.onresize = funLoad;
    
    function show(){
    	$("#menu").show();
    	$("#b").hide();
    }
    
    function hide(){
    	$("#menu").hide();
    	$("#b").show();
    }
    
    
    //로그인 팝업창 	
	function loginForm(){
		document.getElementById("memberWrap1").style.display ="block";		
		var btns = document.getElementById("btn");	
			btns[0].disabled = "disabled";			
	}
	
	//로그인 취소
	function notLogin(){
		document.getElementById("memberWrap1").style.display ="none";		
		var btns = document.getElementById("btn");	
			btns[0].disabled = "";			
	}
    
    
    //회원가입 팝업창
   	function registerForm(){
	document.getElementById("memberWrap2").style.display ="block";
	var btns = document.getElementById("btnR");
		btns[0].disabled = "disabled";			
	}
   	
   	//회원가입 취소
   	function notRegister(){
	document.getElementById("memberWrap2").style.display ="none";
	var btns = document.getElementById("btnR");
		btns[0].disabled = "";			
	}

    
    //id 중복체크
    	function idchk(){
		var id = $("#id").val();
		$.ajax({
			url: "./metroCon.do?command=idChk",
			data : {				
				"id" : id,	
			},
			success : function(data){				
				if(data == "0"){
					$("#register").prop("disabled","");
					$("#idChk").text("사용할 수 있는 아이디입니다.");	
				}else{
					$("#idChk").text("사용할 수 없는 아이디입니다.");	
				}
			},
			error : function(){
				alert("통신 실패");
			}				
		});
	}
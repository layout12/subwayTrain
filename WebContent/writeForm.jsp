<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<script src="resources/menu.js"></script>
<script type="text/javascript">
$(function(){
	$("#user").hide();
	$("#admin").hide();
	
	if(!${empty MySession}){
		var role = '${MySession.role}' + "1";
		if(role == "ADMIN1"){
			$("#def").hide();
			$("#admin").show();
		} else if(role == "USER1"){
			$("#user").show();
			$("#def").hide();
		}
	} else {
		alert("잘못된 접근입니다");
		location.href = "index.jsp";
	}
	
	$("#jForm").submit(function(){
		if(id != $("#id").val()){
    		alert("ID 체크를 해주세요");
    		return false;
    	}
	})
})
    
</script>
<link href="resources/member.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="resources/menu.css" />
<style type="text/css">
	.btnBase01{
		padding:6px 13px;
		border:none;
		cursor:pointer;
		background-color: #5474C0;
		color:#fff;
		font-size:15px;
		text-align: center;
		text-decoration: none;
	}
	
	article{
		width: 900px;
		margin: auto;
		border: 1px solid white;
		border-radius: 20px 20px 20px 20px;
		background-color: white;
		padding: 10px;
	}
	
	td{
		text-align: center;
	}
	
	th{
		font-size: 25px;
		color: #515151;
		padding-right: 20px;
	}
	
	tr {
		height: 50px;
	}
	
	#title{
		color: #5474C0;
		font-size: 40px;
		margin: 0px;
		text-indent: 15px;
	}

	#memberWrap1{
		position: absolute;	
		top: 180px;
		left: 700px;
		display: none;
	}
	
	#memberWrap2{
		position: absolute;
		top: 180px;
		left: 700px;
		display: none;
	}
	
	/* 로그인 커서 */
	 a:hover{
		text-decoration: underline; 
		cursor: pointer;	
	}	
</style>
</head>
<body style="background-color: #5474C0;">
	
	<article>
		<h1 id="title">글쓰기</h1>
		<hr>
		<form action="metroCon.do" method="post">
		<input type="hidden" name="command" value="writeAfter">
		<input type="hidden" name="role" value="${MySession.role }">
		<input type="hidden" name="id" value="${MySession.id }">
		<input type="hidden" name="nickname" value="${MySession.nickname }">
			<table style="margin: auto;">
				<col width="100px;">
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" style="width: 720px; height: 25px"></td>
				</tr>
				<tr>
					<th style="vertical-align: top;">내용</th>
					<td style="padding-top: 7px;"><textarea rows="20" cols="100" name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="작성" class="btnBase01" style="margin-right: 30px;">
					<input type="button" value="취소" class="btnBase01" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</article>
	
		<div id="menu">
		<p id="meneButton"><button onclick="hide()" id="bX" class="menuButton"><img alt="×" src="img/buttonX.png"></button></p>
		<a href="index.jsp">Index</a><br>
		<a href="main.jsp">Main</a><br>
		<a href="siteInfo.jsp">사이트 소개</a><br>
		<a href="metroCon.do?command=noticeList&role=ADMIN&rowNo=1">공지사항</a><br>
		<a href="metroCon.do?command=noticeList&role=USER&rowNo=1">커뮤니티</a><br>
		    	<p id="def">
					<a onclick="loginForm();" id="btn">로그인</a><br>
					<a onclick="registerForm();" id="btnR">회원가입</a>
				</p>
				
				<p id="admin">
					<a href="metroCon.do?command=userTable&pageNumber=1&rowSize=10">회원 열람</a><br>
					<a href="metroCon.do?command=logout">로그아웃</a>
				</p>
				
       			<p id="user">
       			<a href="metroCon.do?command=userInfo&id=${MySession.id }">내 정보</a><br>
       			<a href="metroCon.do?command=logout">로그아웃</a>
       			</p>       				     		
	</div>
	
	<button onclick="show()" style="float: right" id="b" class="menuButton"><img alt="Menu" src="img/button.png"></button>	
	
	<footer>
		<a href="http://www.seoul.go.kr/main/index.html">서울시청</a>
		<a href="http://www.seoulmetro.co.kr/">서울메트로</a>
		<a href="siteMap.html">사이트맵</a>
		Copyright © Taekdo-Eopjo. All rights reserved.
	</footer>
	
		<!-- -로그인 창 -->
	<form action="metroCon.do" method="post">
		<div id="memberWrap1">
		
		<input  type="hidden" name="command" value="login">
		<h1>택도없조에 오신 것을 환영합니다.</h1>
		<div class="loginForm">			
				<ul>
					<li><input name="id" type="text" maxlength="20" placeholder="id를 입력하세요"></li>
					<li><input name="password" type="password" maxlength="20" placeholder="비밀번호를 입력하세요" style="color: red"></li>					
				</ul>				
				<button type="submit" class="btnBase03">로그인하기</button>			
		</div>
		<span><a onclick="notLogin()" ><img src="img/x_close.png" alt="닫기"></a></span>	 
		</div>
	</form>
	<!--// -로그인 창 -->	
	
	
	<!-- 회원가입 창 -->	
	<form action="metroCon.do" method="post">
	<input  type="hidden" name="command" value="register">	
		<div id="memberWrap2">		
			<h1>택도없조에 오신 것을 환영합니다.</h1>
			<div class="joinForm">	
					<ul>
						<li><input id="id" name="id" type="text" maxlength="20" placeholder="id를 입력하세요" required="required"></li>						
						<li id="idChk" class="idText"></li>
						<li><input name="password" type="password" maxlength="30" placeholder="비밀번호를 입력하세요"required="required" style="color: red"></li>	
						<li><input name="name" type="text" maxlength="20" placeholder="이름을 입력하세요"required="required"></li>
						<li><input name="nickName" type="text" maxlength="20" placeholder="닉네임을 입력하세요"required="required"></li>	
						<li><input name="phone" type="text" maxlength="20" placeholder="전화번호를 입력하세요"required="required"></li>
						<li><input name="email" type="text" maxlength="20" placeholder="이메일을 입력하세요"required="required"></li>			
					</ul>
										
				<span class="btnBase04" onclick="idchk();" >중복체크</span>
				<button id="register" type="submit" class="btnBase03" disabled="disabled">회원가입하기</button>							
			</div>
			<span><a onclick="notRegister()"><img src="img/x_close.png" alt="닫기"></a></span>
		</div>
	</form>	

	<!--// 회원가입 창 -->
	
</body>
</html>
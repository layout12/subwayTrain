<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%
response.setHeader("Cache-control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/menu.css" type="text/css" rel="stylesheet" />
<link href="resources/notice.css" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
<title>글 수정</title>
<style type="text/css">
	
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
<body>
	<div id="wrap">		
		<h1 class="titList">글 수정</h1>
		
		<!--공지사항 테이블  -->
		<form action="metroCon.do?command=writeUpdateAfter" method="post">
		<input type="hidden" name="writeNo" value="${dto.writeNo }">
		<input type="hidden" name="rowNo" value="${param.rowNo }">
		<div id="tbWrap">
		
			<table>				
				<colgroup>
					<col width="55%">
					<col width="10%">
					<col width="15%">
					<col width="20%">
				</colgroup>				
				<thead>
					<tr>
						<th colspan="4" class="dtlTit">
							<input type="text" value="${dto.title }" name="title" style="width: 720px; height: 25px">
						</th>
					</tr>
					<tr class="dtlTit2">
						<th>&nbsp;</th>
						<th>글번호 : ${dto.writeNo }</th>
						<th>글쓴이 : ${dto.nickname }</th>
						<th>작성날짜 : <fmt:formatDate value="${dto.regDate }" pattern="yyyy.MM.dd" /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4">
							<p class="dtlCon" style="line-height: 20px;">
								<textarea name="content" rows="30" cols="5" style="border:1px solid #ccc">${dto.content }</textarea>
							</p>
						</td>
					</tr>
					
				</tbody>
			</table>
		</div>
		<ul class="dtlBtns">			
			<li><button class="btnBase01" type="submit">수정완료</button></li>
			<li><button class="btnBase02" type="button" onclick="history.back();">수정취소</button></li>
		</ul>
		<!--공지사항 테이블  -->
		</form>
	</div>
	
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

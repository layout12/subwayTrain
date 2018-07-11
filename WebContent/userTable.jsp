<%@page import="metro.dto.mDto"%>
<%@page import="java.util.List"%>
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
<!DOCTYPE html>
<html>
<head>
	<%
		mDto MySession = (mDto)session.getAttribute("MySession");
		
		List<mDto> userList = (List<mDto>)request.getAttribute("userList");

		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		int rowSize = Integer.parseInt(request.getParameter("rowSize"));
		int getRow = Integer.parseInt(request.getParameter("getRow"));
		int pageSize;
		
		
		if(getRow < rowSize && getRow != 0){
			pageSize = 1;
		}else if(getRow % rowSize == 0){
			pageSize = getRow / rowSize;
		}else{
			pageSize = getRow / rowSize + 1;
	}
		String role = "";
		String enabled = "";
	%>

	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/menu.css" type="text/css" rel="stylesheet" />
<link href="resources/member.css" type="text/css" rel="stylesheet" />
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
			
			var select = $("#rowSize").eq(0).children("option").length;
			for(var i = 0; i < select; i++){
				if($(".row").eq(i).val() == <%=rowSize %>){
					$(".row").eq(i).prop("selected","selected");
				}
			}
			
			
			
			for(var i = 0; i < $(".button").length; i++){
				if($(".button").eq(i).val() == <%=pageNumber %>){
					$(".button").eq(i).prop("disabled","disabled");
				}
			}
			
			if(<%=pageNumber %> + 3 > <%=pageSize %>){
				$("#end").hide();
			}
			
			if(<%=pageNumber %> < 4){
				$("#start").hide();
			}	
			
			
			for(var i = 0; i < <%=pageSize%>+2; i++){
				if($(".pgNum").eq(i).text() == <%=pageNumber%>){
					$(".pgNum").eq(i).attr("class","pgNumOn");
				}
			}
			
			$(".updateButton").click(function(){
			var index = $(".updateButton").index(this);
	    	var role = $(".role option:selected").eq(index).val();
	    	var enabled = $(".enabled option:selected").eq(index).val();
	    	var id = $(".id").eq(index).text();
	    	
	    	$.ajax({
	    		url:"metroCon.do?command=updateUser",
	    		data:{
	    			"role":role,
	    			"enabled":enabled,
	    			"id":id
	    		}, 
	    		success: function(data){
	    			if(data == "true"){
	    				alert("수정 완료!");
	    			}else{
	    				alert("수정 실패!");
	    			}
	    		}
	    	})
	    })
			    	
					
	});
	
	function select(){
		var rowSize = $("#rowSize option:selected").val();
		location.href="metroCon.do?command=userTable&pageNumber=1&rowSize="+rowSize;
	};
	
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
    
</script>
<title>공지사항</title>
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
	
	
	<div id="wrap">		
		<h1 class="titList">회원관리</h1>
		<!-- 검색영역 -->
		<select id="rowSize" onchange="select();">
				<option class="row" value="10">10개씩 보기</option>
				<option class="row" value="20">20개씩 보기</option>
				<option class="row" value="30">30개씩 보기</option>
			</select>
		<form action="metroCon.do">
		<input type="hidden" name="command" value="search" />
		<input type="hidden" name="pageNumber" value="1" />
		<input type="hidden" name="rowSize" value="10" />
		<div id="searchWrap">
			<select name="type" class="search">
				<option class="typeOption" value="id">아이디</option>
				<option class="typeOption" value="name">이름</option>
				<option class="typeOption" value="nickname">닉네임</option>
				<option class="typeOption" value="phone">연락처</option>
				<option class="typeOption" value="email">이메일</option>
				<option class="typeOption" value="role">등급</option>
				<option class="typeOption" value="enabled">상태</option>				
			</select>
			<ul>
				<li><input name="keyword" type="text" maxlength="100px" /></li>
				<li><button class="btnBase01" type="submit">검색</button></li>
			</ul>
		</div>
		</form>
		<!--// 검색영역 -->
		
		<!--공지사항 테이블  -->
		<div id="tbWrap">
			<table>				
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>				
				<thead>
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>등급</th>
						<th>상태</th>
						<th>변경</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${userList }" var="userList">
					<c:choose>
					<c:when test="${userList.role == 'ADMIN' }">
						<c:set var="anotherRole" value="USER"></c:set>
					</c:when>
					<c:when test="${userList.role == 'USER' }">
						<c:set var="anotherRole" value="ADMIN"></c:set>
					</c:when>
					</c:choose>
					<c:choose>
					<c:when test="${userList.enabled == 'Y' }">
						<c:set var="anotherEnabled" value="N"></c:set>
					</c:when>
					<c:when test="${userList.enabled == 'N' }">
						<c:set var="anotherEnabled" value="Y"></c:set>
					</c:when>
					</c:choose>
					<tr>
						<td class="id">${userList.id }</td>
						<td>${userList.password }</td>
						<td>${userList.name }</td>
						<td>${userList.nickname }</td>
						<td>${userList.phone }</td>
						<td>${userList.email }</td>
						<td>
						<select class="role">
							<option class="roleOption" value="${userList.role }">${userList.role }</option>
							<option class="roleOption" value="${anotherRole }">${anotherRole }</option>
						</select>
						
						</td>
						<td>
						<select class="enabled">
							<option class="enabledOption" value="${userList.enabled }">${userList.enabled }</option>
							<option class="enabledOption" value="${anotherEnabled }">${anotherEnabled }</option>
						</select>
						</td>
						<td><button class="updateButton">변경</button></td>
					</tr>
					</c:forEach>
				</tbody>
				
			</table>
		</div>
		
		<!-- 페이징 -->
		<section id="pageWrap" style="margin-bottom:150px;">
			<span class="pgNum"><a href="metroCon.do?command=userTable&pageNumber=1&rowSize=<%=rowSize %>">&lt;</a></span>
			<%
				int start = pageNumber-2;
				int last = pageNumber+2;
				
				if(start < 1){
					start = 1;
				}
				if(last > pageSize){	
					last = pageSize;
				}
				
				for(int i = start; i <= last; i++){
			%>
				<span class="pgNum"><a href="metroCon.do?command=userTable&pageNumber=<%=i %>&rowSize=<%=rowSize %>"><%=i %></a></span>
				
			<%
				}
			%>
			<span class="pgNum"><a href="metroCon.do?command=userTable&pageNumber=<%=pageSize %>&rowSize=<%=rowSize %>">&gt;</a></span>
		</section>
		
	</div>	
	
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

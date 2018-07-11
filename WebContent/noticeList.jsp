<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
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
<link href="resources/notice.css?ver=3" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/menu.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		var allRow = Number(${param.allRow});
		var row = Math.ceil(allRow/10);
		var pageNo = Number(${param.rowNo});
		
		var start = Math.floor((pageNo-1)/10)*10 + 1;
		var end = 0;
		
		if(row > start+9){
			end = start + 9;
			document.getElementById("nextPage").innerHTML = "";
			var a = document.createElement("a");
			a.setAttribute("href", "metroCon.do?command=noticeList&role=ADMIN&rowNo="+(start+10));
			a.textContent = ">";
			document.getElementById("nextPage").appendChild(a);
		} else {
			end = row;
		}
		
		if(start>10){
			document.getElementById("prePage").innerHTML = "";
			var a = document.createElement("a");
			a.setAttribute("href", "metroCon.do?command=noticeList&role=ADMIN&rowNo="+(start-10));
			a.textContent = "<";
			document.getElementById("prePage").appendChild(a);
		}
		
		for(var i=start ; i<=end ; i++){
			var span = document.createElement("SPAN");
			
			if(i == pageNo){
				span.setAttribute("class", "pgNumOn");
				span.textContent = i;
			} else {
				span.setAttribute("class", "pgNum");
				var a = document.createElement("a");
				a.setAttribute("href", "metroCon.do?command=noticeList&role=ADMIN&rowNo="+i);
				a.textContent = i;
				span.appendChild(a);
			}
			
			document.getElementById("pageButton").appendChild(span);
			
		}
		
		for(var i=0 ; i<3 ; i++){
			if($(".search:eq(0) option").eq(i).val() == "${param.where}"){
				$(".search:eq(0) option").eq(i).prop("selected", true);
			}
		}
		
		
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
		}
		
		$("#jForm").submit(function(){
			if(id != $("#id").val()){
	    		alert("ID 체크를 해주세요");
	    		return false;
	    	}
		})
		
	})
	
	function roleCheck(){
		if("${MySession}" == "" || "${MySession.role}" == "USER"){
			alert("글쓰기 권한이 없습니다.");
		} else {
			location.href = "writeForm.jsp";
		}
	}
	
	function search(){
		var role = "ADMIN";
		var where = $(".search:eq(0) option:selected").val();
		var search = $("#searchWord").val();
		
		location.href = "metroCon.do?command=writeSearch&role="+role+"&where="+where+"&search="+search+"&rowNo=1";
	}
	
</script>
<link href="resources/member.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="resources/menu.css" />
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
<title>공지사항 게시판</title>
</head>
<body>

	<div id="wrap">		
		<h1 class="titList">공지사항</h1>
		<!-- 검색영역 -->
		<div id="searchWrap">
			<select name="search" class="search">
				<option value="TITLE">제목</option>
				<option value="CONTENT">내용</option>
				<option value="NICKNAME">글쓴이</option>				
			</select>
			<ul>
				<li><input type="text" maxlength="100px" id="searchWord" value="${param.search }"/></li>
				<li><button class="btnBase01" onclick="search()">검색</button></li>
			</ul>
		</div>
		<!--// 검색영역 -->
		
		<!--공지사항 테이블  -->
		<div id="tbWrap">
			<table>				
				<colgroup>
					<col width="5%">
					<col width="65%">
					<col width="10%">
					<col width="20%">
				</colgroup>				
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list }">
							<tr><td colspan="4">작성된 글이 없습니다</td></tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="dto">
								<tr>
									<td>${dto.writeNo }</td>
									<c:choose>
										<c:when test="${dto.delCheck == 'N' }">
											<td>삭제된 글입니다</td>
										</c:when>
										<c:otherwise>
											<td><a href="metroCon.do?command=writeDetail&writeNo=${dto.writeNo }&rowNo=${param.rowNo}">${dto.title }</a></td>
										</c:otherwise>
									</c:choose>
									<td>${dto.nickname }</td>
									<td><fmt:formatDate value="${dto.regDate }" pattern="yyyy.MM.dd" /></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="btnFt">
				<button class="btnBase01" onclick="roleCheck()">글쓰기</button>
			</div>
		</div>
		<!--공지사항 테이블  -->
		<!-- 페이징 -->
		<section id="pageWrap" style="margin-bottom:150px;">
			<span class="pgNum" id="prePage">&lt;</span>
			<span id="pageButton"></span>
			<span class="pgNum" id="nextPage">&gt;</span>
		</section>
		<!--// 페이징 -->
		
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
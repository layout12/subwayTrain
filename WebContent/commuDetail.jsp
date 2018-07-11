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
<link href="resources/notice.css?ver=2" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/menu.js"></script>
<script type="text/javascript">
	
	function roleCheck(what){
		if("${MySession}" == "" || "${MySession.id}" != "${map.dto.id }"){
			alert("권한이 없습니다.");
		} else if (what == "up") {
			location.href = "metroCon.do?command=noticeUpdate&writeNo=${map.dto.writeNo }&rowNo=${param.rowNo}";
		} else if (what == "del"){
			writeDelete();
		}
	}
	
	function writeDelete(){
		var tf = confirm("정말로 삭제하시겠습니까?");
		if(tf){
			location.href = "metroCon.do?command=writeDelete&writeNo=${map.dto.writeNo }&role=USER";	
		}
	}
	
	function commentUpdate(a, id){
		if(id == "${MySession.id}"){
			a.parentNode.parentNode.parentNode.childNodes[1].style.display = "none";
			a.parentNode.parentNode.parentNode.childNodes[3].childNodes[1].style.display = "inline";
		} else {
			alert("권한이 없습니다.")
		}
	}
	
	function notUpdate(a){
		a.parentNode.parentNode.parentNode.childNodes[1].style.display = "inline";
		a.parentNode.parentNode.childNodes[1].style.display = "none";
	}
	
	function commentDelete(writeNo, commentNo, id){
		var tf = confirm("정말로 삭제하시겠습니까?");
		if(tf){
			if(id == "${MySession.id}" || "${MySession.role}" == "ADMIN"){
				location.href = "metroCon.do?command=commentDel&writeNo="+writeNo+"&commentNo="+commentNo+"&rowNo=${param.rowNo}";
			} else {
				alert("권한이 없습니다");
			}
		}
	}
	
	$(function(){
		
		$("#commentForm").submit(function(){
			
			if("${MySession}" == ""){
				alert("로그인 해주세요");
				return false;
			}
			
		})
		
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
	
</script>
<link href="resources/member.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="resources/menu.css" />
<title>커뮤니티 게시판</title>
<style type="text/css">
	.commentUpdate{
		font-size: 8px;
		color: gray;
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
<body>
	
	<div id="wrap">		
		<h1 class="titList">커뮤니티</h1>
		
		<!--공지사항 테이블  -->
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
						<th colspan="4" class="dtlTit">${map.dto.title }</th>
					</tr>
					<tr class="dtlTit2">
						<th>&nbsp;</th>
						<th>글번호 : ${map.dto.writeNo }</th>
						<th>글쓴이 : ${map.dto.nickname }</th>
						<th>작성날짜 : <fmt:formatDate value="${map.dto.regDate }" pattern="yyyy.MM.dd" /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4">
							<p class="dtlCon" style="line-height: 20px;">
								${map.dto.content }
							</p>
						</td>
					</tr>
					
				</tbody>
			</table>
		</div>
		<ul class="dtlBtns">
			<li><input type="button" value="목록" class="btnBase01" onclick="location.href='metroCon.do?command=noticeList&role=USER&rowNo=${param.rowNo}'"></li>
			<li><input type="button" class="btnBase01" onclick="roleCheck('up')" value="수정"></li>
			<li><button class="btnBase02" onclick="roleCheck('del')" type="button">삭제</button></li>
		</ul>
		<!--공지사항 테이블  -->
		
		<!-- 덧글 테이블 -->
		<div id="commWrap"style="margin-bottom:100px;">
			<table id="com">
				<colgroup>
					<col width="10%" />
					<col width="1%" />
					<col width="79%" />
					<col width="10%" />
				</colgroup>
				<c:forEach items="${map.list }" var="dto">
					<tr>
						<td class="commName">${dto.nickname }</td>
						<td class="commVline">|</td>
						<td id="u">
						<c:choose>
							<c:when test="${dto.delCheck == 'N' }">
							삭제된 덧글입니다.
							</c:when>
							<c:otherwise>
							<span class="beforeUpdate">${dto.content } &emsp;&emsp;<span class="commentUpdate"><a onclick="commentUpdate(this, '${dto.id}')">수정</a> | <a onclick="commentDelete(${dto.writeNo }, ${dto.commentNo}, '${dto.id}')">삭제</a></span></span>
							</c:otherwise>
						</c:choose>
						<form action="metroCon.do" method="post">
							<span class="afterUpdate" style="display: none;">
							<input type="text" name="content" value="${dto.content }" style="width: 500px;">
							<input type="hidden" name="command" value="commentUpdate">
							<input type="hidden" name="writeNo" value="${dto.writeNo }">
							<input type="hidden" name="commentNo" value="${dto.commentNo }">
							<input type="hidden" name="rowNo" value="${param.rowNo }">
							<input type="submit" value="수정" class="btnBase01"><input type="button" value="취소" class="btnBase01" onclick="notUpdate(this)">
						</span>
						</form>
						</td>
						<td><fmt:formatDate value="${dto.regDate }" pattern="yyyy.MM.dd" /></td>
					</tr>
				</c:forEach>						
			</table>
			<div class="commInsert">
				<form action="metroCon.do" method="get" id="commentForm">
				<input type="hidden" name="command" value="commentInsert">
				<input type="hidden" name="id" value="${MySession.id }">
				<input type="hidden" name="nickname" value="${MySession.nickname }">
				<input type="hidden" name="writeNo" value="${param.writeNo }">
				<input type="hidden" name="rowNo" value="${param.rowNo }">
				<span><textarea cols="106" rows="4" placeholder="덧글을 입력해주세요" name="content"></textarea></span>
				<button>덧글<br>작성</button>
				</form>
			</div>
			
			<!-- 페이징 -->
			<!-- <section id="pageWrap">
				<a href="#" class="commLink"><span class="pgNum">&lt;</span></a>
				<span class="pgNumOn">1</span>
				<span class="pgNum">2</span>
				<span class="pgNum">3</span>
				<a href="#" class="commLink"><span class="pgNum">&gt;</span></a>
			</section> -->
		</div>		
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
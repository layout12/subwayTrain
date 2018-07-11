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
<title>3호선</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/menu.js"></script>
<script src="resources/line.js"></script>
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
<link rel="stylesheet" type="text/css" href="resources/line.css" />
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
<body style="background-image: url(img/line3.jpg);">
	
	<section style="width: 1900px;">
	<div class="box">
		<div class="img"><img align="left" alt="도산공원" src="img/lineImg/lineThree-1.png" class="lineImg"></div>
		<div class="text">
		<h1 class="contentTitle">&nbsp;도산공원<a href="#" onclick="shortestDView('압구정'); return false;"><img alt="지하철" src="img/trainIcon.png" class="titleImg"></a></h1>
		<hr class="boxHr">
			<p class="lineContent">
			압구정역 3번 출구에서 약 500m 도보로 가면 도산공원이 위치해 있습니다.<br/>
			1973년 도산 안창호의 애국정신과 교육정신을 기리고자 공원으로 조성하였고, 안창호와 부인 이혜련 여사의 묘소, 동상, 기념관, 말씀비, 체육시설 등이 있습니다. <br/>
			연중무휴 24시간 무료로 문을 열고, 매년 3월 10일 흥사단과 도산기념사업회 주관으로 추모기념행사가 열립니다.<br/>
			</p>
		</div>
			
	</div>
	
	<div class="box">
		<div class="img"><img align="right" alt="경복궁" src="img/lineImg/lineThree-2.png" class="lineImg"></div>
		<div class="text">
			<h1 class="contentTitle">&nbsp;&nbsp;&nbsp;경복궁<a href="#" onclick="shortestDView('경복궁'); return false;"><img alt="지하철" src="img/trainIcon.png" class="titleImg"></a></h1>
		<hr class="boxHr">
			<p class="lineContent" style="padding-left: 15px;">
			경복궁은 대한민국 서울 세종로에 있는 조선 왕조의 법궁(法宮, 정궁)입니다. <br/>
			각종 즉위식을 거행했던 근정전, 그 옆에 근정전의 옆에 위치한 경회루는 1만원권 구화폐 실릴 만큼 대표적인 건축물입니다.
			이외에도 일제강점기에 훼손을 겪었다가 2010년에 완전히 복원된 광화문, 고종과 명성황후가 머물던 건천궁, 경복궁의 후원인 향원정 등이 자리하고 있습니다. <br/>
			경복궁은 경복궁역 5번출구로 나오면 경복궁과 연결된 통로가 있어 접근성이 편리합니다. <br/>
			</p>
		</div>
	</div>
	
	<div class="box">
		<div class="img"><img align="left" alt="반짝반짝 빛나는" src="img/lineImg/lineThree-3.png" class="lineImg"></div>
		<div class="text">
		<h1 class="contentTitle">&nbsp;반짝반짝 빛나는<a href="#" onclick="shortestDView('안국'); return false;"><img alt="지하철" src="img/trainIcon.png" class="titleImg"></a></h1>
		<hr class="boxHr">
			<p class="lineContent">
			안국역 인사동 거리에 가면 많은 찻집이 있습니다. <br/>
			그 중 정성들여 끓여낸 천연무색소 전통차와 건강한 재료로 만든 스무디 구인인절미가 유명한 '반짝반짝빛나는' 찻집은 인사동에 손꼽히는 찻집중에 하나입니다.
			</p>
		</div>
	</div>
	
	</section>
	
	<div id="shortestD">
		<p style="color: #5474C0; text-align: center;">출발 <input type="text" readonly="readonly" id="start"> <a href="#" onclick="reverse(); return false;" style="color: #5474C0; font-weight: bolder;">↔</a> 도착 <input type="text" readonly="readonly" id="end"></p>
		<p style="text-align: center; font-weight: bold; font-size: 20px;">
		<a href="#" onclick="stationView('#1'); return false;">ㄱ</a>
		<a href="#" onclick="stationView('#2'); return false;">ㄴ</a>
		<a href="#" onclick="stationView('#3'); return false;">ㄷ</a>
		<a href="#" onclick="stationView('#4'); return false;">ㅁ</a>
		<a href="#" onclick="stationView('#5'); return false;">ㅂ</a>
		<a href="#" onclick="stationView('#6'); return false;">ㅅ</a>
		<a href="#" onclick="stationView('#7'); return false;">ㅇ</a>
		<a href="#" onclick="stationView('#8'); return false;">ㅈ</a>
		<a href="#" onclick="stationView('#9'); return false;">ㅊ</a>
		<a href="#" onclick="stationView('#10'); return false;">ㅋ</a>
		<a href="#" onclick="stationView('#11'); return false;">ㅌ</a>
		<a href="#" onclick="stationView('#12'); return false;">ㅍ</a>
		<a href="#" onclick="stationView('#13'); return false;">ㅎ</a>
		</p>
		<hr style="width: 500px;">
		<div id="result">
			<div id="1">
				<table>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('가능'); return false;">가능</a></td>
						<td class="tdC"><a href="#" onclick="startStation('가락시장'); return false;">가락시장</a></td>
						<td class="tdC"><a href="#" onclick="startStation('가산디지털단지'); return false;">가산디지털단지</a></td>
						<td class="tdC"><a href="#" onclick="startStation('가양'); return false;">가양</a></td>
						<td class="tdC"><a href="#" onclick="startStation('가재울'); return false;">가재울</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('가정'); return false;">가정</a></td>
						<td class="tdC"><a href="#" onclick="startStation('가정중앙시장'); return false;">가정중앙시장</a></td>
						<td class="tdC"><a href="#" onclick="startStation('가좌'); return false;">가좌</a></td>
						<td class="tdC"><a href="#" onclick="startStation('가천대'); return false;">가천대</a></td>
						<td class="tdC"><a href="#" onclick="startStation('가평'); return false;">가평</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('간석'); return false;">간석</a></td>
						<td class="tdC"><a href="#" onclick="startStation('간석오거리'); return false;">간석오거리</a></td>
						<td class="tdC"><a href="#" onclick="startStation('갈매'); return false;">갈매</a></td>
						<td class="tdC"><a href="#" onclick="startStation('갈산'); return false;">갈산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('강남'); return false;">강남</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('강남구청'); return false;">강남구청</a></td>
						<td class="tdC"><a href="#" onclick="startStation('강남대'); return false;">강남대</a></td>
						<td class="tdC"><a href="#" onclick="startStation('강동'); return false;">강동</a></td>
						<td class="tdC"><a href="#" onclick="startStation('강동구청'); return false;">강동구청</a></td>
						<td class="tdC"><a href="#" onclick="startStation('강매'); return false;">강매</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('강변'); return false;">강변</a></td>
						<td class="tdC"><a href="#" onclick="startStation('강촌'); return false;">강촌</a></td>
						<td class="tdC"><a href="#" onclick="startStation('개롱'); return false;">개롱</a></td>
						<td class="tdC"><a href="#" onclick="startStation('개봉'); return false;">개봉</a></td>
						<td class="tdC"><a href="#" onclick="startStation('개포동'); return false;">개포동</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('개화'); return false;">개화</a></td>
						<td class="tdC"><a href="#" onclick="startStation('개화산'); return false;">개화산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('거여'); return false;">거여</a></td>
						<td class="tdC"><a href="#" onclick="startStation('건대입구'); return false;">건대입구</a></td>
						<td class="tdC"><a href="#" onclick="startStation('검단사거리'); return false;">검단사거리</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('검단오류'); return false;">검단오류</a></td>
						<td class="tdC"><a href="#" onclick="startStation('검바위'); return false;">검바위</a></td>
						<td class="tdC"><a href="#" onclick="startStation('검암'); return false;">검암</a></td>
						<td class="tdC"><a href="#" onclick="startStation('경기광주'); return false;">경기광주</a></td>
						<td class="tdC"><a href="#" onclick="startStation('경기도청북부청사'); return false;">경기도청북부청사</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('경마공원'); return false;">경마공원</a></td>
						<td class="tdC"><a href="#" onclick="startStation('경복궁'); return false;">경복궁</a></td>
						<td class="tdC"><a href="#" onclick="startStation('경인교대입구'); return false;">경인교대입구</a></td>
						<td class="tdC"><a href="#" onclick="startStation('경전철의정부'); return false;">경전철의정부</a></td>
						<td class="tdC"><a href="#" onclick="startStation('경찰공원'); return false;">경찰공원</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('계산'); return false;">계산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('계양'); return false;">계양</a></td>
						<td class="tdC"><a href="#" onclick="startStation('고덕'); return false;">고덕</a></td>
						<td class="tdC"><a href="#" onclick="startStation('고려대'); return false;">고려대</a></td>
						<td class="tdC"><a href="#" onclick="startStation('고속터미널'); return false;">고속터미널</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('고잔'); return false;">고잔</a></td>
						<td class="tdC"><a href="#" onclick="startStation('고진'); return false;">고진</a></td>
						<td class="tdC"><a href="#" onclick="startStation('곡산'); return false;">곡산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('곤제'); return false;">곤제</a></td>
						<td class="tdC"><a href="#" onclick="startStation('곤지암'); return false;">곤지암</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('공덕'); return false;">공덕</a></td>
						<td class="tdC"><a href="#" onclick="startStation('공릉'); return false;">공릉</a></td>
						<td class="tdC"><a href="#" onclick="startStation('공항시장'); return false;">공항시장</a></td>
						<td class="tdC"><a href="#" onclick="startStation('공항화물청사'); return false;">공항화물청사</a></td>
						<td class="tdC"><a href="#" onclick="startStation('과천'); return false;">과천</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('관악'); return false;">관악</a></td>
						<td class="tdC"><a href="#" onclick="startStation('광교'); return false;">광교</a></td>
						<td class="tdC"><a href="#" onclick="startStation('광교중앙'); return false;">광교중앙</a></td>
						<td class="tdC"><a href="#" onclick="startStation('광나루'); return false;">광나루</a></td>
						<td class="tdC"><a href="#" onclick="startStation('광명'); return false;">광명</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('광명사거리'); return false;">광명사거리</a></td>
						<td class="tdC"><a href="#" onclick="startStation('광운대'); return false;">광운대</a></td>
						<td class="tdC"><a href="#" onclick="startStation('광화문'); return false;">광화문</a></td>
						<td class="tdC"><a href="#" onclick="startStation('광흥창'); return false;">광흥창</a></td>
						<td class="tdC"><a href="#" onclick="startStation('교대'); return false;">교대</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('구로'); return false;">구로</a></td>
						<td class="tdC"><a href="#" onclick="startStation('구로디지털단지'); return false;">구로디지털단지</a></td>
						<td class="tdC"><a href="#" onclick="startStation('구룡'); return false;">구룡</a></td>
						<td class="tdC"><a href="#" onclick="startStation('구리'); return false;">구리</a></td>
						<td class="tdC"><a href="#" onclick="startStation('구반포'); return false;">구반포</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('구산'); return false;">구산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('구성'); return false;">구성</a></td>
						<td class="tdC"><a href="#" onclick="startStation('구의'); return false;">구의</a></td>
						<td class="tdC"><a href="#" onclick="startStation('구일'); return false;">구일</a></td>
						<td class="tdC"><a href="#" onclick="startStation('구파발'); return false;">구파발</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('국수'); return false;">국수</a></td>
						<td class="tdC"><a href="#" onclick="startStation('국제업무지구'); return false;">국제업무지구</a></td>
						<td class="tdC"><a href="#" onclick="startStation('국회의사당'); return false;">국회의사당</a></td>
						<td class="tdC"><a href="#" onclick="startStation('군자'); return false;">군자</a></td>
						<td class="tdC"><a href="#" onclick="startStation('군포'); return false;">군포</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('굴봉산'); return false;">굴봉산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('굴포천'); return false;">굴포천</a></td>
						<td class="tdC"><a href="#" onclick="startStation('굽은다리'); return false;">굽은다리</a></td>
						<td class="tdC"><a href="#" onclick="startStation('귤현'); return false;">귤현</a></td>
						<td class="tdC"><a href="#" onclick="startStation('금곡'); return false;">금곡</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('금릉'); return false;">금릉</a></td>
						<td class="tdC"><a href="#" onclick="startStation('금정'); return false;">금정</a></td>
						<td class="tdC"><a href="#" onclick="startStation('금천구청'); return false;">금천구청</a></td>
						<td class="tdC"><a href="#" onclick="startStation('금촌'); return false;">금촌</a></td>
						<td class="tdC"><a href="#" onclick="startStation('금호'); return false;">금호</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('기흥'); return false;">기흥</a></td>
						<td class="tdC"><a href="#" onclick="startStation('길동'); return false;">길동</a></td>
						<td class="tdC"><a href="#" onclick="startStation('길음'); return false;">길음</a></td>
						<td class="tdC"><a href="#" onclick="startStation('김량장'); return false;">김량장</a></td>
						<td class="tdC"><a href="#" onclick="startStation('김유정'); return false;">김유정</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('김포공항'); return false;">김포공항</a></td>
						<td class="tdC"><a href="#" onclick="startStation('까치산'); return false;">까치산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('까치울'); return false;">까치울</a></td>
					</tr>
				</table>
			</div>
			
			<div id="2">
				<table>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('낙성대'); return false;">낙성대</a></td>
						<td class="tdC"><a href="#" onclick="startStation('남구로'); return false;">남구로</a></td>
						<td class="tdC"><a href="#" onclick="startStation('남동구청'); return false;">남동구청</a></td>
						<td class="tdC"><a href="#" onclick="startStation('남동인더스파크'); return false;">남동인더스파크</a></td>
						<td class="tdC"><a href="#" onclick="startStation('남부터미널'); return false;">남부터미널</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('남성'); return false;">남성</a></td>
						<td class="tdC"><a href="#" onclick="startStation('남영'); return false;">남영</a></td>
						<td class="tdC"><a href="#" onclick="startStation('남춘천'); return false;">남춘천</a></td>
						<td class="tdC"><a href="#" onclick="startStation('남태령'); return false;">남태령</a></td>
						<td class="tdC"><a href="#" onclick="startStation('남한산성입구'); return false;">남한산성입구</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('내방'); return false;">내방</a></td>
						<td class="tdC"><a href="#" onclick="startStation('노들'); return false;">노들</a></td>
						<td class="tdC"><a href="#" onclick="startStation('노량진'); return false;">노량진</a></td>
						<td class="tdC"><a href="#" onclick="startStation('노원'); return false;">노원</a></td>
						<td class="tdC"><a href="#" onclick="startStation('녹번'); return false;">녹번</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('녹사평'); return false;">녹사평</a></td>
						<td class="tdC"><a href="#" onclick="startStation('녹양'); return false;">녹양</a></td>
						<td class="tdC"><a href="#" onclick="startStation('녹천'); return false;">녹천</a></td>
						<td class="tdC"><a href="#" onclick="startStation('논현'); return false;">논현</a></td>
						<td class="tdC"><a href="#" onclick="startStation('능곡'); return false;">능곡</a></td>
					</tr>
				</table>
			</div>
			
			<div id="3">
				<table>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('단대오거리'); return false;">단대오거리</a></td>
						<td class="tdC"><a href="#" onclick="startStation('달월'); return false;">달월</a></td>
						<td class="tdC"><a href="#" onclick="startStation('답십리'); return false;">답십리</a></td>
						<td class="tdC"><a href="#" onclick="startStation('당고개'); return false;">당고개</a></td>
						<td class="tdC"><a href="#" onclick="startStation('당산'); return false;">당산</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('당정'); return false;">당정</a></td>
						<td class="tdC"><a href="#" onclick="startStation('대곡'); return false;">대곡</a></td>
						<td class="tdC"><a href="#" onclick="startStation('대공원'); return false;">대공원</a></td>
						<td class="tdC"><a href="#" onclick="startStation('대림'); return false;">대림</a></td>
						<td class="tdC"><a href="#" onclick="startStation('대모산입구'); return false;">대모산입구</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('대방'); return false;">대방</a></td>
						<td class="tdC"><a href="#" onclick="startStation('대성리'); return false;">대성리</a></td>
						<td class="tdC"><a href="#" onclick="startStation('대야미'); return false;">대야미</a></td>
						<td class="tdC"><a href="#" onclick="startStation('대청'); return false;">대청</a></td>
						<td class="tdC"><a href="#" onclick="startStation('대치'); return false;">대치</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('대화'); return false;">대화</a></td>
						<td class="tdC"><a href="#" onclick="startStation('대흥'); return false;">대흥</a></td>
						<td class="tdC"><a href="#" onclick="startStation('덕계'); return false;">덕계</a></td>
						<td class="tdC"><a href="#" onclick="startStation('덕소'); return false;">덕소</a></td>
						<td class="tdC"><a href="#" onclick="startStation('덕정'); return false;">덕정</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('도곡'); return false;">도곡</a></td>
						<td class="tdC"><a href="#" onclick="startStation('도농'); return false;">도농</a></td>
						<td class="tdC"><a href="#" onclick="startStation('도림천'); return false;">도림천</a></td>
						<td class="tdC"><a href="#" onclick="startStation('도봉'); return false;">도봉</a></td>
						<td class="tdC"><a href="#" onclick="startStation('도봉산'); return false;">도봉산</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('도심'); return false;">도심</a></td>
						<td class="tdC"><a href="#" onclick="startStation('도원'); return false;">도원</a></td>
						<td class="tdC"><a href="#" onclick="startStation('도화'); return false;">도화</a></td>
						<td class="tdC"><a href="#" onclick="startStation('독립문'); return false;">독립문</a></td>
						<td class="tdC"><a href="#" onclick="startStation('독바위'); return false;">독바위</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('독산'); return false;">독산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('독정'); return false;">독정</a></td>
						<td class="tdC"><a href="#" onclick="startStation('돌곶이'); return false;">돌곶이</a></td>
						<td class="tdC"><a href="#" onclick="startStation('동대문'); return false;">동대문</a></td>
						<td class="tdC"><a href="#" onclick="startStation('동대문역사문화공원'); return false;">동대문역사문화공원</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('동대입구'); return false;">동대입구</a></td>
						<td class="tdC"><a href="#" onclick="startStation('동두천'); return false;">동두천</a></td>
						<td class="tdC"><a href="#" onclick="startStation('동두천중앙'); return false;">동두천중앙</a></td>
						<td class="tdC"><a href="#" onclick="startStation('동막'); return false;">동막</a></td>
						<td class="tdC"><a href="#" onclick="startStation('동묘앞'); return false;">동묘앞</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('동백'); return false;">동백</a></td>
						<td class="tdC"><a href="#" onclick="startStation('동수'); return false;">동수</a></td>
						<td class="tdC"><a href="#" onclick="startStation('동암'); return false;">동암</a></td>
						<td class="tdC"><a href="#" onclick="startStation('동오'); return false;">동오</a></td>
						<td class="tdC"><a href="#" onclick="startStation('동인천'); return false;">동인천</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('동작'); return false;">동작</a></td>
						<td class="tdC"><a href="#" onclick="startStation('동천'); return false;">동천</a></td>
						<td class="tdC"><a href="#" onclick="startStation('동춘'); return false;">동춘</a></td>
						<td class="tdC"><a href="#" onclick="startStation('두정'); return false;">두정</a></td>
						<td class="tdC"><a href="#" onclick="startStation('둥전'); return false;">둥전</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('둔촌동'); return false;">둔촌동</a></td>
						<td class="tdC"><a href="#" onclick="startStation('등촌'); return false;">등촌</a></td>
						<td class="tdC"><a href="#" onclick="startStation('디지털미디어시티'); return false;">디지털미디어시티</a></td>
						<td class="tdC"><a href="#" onclick="startStation('뚝섬'); return false;">뚝섬</a></td>
						<td class="tdC"><a href="#" onclick="startStation('뚝섬유원지'); return false;">뚝섬유원지</a></td>
					</tr>
				</table>
			</div>
			<div id="4">
				<table>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('마곡'); return false;">마곡</a></td>
						<td class="tdC"><a href="#" onclick="startStation('마곡나루'); return false;">마곡나루</a></td>
						<td class="tdC"><a href="#" onclick="startStation('마두'); return false;">마두</a></td>
						<td class="tdC"><a href="#" onclick="startStation('마들'); return false;">마들</a></td>
						<td class="tdC"><a href="#" onclick="startStation('마석'); return false;">마석</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('마장'); return false;">마장</a></td>
						<td class="tdC"><a href="#" onclick="startStation('마전'); return false;">마전</a></td>
						<td class="tdC"><a href="#" onclick="startStation('마천'); return false;">마천</a></td>
						<td class="tdC"><a href="#" onclick="startStation('마포'); return false;">마포</a></td>
						<td class="tdC"><a href="#" onclick="startStation('마포구청'); return false;">마포구청</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('만수'); return false;">만수</a></td>
						<td class="tdC"><a href="#" onclick="startStation('망우'); return false;">망우</a></td>
						<td class="tdC"><a href="#" onclick="startStation('망원'); return false;">망원</a></td>
						<td class="tdC"><a href="#" onclick="startStation('망월사'); return false;">망월사</a></td>
						<td class="tdC"><a href="#" onclick="startStation('망포'); return false;">망포</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('매교'); return false;">매교</a></td>
						<td class="tdC"><a href="#" onclick="startStation('매봉'); return false;">매봉</a></td>
						<td class="tdC"><a href="#" onclick="startStation('매탄권선'); return false;">매탄권선</a></td>
						<td class="tdC"><a href="#" onclick="startStation('먹골'); return false;">먹골</a></td>
						<td class="tdC"><a href="#" onclick="startStation('면목'); return false;">면목</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('명동'); return false;">명동</a></td>
						<td class="tdC"><a href="#" onclick="startStation('명일'); return false;">명일</a></td>
						<td class="tdC"><a href="#" onclick="startStation('명지대'); return false;">명지대</a></td>
						<td class="tdC"><a href="#" onclick="startStation('명학'); return false;">명학</a></td>
						<td class="tdC"><a href="#" onclick="startStation('모란'); return false;">모란</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('모래내시장'); return false;">모래내시장</a></td>
						<td class="tdC"><a href="#" onclick="startStation('목동'); return false;">목동</a></td>
						<td class="tdC"><a href="#" onclick="startStation('몽촌토성'); return false;">몽촌토성</a></td>
						<td class="tdC"><a href="#" onclick="startStation('무악재'); return false;">무악재</a></td>
						<td class="tdC"><a href="#" onclick="startStation('문래'); return false;">문래</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('문산'); return false;">문산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('문정'); return false;">문정</a></td>
						<td class="tdC"><a href="#" onclick="startStation('문학경기장'); return false;">문학경기장</a></td>
						<td class="tdC"><a href="#" onclick="startStation('미금'); return false;">미금</a></td>
						<td class="tdC"><a href="#" onclick="startStation('미아'); return false;">미아</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('미아사거리'); return false;">미아사거리</a></td>
					</tr>
				</table>
			</div>
			
			<div id="5">
				<table>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('박촌'); return false;">박촌</a></td>
						<td class="tdC"><a href="#" onclick="startStation('반월'); return false;">반월</a></td>
						<td class="tdC"><a href="#" onclick="startStation('반포'); return false;">반포</a></td>
						<td class="tdC"><a href="#" onclick="startStation('발곡'); return false;">발곡</a></td>
						<td class="tdC"><a href="#" onclick="startStation('발산'); return false;">발산</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('방배'); return false;">방배</a></td>
						<td class="tdC"><a href="#" onclick="startStation('방이'); return false;">방이</a></td>
						<td class="tdC"><a href="#" onclick="startStation('방학'); return false;">방학</a></td>
						<td class="tdC"><a href="#" onclick="startStation('방화'); return false;">방화</a></td>
						<td class="tdC"><a href="#" onclick="startStation('배방'); return false;">배방</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('백마'); return false;">백마</a></td>
						<td class="tdC"><a href="#" onclick="startStation('백석'); return false;">백석</a></td>
						<td class="tdC"><a href="#" onclick="startStation('백양리'); return false;">백양리</a></td>
						<td class="tdC"><a href="#" onclick="startStation('백운'); return false;">백운</a></td>
						<td class="tdC"><a href="#" onclick="startStation('버티고개'); return false;">버티고개</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('범계'); return false;">범계</a></td>
						<td class="tdC"><a href="#" onclick="startStation('범골'); return false;">범골</a></td>
						<td class="tdC"><a href="#" onclick="startStation('별내'); return false;">별내</a></td>
						<td class="tdC"><a href="#" onclick="startStation('병점'); return false;">병점</a></td>
						<td class="tdC"><a href="#" onclick="startStation('보라매'); return false;">보라매</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('보문'); return false;">보문</a></td>
						<td class="tdC"><a href="#" onclick="startStation('보산'); return false;">보산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('보정'); return false;">보정</a></td>
						<td class="tdC"><a href="#" onclick="startStation('보평'); return false;">보평</a></td>
						<td class="tdC"><a href="#" onclick="startStation('복정'); return false;">복정</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('봉명'); return false;">봉명</a></td>
						<td class="tdC"><a href="#" onclick="startStation('봉은사'); return false;">봉은사</a></td>
						<td class="tdC"><a href="#" onclick="startStation('봉천'); return false;">봉천</a></td>
						<td class="tdC"><a href="#" onclick="startStation('봉화산'); return false;">봉화산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('부개'); return false;">부개</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('부발'); return false;">부발</a></td>
						<td class="tdC"><a href="#" onclick="startStation('부천'); return false;">부천</a></td>
						<td class="tdC"><a href="#" onclick="startStation('부천시청'); return false;">부천시청</a></td>
						<td class="tdC"><a href="#" onclick="startStation('부천종합운동장'); return false;">부천종합운동장</a></td>
						<td class="tdC"><a href="#" onclick="startStation('부평'); return false;">부평</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('부평구청'); return false;">부평구청</a></td>
						<td class="tdC"><a href="#" onclick="startStation('부평삼거리'); return false;">부평삼거리</a></td>
						<td class="tdC"><a href="#" onclick="startStation('부평시장'); return false;">부평시장</a></td>
						<td class="tdC"><a href="#" onclick="startStation('불광'); return false;">불광</a></td>
						<td></td>
					</tr>
				</table>
			</div>
			
			<div id="6">
				<table>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('사가정'); return false;">사가정</a></td>
						<td class="tdC"><a href="#" onclick="startStation('사당'); return false;">사당</a></td>
						<td class="tdC"><a href="#" onclick="startStation('사릉'); return false;">사릉</a></td>
						<td class="tdC"><a href="#" onclick="startStation('사평'); return false;">사평</a></td>
						<td class="tdC"><a href="#" onclick="startStation('산본'); return false;">산본</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('산성'); return false;">산성</a></td>
						<td class="tdC"><a href="#" onclick="startStation('삼가'); return false;">삼가</a></td>
						<td class="tdC"><a href="#" onclick="startStation('삼각지'); return false;">삼각지</a></td>
						<td class="tdC"><a href="#" onclick="startStation('삼동'); return false;">삼동</a></td>
						<td class="tdC"><a href="#" onclick="startStation('삼산체육관'); return false;">삼산체육관</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('삼성'); return false;">삼성</a></td>
						<td class="tdC"><a href="#" onclick="startStation('삼성중앙'); return false;">삼성중앙</a></td>
						<td class="tdC"><a href="#" onclick="startStation('삼송'); return false;">삼송</a></td>
						<td class="tdC"><a href="#" onclick="startStation('상갈'); return false;">상갈</a></td>
						<td class="tdC"><a href="#" onclick="startStation('상계'); return false;">상계</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('상도'); return false;">상도</a></td>
						<td class="tdC"><a href="#" onclick="startStation('상동'); return false;">상동</a></td>
						<td class="tdC"><a href="#" onclick="startStation('상록수'); return false;">상록수</a></td>
						<td class="tdC"><a href="#" onclick="startStation('상봉'); return false;">상봉</a></td>
						<td class="tdC"><a href="#" onclick="startStation('상수'); return false;">상수</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('상왕십리'); return false;">상왕십리</a></td>
						<td class="tdC"><a href="#" onclick="startStation('상월곡'); return false;">상월곡</a></td>
						<td class="tdC"><a href="#" onclick="startStation('상일동'); return false;">상일동</a></td>
						<td class="tdC"><a href="#" onclick="startStation('상천'); return false;">상천</a></td>
						<td class="tdC"><a href="#" onclick="startStation('상현'); return false;">상현</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('새말'); return false;">새말</a></td>
						<td class="tdC"><a href="#" onclick="startStation('새절'); return false;">새절</a></td>
						<td class="tdC"><a href="#" onclick="startStation('샛강'); return false;">샛강</a></td>
						<td class="tdC"><a href="#" onclick="startStation('서강대'); return false;">서강대</a></td>
						<td class="tdC"><a href="#" onclick="startStation('서구청'); return false;">서구청</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('서대문'); return false;">서대문</a></td>
						<td class="tdC"><a href="#" onclick="startStation('서동탄'); return false;">서동탄</a></td>
						<td class="tdC"><a href="#" onclick="startStation('서부여성회관'); return false;">서부여성회관</a></td>
						<td class="tdC"><a href="#" onclick="startStation('서빙고'); return false;">서빙고</a></td>
						<td class="tdC"><a href="#" onclick="startStation('서울대입구'); return false;">서울대입구</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('서울숲'); return false;">서울숲</a></td>
						<td class="tdC"><a href="#" onclick="startStation('서울역'); return false;">서울역</a></td>
						<td class="tdC"><a href="#" onclick="startStation('서정리'); return false;">서정리</a></td>
						<td class="tdC"><a href="#" onclick="startStation('서초'); return false;">서초</a></td>
						<td class="tdC"><a href="#" onclick="startStation('서현'); return false;">서현</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('석계'); return false;">석계</a></td>
						<td class="tdC"><a href="#" onclick="startStation('석남'); return false;">석남</a></td>
						<td class="tdC"><a href="#" onclick="startStation('석바위시장'); return false;">석바위시장</a></td>
						<td class="tdC"><a href="#" onclick="startStation('석수'); return false;">석수</a></td>
						<td class="tdC"><a href="#" onclick="startStation('석천사거리'); return false;">석천사거리</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('석촌'); return false;">석촌</a></td>
						<td class="tdC"><a href="#" onclick="startStation('선릉'); return false;">선릉</a></td>
						<td class="tdC"><a href="#" onclick="startStation('선바위'); return false;">선바위</a></td>
						<td class="tdC"><a href="#" onclick="startStation('선유도'); return false;">선유도</a></td>
						<td class="tdC"><a href="#" onclick="startStation('선정릉'); return false;">선정릉</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('선학'); return false;">선학</a></td>
						<td class="tdC"><a href="#" onclick="startStation('성균관대'); return false;">성균관대</a></td>
						<td class="tdC"><a href="#" onclick="startStation('성복'); return false;">성복</a></td>
						<td class="tdC"><a href="#" onclick="startStation('성수'); return false;">성수</a></td>
						<td class="tdC"><a href="#" onclick="startStation('성신여대입구'); return false;">성신여대입구</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('성환'); return false;">성환</a></td>
						<td class="tdC"><a href="#" onclick="startStation('세류'); return false;">세류</a></td>
						<td class="tdC"><a href="#" onclick="startStation('세마'); return false;">세마</a></td>
						<td class="tdC"><a href="#" onclick="startStation('세종대왕릉'); return false;">세종대왕릉</a></td>
						<td class="tdC"><a href="#" onclick="startStation('센트럴파크'); return false;">센트럴파크</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('소래포구'); return false;">소래포구</a></td>
						<td class="tdC"><a href="#" onclick="startStation('소사'); return false;">소사</a></td>
						<td class="tdC"><a href="#" onclick="startStation('소요산'); return false;">소요산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('송내'); return false;">송내</a></td>
						<td class="tdC"><a href="#" onclick="startStation('송도'); return false;">송도</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('송산'); return false;">송산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('송정'); return false;">송정</a></td>
						<td class="tdC"><a href="#" onclick="startStation('송탄'); return false;">송탄</a></td>
						<td class="tdC"><a href="#" onclick="startStation('송파'); return false;">송파</a></td>
						<td class="tdC"><a href="#" onclick="startStation('수내'); return false;">수내</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('수락산'); return false;">수락산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('수리산'); return false;">수리산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('수색'); return false;">수색</a></td>
						<td class="tdC"><a href="#" onclick="startStation('수서'); return false;">수서</a></td>
						<td class="tdC"><a href="#" onclick="startStation('수원'); return false;">수원</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('수원시청'); return false;">수원시청</a></td>
						<td class="tdC"><a href="#" onclick="startStation('수유'); return false;">수유</a></td>
						<td class="tdC"><a href="#" onclick="startStation('수지구청'); return false;">수지구청</a></td>
						<td class="tdC"><a href="#" onclick="startStation('수진'); return false;">수진</a></td>
						<td class="tdC"><a href="#" onclick="startStation('숙대입구'); return false;">숙대입구</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('숭실대입구'); return false;">숭실대입구</a></td>
						<td class="tdC"><a href="#" onclick="startStation('숭의'); return false;">숭의</a></td>
						<td class="tdC"><a href="#" onclick="startStation('시민공원'); return false;">시민공원</a></td>
						<td class="tdC"><a href="#" onclick="startStation('시청'); return false;">시청</a></td>
						<td class="tdC"><a href="#" onclick="startStation('시청·용인대'); return false;">시청·용인대</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('신갈'); return false;">신갈</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신금호'); return false;">신금호</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신길'); return false;">신길</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신길온천'); return false;">신길온천</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신내'); return false;">신내</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('신논현'); return false;">신논현</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신답'); return false;">신답</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신당'); return false;">신당</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신대방'); return false;">신대방</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신대방삼거리'); return false;">신대방삼거리</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('신도림'); return false;">신도림</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신둔도예촌'); return false;">신둔도예촌</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신림'); return false;">신림</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신목동'); return false;">신목동</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신반포'); return false;">신반포</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('신방화'); return false;">신방화</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신사'); return false;">신사</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신설동'); return false;">신설동</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신연수'); return false;">신연수</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신용산'); return false;">신용산</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('신원'); return false;">신원</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신이문'); return false;">신이문</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신정'); return false;">신정</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신정네거리'); return false;">신정네거리</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신중동'); return false;">신중동</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('신창'); return false;">신창</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신촌'); return false;">신촌</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신포'); return false;">신포</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신풍'); return false;">신풍</a></td>
						<td class="tdC"><a href="#" onclick="startStation('신흥'); return false;">신흥</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('쌍문'); return false;">쌍문</a></td>
						<td class="tdC"><a href="#" onclick="startStation('쌍용'); return false;">쌍용</a></td>
						<td></td><td></td><td></td>
					</tr>
				</table>
			</div>
			
			<div id="7">
				<table>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('아산'); return false;">아산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('아시아드경기장'); return false;">아시아드경기장</a></td>
						<td class="tdC"><a href="#" onclick="startStation('아신'); return false;">아신</a></td>
						<td class="tdC"><a href="#" onclick="startStation('아차산'); return false;">아차산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('아현'); return false;">아현</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('안국'); return false;">안국</a></td>
						<td class="tdC"><a href="#" onclick="startStation('안산'); return false;">안산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('안암'); return false;">안암</a></td>
						<td class="tdC"><a href="#" onclick="startStation('안양'); return false;">안양</a></td>
						<td class="tdC"><a href="#" onclick="startStation('암사'); return false;">암사</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('압구정'); return false;">압구정</a></td>
						<td class="tdC"><a href="#" onclick="startStation('압구정로데오'); return false;">압구정로데오</a></td>
						<td class="tdC"><a href="#" onclick="startStation('애오개'); return false;">애오개</a></td>
						<td class="tdC"><a href="#" onclick="startStation('야당'); return false;">야당</a></td>
						<td class="tdC"><a href="#" onclick="startStation('야탑'); return false;">야탑</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('약수'); return false;">약수</a></td>
						<td class="tdC"><a href="#" onclick="startStation('양수'); return false;">양수</a></td>
						<td class="tdC"><a href="#" onclick="startStation('양원'); return false;">양원</a></td>
						<td class="tdC"><a href="#" onclick="startStation('양재'); return false;">양재</a></td>
						<td class="tdC"><a href="#" onclick="startStation('양재시민의숲'); return false;">양재시민의숲</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('양정'); return false;">양정</a></td>
						<td class="tdC"><a href="#" onclick="startStation('양주'); return false;">양주</a></td>
						<td class="tdC"><a href="#" onclick="startStation('양천구청'); return false;">양천구청</a></td>
						<td class="tdC"><a href="#" onclick="startStation('양천향교'); return false;">양천향교</a></td>
						<td class="tdC"><a href="#" onclick="startStation('양평'); return false;">양평</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('어룡'); return false;">어룡</a></td>
						<td class="tdC"><a href="#" onclick="startStation('어린이대공원'); return false;">어린이대공원</a></td>
						<td class="tdC"><a href="#" onclick="startStation('어정'); return false;">어정</a></td>
						<td class="tdC"><a href="#" onclick="startStation('언주'); return false;">언주</a></td>
						<td class="tdC"><a href="#" onclick="startStation('여의나루'); return false;">여의나루</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('여의도'); return false;">여의도</a></td>
						<td class="tdC"><a href="#" onclick="startStation('여주'); return false;">여주</a></td>
						<td class="tdC"><a href="#" onclick="startStation('역곡'); return false;">역곡</a></td>
						<td class="tdC"><a href="#" onclick="startStation('역삼'); return false;">역삼</a></td>
						<td class="tdC"><a href="#" onclick="startStation('역촌'); return false;">역촌</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('연수'); return false;">연수</a></td>
						<td class="tdC"><a href="#" onclick="startStation('연신내'); return false;">연신내</a></td>
						<td class="tdC"><a href="#" onclick="startStation('염창'); return false;">염창</a></td>
						<td class="tdC"><a href="#" onclick="startStation('영등포'); return false;">영등포</a></td>
						<td class="tdC"><a href="#" onclick="startStation('영등포구청'); return false;">영등포구청</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('영등포시장'); return false;">영등포시장</a></td>
						<td class="tdC"><a href="#" onclick="startStation('영종'); return false;">영종</a></td>
						<td class="tdC"><a href="#" onclick="startStation('영통'); return false;">영통</a></td>
						<td class="tdC"><a href="#" onclick="startStation('예술회관'); return false;">예술회관</a></td>
						<td class="tdC"><a href="#" onclick="startStation('오금'); return false;">오금</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('오류동'); return false;">오류동</a></td>
						<td class="tdC"><a href="#" onclick="startStation('오리'); return false;">오리</a></td>
						<td class="tdC"><a href="#" onclick="startStation('오목교'); return false;">오목교</a></td>
						<td class="tdC"><a href="#" onclick="startStation('오빈'); return false;">오빈</a></td>
						<td class="tdC"><a href="#" onclick="startStation('오산'); return false;">오산</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('오산대'); return false;">오산대</a></td>
						<td class="tdC"><a href="#" onclick="startStation('오이도'); return false;">오이도</a></td>
						<td class="tdC"><a href="#" onclick="startStation('옥수'); return false;">옥수</a></td>
						<td class="tdC"><a href="#" onclick="startStation('온수'); return false;">온수</a></td>
						<td class="tdC"><a href="#" onclick="startStation('온양온천'); return false;">온양온천</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('올림픽공원'); return false;">올림픽공원</a></td>
						<td class="tdC"><a href="#" onclick="startStation('완정'); return false;">완정</a></td>
						<td class="tdC"><a href="#" onclick="startStation('왕길'); return false;">왕길</a></td>
						<td class="tdC"><a href="#" onclick="startStation('왕십리'); return false;">왕십리</a></td>
						<td class="tdC"><a href="#" onclick="startStation('외대앞'); return false;">외대앞</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('용답'); return false;">용답</a></td>
						<td class="tdC"><a href="#" onclick="startStation('용두'); return false;">용두</a></td>
						<td class="tdC"><a href="#" onclick="startStation('용마산'); return false;">용마산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('용문'); return false;">용문</a></td>
						<td class="tdC"><a href="#" onclick="startStation('용산'); return false;">용산</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('우장산'); return false;">우장산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('운길산'); return false;">운길산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('운동장·송담대'); return false;">운동장·송담대</a></td>
						<td class="tdC"><a href="#" onclick="startStation('운서'); return false;">운서</a></td>
						<td class="tdC"><a href="#" onclick="startStation('운연'); return false;">운연</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('운정'); return false;">운정</a></td>
						<td class="tdC"><a href="#" onclick="startStation('원당'); return false;">원당</a></td>
						<td class="tdC"><a href="#" onclick="startStation('원덕'); return false;">원덕</a></td>
						<td class="tdC"><a href="#" onclick="startStation('원인재'); return false;">원인재</a></td>
						<td class="tdC"><a href="#" onclick="startStation('원흥'); return false;">원흥</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('월계'); return false;">월계</a></td>
						<td class="tdC"><a href="#" onclick="startStation('월곡'); return false;">월곡</a></td>
						<td class="tdC"><a href="#" onclick="startStation('월곶'); return false;">월곶</a></td>
						<td class="tdC"><a href="#" onclick="startStation('월드컵경기장'); return false;">월드컵경기장</a></td>
						<td class="tdC"><a href="#" onclick="startStation('월롱'); return false;">월롱</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('을지로3가'); return false;">을지로3가</a></td>
						<td class="tdC"><a href="#" onclick="startStation('을지로4가'); return false;">을지로4가</a></td>
						<td class="tdC"><a href="#" onclick="startStation('을지로입구'); return false;">을지로입구</a></td>
						<td class="tdC"><a href="#" onclick="startStation('응봉'); return false;">응봉</a></td>
						<td class="tdC"><a href="#" onclick="startStation('응암'); return false;">응암</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('의왕'); return false;">의왕</a></td>
						<td class="tdC"><a href="#" onclick="startStation('의정부'); return false;">의정부</a></td>
						<td class="tdC"><a href="#" onclick="startStation('의정부시청'); return false;">의정부시청</a></td>
						<td class="tdC"><a href="#" onclick="startStation('의정부중앙'); return false;">의정부중앙</a></td>
						<td class="tdC"><a href="#" onclick="startStation('이대'); return false;">이대</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('이매'); return false;">이매</a></td>
						<td class="tdC"><a href="#" onclick="startStation('이수'); return false;">이수</a></td>
						<td class="tdC"><a href="#" onclick="startStation('이천'); return false;">이천</a></td>
						<td class="tdC"><a href="#" onclick="startStation('이촌'); return false;">이촌</a></td>
						<td class="tdC"><a href="#" onclick="startStation('이태원'); return false;">이태원</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('인덕원'); return false;">인덕원</a></td>
						<td class="tdC"><a href="#" onclick="startStation('인천'); return false;">인천</a></td>
						<td class="tdC"><a href="#" onclick="startStation('인천가좌'); return false;">인천가좌</a></td>
						<td class="tdC"><a href="#" onclick="startStation('인천국제공항'); return false;">인천국제공항</a></td>
						<td class="tdC"><a href="#" onclick="startStation('인천논현'); return false;">인천논현</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('인천대공원'); return false;">인천대공원</a></td>
						<td class="tdC"><a href="#" onclick="startStation('인천대입구'); return false;">인천대입구</a></td>
						<td class="tdC"><a href="#" onclick="startStation('인천시청'); return false;">인천시청</a></td>
						<td class="tdC"><a href="#" onclick="startStation('인천터미널'); return false;">인천터미널</a></td>
						<td class="tdC"><a href="#" onclick="startStation('인하대'); return false;">인하대</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('일산'); return false;">일산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('일원'); return false;">일원</a></td>
						<td class="tdC"><a href="#" onclick="startStation('임학'); return false;">임학</a></td>
						<td></td><td></td>
					</tr>
				</table>
			</div>

			<div id="8">
				<table>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('작전'); return false;">작전</a></td>
						<td class="tdC"><a href="#" onclick="startStation('잠실'); return false;">잠실</a></td>
						<td class="tdC"><a href="#" onclick="startStation('잠실나루'); return false;">잠실나루</a></td>
						<td class="tdC"><a href="#" onclick="startStation('잠실새내'); return false;">잠실새내</a></td>
						<td class="tdC"><a href="#" onclick="startStation('잠원'); return false;">잠원</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('장승배기'); return false;">장승배기</a></td>
						<td class="tdC"><a href="#" onclick="startStation('장암'); return false;">장암</a></td>
						<td class="tdC"><a href="#" onclick="startStation('장지'); return false;">장지</a></td>
						<td class="tdC"><a href="#" onclick="startStation('장한평'); return false;">장한평</a></td>
						<td class="tdC"><a href="#" onclick="startStation('전대·에버랜드'); return false;">전대·에버랜드</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('정발산'); return false;">정발산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('정부과천청사'); return false;">정부과천청사</a></td>
						<td class="tdC"><a href="#" onclick="startStation('정왕'); return false;">정왕</a></td>
						<td class="tdC"><a href="#" onclick="startStation('정자'); return false;">정자</a></td>
						<td class="tdC"><a href="#" onclick="startStation('제기동'); return false;">제기동</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('제물포'); return false;">제물포</a></td>
						<td class="tdC"><a href="#" onclick="startStation('종각'); return false;">종각</a></td>
						<td class="tdC"><a href="#" onclick="startStation('종로3가'); return false;">종로3가</a></td>
						<td class="tdC"><a href="#" onclick="startStation('종로5가'); return false;">종로5가</a></td>
						<td class="tdC"><a href="#" onclick="startStation('종합운동장'); return false;">종합운동장</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('주안'); return false;">주안</a></td>
						<td class="tdC"><a href="#" onclick="startStation('주안국가산단'); return false;">주안국가산단</a></td>
						<td class="tdC"><a href="#" onclick="startStation('주엽'); return false;">주엽</a></td>
						<td class="tdC"><a href="#" onclick="startStation('죽전'); return false;">죽전</a></td>
						<td class="tdC"><a href="#" onclick="startStation('중계'); return false;">중계</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('중곡'); return false;">중곡</a></td>
						<td class="tdC"><a href="#" onclick="startStation('중동'); return false;">중동</a></td>
						<td class="tdC"><a href="#" onclick="startStation('중랑'); return false;">중랑</a></td>
						<td class="tdC"><a href="#" onclick="startStation('중앙'); return false;">중앙</a></td>
						<td class="tdC"><a href="#" onclick="startStation('중화'); return false;">중화</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('증미'); return false;">증미</a></td>
						<td class="tdC"><a href="#" onclick="startStation('증산'); return false;">증산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('지적'); return false;">지적</a></td>
						<td class="tdC"><a href="#" onclick="startStation('지식정보단지'); return false;">지식정보단지</a></td>
						<td class="tdC"><a href="#" onclick="startStation('지제'); return false;">지제</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('지축'); return false;">지축</a></td>
						<td class="tdC"><a href="#" onclick="startStation('지평'); return false;">지평</a></td>
						<td class="tdC"><a href="#" onclick="startStation('지행'); return false;">지행</a></td>
						<td class="tdC"><a href="#" onclick="startStation('직산'); return false;">직산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('진위'); return false;">진위</a></td>
					</tr>
				</table>
			</div>
			
			<div id="9">
				<table>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('창동'); return false;">창동</a></td>
						<td class="tdC"><a href="#" onclick="startStation('창신'); return false;">창신</a></td>
						<td class="tdC"><a href="#" onclick="startStation('천마산'); return false;">천마산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('천안'); return false;">천안</a></td>
						<td class="tdC"><a href="#" onclick="startStation('천왕'); return false;">천왕</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('천호'); return false;">천호</a></td>
						<td class="tdC"><a href="#" onclick="startStation('철산'); return false;">철산</a></td>
						<td class="tdC"><a href="#" onclick="startStation('청계산입구'); return false;">청계산입구</a></td>
						<td class="tdC"><a href="#" onclick="startStation('청구'); return false;">청구</a></td>
						<td class="tdC"><a href="#" onclick="startStation('청담'); return false;">청담</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('청라국제도시'); return false;">청라국제도시</a></td>
						<td class="tdC"><a href="#" onclick="startStation('청량리'); return false;">청량리</a></td>
						<td class="tdC"><a href="#" onclick="startStation('청명'); return false;">청명</a></td>
						<td class="tdC"><a href="#" onclick="startStation('청평'); return false;">청평</a></td>
						<td class="tdC"><a href="#" onclick="startStation('초당'); return false;">초당</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('초월'); return false;">초월</a></td>
						<td class="tdC"><a href="#" onclick="startStation('초지'); return false;">초지</a></td>
						<td class="tdC"><a href="#" onclick="startStation('총신대입구'); return false;">총신대입구</a></td>
						<td class="tdC"><a href="#" onclick="startStation('춘천'); return false;">춘천</a></td>
						<td class="tdC"><a href="#" onclick="startStation('충무로'); return false;">충무로</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('충정로'); return false;">충정로</a></td>
						<td></td><td></td><td></td>
					</tr>
				</table>
			</div>
			
			<div id="10">
				<table>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('캠퍼스타운'); return false;">캠퍼스타운</a></td>
						<td></td><td></td><td></td><td></td>
					</tr>
				</table>
			</div>
			
			<div id="11">
				<table>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('탄현'); return false;">탄현</a></td>
						<td class="tdC"><a href="#" onclick="startStation('탑석'); return false;">탑석</a></td>
						<td class="tdC"><a href="#" onclick="startStation('태릉입구'); return false;">태릉입구</a></td>
						<td class="tdC"><a href="#" onclick="startStation('태평'); return false;">태평</a></td>
						<td class="tdC"><a href="#" onclick="startStation('테크노파크'); return false;">테크노파크</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('퇴계원'); return false;">퇴계원</a></td>
						<td></td><td></td><td></td><td></td>
					</tr>
				</table>
			</div>
			
			<div id="12">
				<table>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('파주'); return false;">파주</a></td>
						<td class="tdC"><a href="#" onclick="startStation('판교'); return false;">판교</a></td>
						<td class="tdC"><a href="#" onclick="startStation('팔당'); return false;">팔당</a></td>
						<td class="tdC"><a href="#" onclick="startStation('평내호평'); return false;">평내호평</a></td>
						<td class="tdC"><a href="#" onclick="startStation('평촌'); return false;">평촌</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('평택'); return false;">평택</a></td>
						<td class="tdC"><a href="#" onclick="startStation('풍산'); return false;">풍산</a></td>
						<td></td><td></td><td></td>
					</tr>
				</table>
			</div>
			
			<div id="13">
				<table>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('하계'); return false;">하계</a></td>
						<td class="tdC"><a href="#" onclick="startStation('학동'); return false;">학동</a></td>
						<td class="tdC"><a href="#" onclick="startStation('학여울'); return false;">학여울</a></td>
						<td class="tdC"><a href="#" onclick="startStation('한강진'); return false;">한강진</a></td>
						<td class="tdC"><a href="#" onclick="startStation('한남'); return false;">한남</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('한대앞'); return false;">한대앞</a></td>
						<td class="tdC"><a href="#" onclick="startStation('한성대입구'); return false;">한성대입구</a></td>
						<td class="tdC"><a href="#" onclick="startStation('한양대'); return false;">한양대</a></td>
						<td class="tdC"><a href="#" onclick="startStation('한티'); return false;">한티</a></td>
						<td class="tdC"><a href="#" onclick="startStation('합정'); return false;">합정</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('행당'); return false;">행당</a></td>
						<td class="tdC"><a href="#" onclick="startStation('행신'); return false;">행신</a></td>
						<td class="tdC"><a href="#" onclick="startStation('혜화'); return false;">혜화</a></td>
						<td class="tdC"><a href="#" onclick="startStation('호구포'); return false;">호구포</a></td>
						<td class="tdC"><a href="#" onclick="startStation('홍대입구'); return false;">홍대입구</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('홍제'); return false;">홍제</a></td>
						<td class="tdC"><a href="#" onclick="startStation('화곡'); return false;">화곡</a></td>
						<td class="tdC"><a href="#" onclick="startStation('화랑대'); return false;">화랑대</a></td>
						<td class="tdC"><a href="#" onclick="startStation('화서'); return false;">화서</a></td>
						<td class="tdC"><a href="#" onclick="startStation('화전'); return false;">화전</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('화정'); return false;">화정</a></td>
						<td class="tdC"><a href="#" onclick="startStation('회기'); return false;">회기</a></td>
						<td class="tdC"><a href="#" onclick="startStation('회룡'); return false;">회룡</a></td>
						<td class="tdC"><a href="#" onclick="startStation('회현'); return false;">회현</a></td>
						<td class="tdC"><a href="#" onclick="startStation('효자'); return false;">효자</a></td>
					</tr>
					<tr>
						<td class="tdC"><a href="#" onclick="startStation('효창공원앞'); return false;">효창공원앞</a></td>
						<td class="tdC"><a href="#" onclick="startStation('흑석'); return false;">흑석</a></td>
						<td class="tdC"><a href="#" onclick="startStation('흥선'); return false;">흥선</a></td>
					</tr>
				</table>
			</div>

			<div id="button">
				<button style="margin-right: 30px;" onclick="doAjax()">확인</button><button onclick="shortestDView()">취소</button>
			</div>
		</div>
		<p id="result01" class="hideToggle"></p>
		<p id="result02" style="color: #5474C0" class="hideToggle"></p>
		<p id="resultButton" class="hideToggle"><button style="margin-right: 30px;" onclick="END()">확인</button></p>
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
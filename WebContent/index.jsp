<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>INDEX</title>
<script type="text/javascript">
	onload=function(){
		document.body.onclick = function(){
			location.href = "main.jsp";
		};
	}
</script>
<style type="text/css">
	body{
		background-image: url("img/INDEX.jpg");
		background-repeat: no-repeat;
		background-size: 100% 100%;
		height: 974px;
		position: relative;
		overflow: hidden;
	}
	
	div:hover {
		cursor: pointer;
	}
	
	div{
		position: absolute;
		width: 407px;
		height: 407px;
		top: 283px;
		left: 749px;
	}
</style>
</head>
<body>
	
	<div>
	</div>
	
</body>
</html>
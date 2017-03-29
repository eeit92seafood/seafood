<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
${bean}
	<a href="<c:url value="/pages/bonus/GetBonus" />"
		target="_blank"><img
		src="http://www.gifmania.tw/Duixiang/Toys/Casino/Roulette/Roulette-89321.gif"
		alt="輪盤賭 - GIFMANIA" />
	</a>
	
	<h1>訊息:${msg}</h1>
	
	<a href="<c:url value="/index.jsp" />">回首頁</a>
	
	
</body>
</html>
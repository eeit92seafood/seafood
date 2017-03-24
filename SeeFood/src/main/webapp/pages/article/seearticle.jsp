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

<h1>結果</h1>

<div  style="border-color:#aaaaee;border-width:3px;border-style:solid;padding:5px;">
<h1>標題:</h1>${articleid.articleTitle}
</div>

<div  style="border-color:#aaaaee;border-width:3px;border-style:solid;padding:5px;">
<h1>內文:</h1>${articleid.articleData}
</div>

<div  style="border-color:#aaaaee;border-width:3px;border-style:solid;padding:5px;">
<h1>評價:</h1>${articleid.articleAverageStar}
</div>

<a href="<c:url value="/index.jsp" />">回首頁</a>
</body>
</html>
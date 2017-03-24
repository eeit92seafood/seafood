<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

</head>
<body >

<form id="form1" action='<c:url value='/pages/article.controller'/>' method="get" >
<input type="text" name="search" id="search">    <!-- 可打關鍵字 -->
<select name="select">
　<option value="nicknName">作者</option>      <!-- 多選 -->
　<option value="articleTitle">標題</option>
</select>
<button type="submit" >搜尋</button>
</form>


<c:forEach var="data" items="${selectTitle}">     <!-- data(鑰匙)=${selectTitle}(值) ;  -->
<c:url value="/pages/article.controller" var="path">       
            <c:param name="id" value="${data.articleId}" />   <!-- 網址後面串資料 -->
</c:url>

  <div >
<table border="1">
    <tr><td>測試1</td></tr>
    <tr><td>測試2</td></tr>
	<tr><td>文章編號:</td><td>${data.articleId}</td></tr>
	<tr><td>會員編號:</td><td>${data.memberId}</td></tr>
	<tr><td>作者</td><td>${data.memberNicknName}</td></tr>
	<tr><td>文章標題:</td><td>${data.articleTitle}</td></tr>
	<tr><td>文章內容:</td><td>${data.cutData}...<a href="${path}" >(繼續閱讀)</a></td></tr>
	<tr><td>平均評價:</td><td>${data.articleAverageStar}</td></tr>

</table>
  </div>
</c:forEach>
<c:if test="${empty selectTitle}">查無結果</c:if>   <!-- 沒有搜尋結果即顯示 -->
<div>
<a href="<c:url value="/index.jsp" />">回首頁</a>
</div>
<br>
</body>
</html>
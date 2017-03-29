<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>看見食物-seeFood 食府</title>
<c:set var="bean" value="${ bean }" scope="session"/>
<c:remove var="selectMemberId" scope="session"/>
</head>
<body>
${ bean }   
<!-- 變數bean是所有會員資料 只要使用bean.欄位名就能取得相對應的資料 -->
	<h2>歡迎來到食府</h2>
	<h3>${bean.memberNicknName}客官~您餓了嗎</h3>
	<h3><a href="<c:url value="/pages/login/login.jsp" />">登入系統</a></h3>
	<h3>
	<c:if test="${! empty bean.memberNicknName }"><a href="<c:url value="/pages/article/article.jsp" />">發表文章</a></c:if>
	<c:if test="${empty bean.memberNicknName }"><a href="<c:url value="/pages/login/login.jsp" />">發表文章</a></c:if>
	</h3>
	<h3>
	<c:if test="${! empty bean.memberNicknName }"><a href="<c:url value='/pages/SeeMyArticle'/>">自己的文章</a></c:if>
	<c:if test="${empty bean.memberNicknName }"><a href="<c:url value="/pages/login/login.jsp" />">自己的文章</a></c:if>
	</h3>
	<h3><a href='<c:url value="/pages/article.controller"/>'>觀看所有文章</a></h3>
    <h3>
	<c:if test="${!empty bean.memberNicknName }"><a href="<c:url value="/pages/login/logout.jsp" />">登出</a></c:if>
	</h3>
   訊息:${msg}
</body>
</html>
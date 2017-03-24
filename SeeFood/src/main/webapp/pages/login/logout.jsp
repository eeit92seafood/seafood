<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登出</title>
</head>
<body>
<c:set var="showname" value="${bean.memberNicknName}"></c:set>
<c:remove var="bean" scope="application"/>
訪客 ${ showname }，感謝您使用本系統。<BR>
您已經登出<BR>

<a href="<c:url value="/index.jsp" />">回首頁</a>
<%
  session.invalidate();
%>
<%-- <jsp:forward page="/index.jsp"/> 自動導向 --%>
</body>
</html>
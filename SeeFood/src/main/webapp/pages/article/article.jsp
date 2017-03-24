<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章發表</title>
<script src='<c:url value="/ckeditor/ckeditor.js"/>'></script>
<script src='<c:url value="/ckeditor/samples/js/sample.js"/>'></script>
<script src='<c:url value="/ckeditor/samples/js/jquery-3.1.1.js"/>'></script>
<script type="text/javascript">console.log('${errors.title}');</script>
<script type="text/javascript">console.log('${errors.noword}');</script>
<c:set var="bean" value="${ bean }" scope="session"/>
</head>
<body>
<body id="main">


${bean.memberNicknName}你好,歡迎來發表文章!!<br>
<div>
	

	<form name='form' action='<c:url value="/pages/change.controller"/>' method='post'>
	   <div><h3>文章標題(從首頁進來的)<input type="text" name="title" value="${param.title}"></h3>${errors.title}</div> 
		<textarea name="content" id="content" rows="10" cols="80" >${param.content}</textarea>
		<script>
			CKEDITOR.replace('content', 
		    {filebrowserImageUploadUrl : '<c:url value="/js/article1.controller"/>'});
		</script>
		<button type="submit">發表文章</button>
		
	</form>
	
</div>
<table><tr>${errors.noword}</tr><tr>${errors.wordLess}</tr></table>
<c:remove var="selectMemberId" scope="session"/>
<a href="<c:url value="/index.jsp" />">回首頁</a>
</body>
</html>
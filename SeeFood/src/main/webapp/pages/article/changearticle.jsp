<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改文章</title>
<script type="text/javascrip.1.0t" src="http://ajax.googleapis.com/ajax/libs/jquery/0/jquery.min.js"></script>




</head>
<body>
<h1>自己的文章</h1>

<c:forEach var="datafromid" items="${selectMemberId}">

<c:url value="/pages/article.controller" var="path"> 
  <c:param name="id" value="${datafromid.articleId}" />
 
</c:url>

<c:url value="/pages/article.controller" var="path2">
            <c:param name="id" value="${datafromid.articleId}" />
            <c:param name="title" value="${datafromid.articleTitle}" />
</c:url>

<c:url value="/pages/article.controller" var="path3">
            <c:param name="delect" value="${datafromid.articleId}" />
</c:url>

  <div >
<table border="1">
    <tr><td>測試1</td></tr>
    <tr><td>測試2</td></tr>
	<tr><td>文章編號:</td><td>${datafromid.articleId}</td></tr>
	<tr><td>會員編號:</td><td>${datafromid.memberId}</td></tr>
	<tr><td>作者</td><td>${datafromid.memberNicknName}</td></tr>
	<tr><td>文章標題:</td><td>${datafromid.articleTitle}<a href="${path2}">(修改文章)</a></td></tr>
	<tr><td>文章內容:</td><td>${datafromid.cutData}...<a href="${path}" >(閱讀全文)</a></td></tr>
	<tr><td>
	        <form>
	              <button name="delect" value="${datafromid.articleId}" onclick='text(this.form)'>刪除文章</button>
	        </form>
	</td></tr>
	
	<tr><td>評價:</td><td>${datafromid.articleAverageStar}</td></tr>
</table>
  </div>
</c:forEach>

  <script type="text/javascript">

function text(form) {
	if(confirm("確定刪除嗎?")){
		form.action="<c:url value='/pages/article.controller?'/>";
		form.method="get";
		form.submit();

	}else{
		
		form.action="";
		form.method=" ";
		form.submit();
	}
	
}

</script>



<div>
<c:set var="selectMemberId" value="${selectMemberId}" scope="session"></c:set>
<a href="<c:url value="/index.jsp" />">回首頁</a>
</div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${articleid.articleTitle}</title>
<style type="text/css">
.star{
width: 20px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
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

<div  style="border-color:#aaaaee;border-width:3px;border-style:solid;padding:5px;">

     <img class='star' id="st1" name="1" src="../pages/article/star.gif" />
     <img class='star' id="st2" name="2" src="../pages/article/star.gif" />
     <img class='star' id="st3" name="3" src="../pages/article/star.gif" />
     <img class='star' id="st4" name="4" src="../pages/article/star.gif" />
     <img class='star' id="st5" name="5" src="../pages/article/star.gif" />
<form>
     <button onclick='text()'>頂一下</button>
${noStar.thanks}
<br>
${noStar.already}
</form>
    <p id="ii"></p>

</div>
<script type="text/javascript">
var num = 0;
var star=0;
var total=$('img').length;
console.log("total="+total);
$(".star").ready(function () {
           var imgs = document.getElementsByClassName("star");
           for (var i = 0; i < imgs.length; i++) {
               imgs[i].onmouseover = function () { mouseOver(this.id); };
               imgs[i].onmouseout = function () { mouseOut(this.id); };
               imgs[i].onclick = function () { Click(this.id); }
               
           }


           function mouseOver(aa) {
               if (num % 2 == 0) {
                   for (j = 0; j < aa.substr(2) ; j++) {
                       document.images[total-5+j].src = "../pages/article/chngstar.gif";
                       document.getElementById("ii").innerHTML = "評分中" + (aa.substr(2))+"顆星!?";
                       console.log("mouseOver="+(total-j-1));
                   }
                   num = 0;
               }
           }

           function mouseOut(aa) {
               if(num%2==0){
               for (k = 4; (k + 1) >=aa.substr(2) ; k--) {
                   document.images[total-5+k].src = "../pages/article/star.gif";
                   console.log("mouseOut="+(total-k-1));
               }
           }
           }
          
           function Click(aa) {
               num = num + 1;
               if (num % 2 != 0) {
                   for (j = 0; j < aa.substr(2) ; j++) {
                       document.images[total-5+j].src = "../pages/article/chngstar.gif";
                       document.getElementById("ii").innerHTML = "您給" + (aa.substr(2))+"顆星";
                       console.log("Click="+(total-j-1));
                       star=aa.substr(2);
                       
                   }
                  
               }
              
           }
           
       })
       
       
       function text() {
       		console.log(star);
       		document.forms[0].action="<c:url value='/article/bonuscontroller?star="+star+"'/>";
       		document.forms[0].method="POST";
       		document.forms[0].submit();
       }
</script>
<a href="<c:url value="/index.jsp" />">回首頁</a>
</body>
</html>
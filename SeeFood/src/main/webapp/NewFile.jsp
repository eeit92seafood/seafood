<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      
        
        <script>
        function getCountry(){
            //  讀取radio的值
            var form = document.getElementById("form_name");
            for(var i=0; i<form.language.length;i++){
                if(form.language[i].checked){
                    var language = form.language[i].value;
                    alert(language);
                }
            }
            //  讀取select的值
            var country = form.country.value;
            alert(country);
        }
//  寫入內容到HTML元素中
        //  寫入內容到INPUT
        function WriteValue(){                              
            document.getElementById("input").value="12345";
        }
        //  寫入內容到DIV或SPAN
        function WriteOnScreen(){                             
            document.getElementById("screen").innerHTML = "2+3"
        }

//  讀取HTML元素
         //讀取INPUT的內容
        function ShowValue(){                               
            var v = document.getElementById("input").value ;
            alert(v);
        }
         //讀取DIV或SPAN的內容
        function ShowOnScreen(){                            
            var v = document.getElementById("screen")
            alert(v.innerHTML);
        }
    </script>
        
        
    </head>
    <body>
     <div>
    <form name="form_name" id="form_name">
        <!--radio用法-->
        <label><input name="language" type="radio" value="繁中" checked>繁中</label>
        <label><input name="language" type="radio" value="韓文">韓文</label>
        <label><input name="language" type="radio" value="日文">日文</label>
        <br>
        <!--select用法-->

        <select name="country">
            <option value="台灣">台灣</option>
            <option value="韓國">韓國</option>
            <option value="日本">日本</option>
        </select>
        <button onclick="getCountry()">取得Radio和Select</button>
    </form>
</div>
<div id="screen">
</div>
    <input type="text" id="input">
    <button onclick="WriteOnScreen()">寫入內容到DIV中</button>
    <button onclick="WriteValue()">寫入內容到INPUT中</button>
    <button onclick="ShowOnScreen()">讀取DIV的內容</button>
    <button onclick="ShowValue()">讀取Input的內容</button>  
        
        
        
    </body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: 陈喜喜
  Date: 2022/6/26
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>javascript-test</title>
    <style>
        #myDiv {
            border: 1px rosybrown double;
            width: 120px;
        }

        #myA {
            font-size: 90px;
            color: blueviolet;
        }
    </style>
</head>

<body>
<script type="text/javascript">
    window.onload = function () {
        document.getElementById("a+b").onclick = function () {
            /* alert(add(document.getElementById("a").value,document.getElementById("b").value))*/
            document.getElementById("ab").value = add(document.getElementById("a").value, document.getElementById("b").value)
            document.getElementById("myDiv").innerHTML = add(document.getElementById("a").value, document.getElementById("b").value)
        }//innerHTML会把设置的字符串当作HTML代码解释并执行，而innerText只会把后面的字符串显示出来而已
        document.getElementById("re").onclick = function () {
            document.getElementById("a").value = ""
            document.getElementById("b").value = ""
            document.getElementById("ab").value = ""
            document.getElementById("myDiv").innerHTML = ""
        }
        //手写String.trim()
        String.prototype.trim=function (){
            return this.replace(/^\s+/,"").replace(/\s+$/,"")
        }
        document.getElementById("mt1").onkeydown = function (ev) {
            if (ev.key === "Enter") {
                document.getElementById("mt2").value = document.getElementById('mt1').value.trim()
            }
        }
        document.getElementById("mt1").onblur = function () {
            document.getElementById("mt2").value = ""
            document.getElementById("mt1").value = ""
        }
    }
</script>
<div>Hello world!!!!!</div>
mousemove<input type="button" name="hello jack" value="hello" onmousemove="sayHello('jack')">
dblclick<input type="button" name="10add50" value="10+50=" ondblclick="alert(add(10,50))">
click<input type="button" name="10add50" value="10+50=" onclick="javascript:alert(add('10','“50”'));">
<form action="index.jsp" method="get" name="a+b">
    a:<input type="text" name="a" id="a">
    b:<input type="text" name="b" id="b">
    <input type="button" name="a+b" id="a+b" value="计算a+b">
    <input type="text" name="ab" id="ab">
    <input type="button" name="re" id="re" value="重置">
    <div id="myDiv"></div>
    <a href="#######">hhhhhhhhhhhh</a>
</form>

<span>电话号码：</span><input type="text" id="phone">
<span id="phoneSpan"></span>
<br>
<input type="button" value="计算10/3" onclick="alert(10/3)">
<input type="button" value="计算0.1+0.2" onclick="alert(0.1+0.2)">
<input type="button" value="doSome" id="myButton">
<input type="button" value="doSome2" id="myButton2">
<br>提交你想说的话：<input type="text" id="myText" value="">
<br><input type="text" id="mt1" placeholder="去除前后文空格">→<input type="text" id="mt2">
<input type="button" value="haha" id="haha">
<br>
<br>
<br>
<br>
<br>
<br>
<br><a href="next.jsp" id="myA">NEXT→</a>
<script type="text/javascript">function doSome() {
    alert("doSome..............")
}</script>
<script type="text/javascript">
    var elementById = document.getElementById("myButton");
    elementById.onclick = doSome;//这种方式的时间句柄的回调函数千万别加()，直接写函数名，加了()页面打开会直接执行一次
    //elementById.onclick = function(){alert("test.....")}
    //doSome这个位置是写回调函数的，不加小括号，也可以直接写一个匿名函数，页面打开不执行
    //以后都这样写
    document.getElementById("myButton2").onclick = function () {
        alert("doSome2......")//js都是会先运行函数的，而这里的匿名函数是注册，不会运行
    }
    document.getElementById("myText").onkeydown = function (ev) {
        if (ev.key === "Enter") {
            alert("提交成功：" + document.getElementById("myText").value)
        }        /*alert("提交成功："+document.getElementById("myText").value+"      健值为："+ev.key)*/
    }
    document.getElementById("phone").onkeydown = function (ev) {
        if (ev.key === "Enter") {
            var phone = document.getElementById("phone").value;
            var phoneRE = /^(13[0-9]|15[0-9]|18[0-9]|17[0-9]|19[0-9])\d{8}$/
            if (!phoneRE.test(phone)) {
                document.getElementById("phoneSpan").innerHTML = "<font color='red'>你输入的电话号码不合法</font>"
            } else {
                document.getElementById("phoneSpan").innerHTML = "<font size='8px' color='green'>√</font>"
            }
        }
    }
    document.getElementById("phone").onfocus = function (ev) {
        document.getElementById("phoneSpan").innerHTML = "<font color='#778899'>请输入你的手机号码</font>"
    }
    document.getElementById("phone").onblur = function (ev) {
        document.getElementById("phoneSpan").innerHTML = ""
    }
</script>

</body>
<script type="text/javascript" src="js/js1.js"></script>
</html>
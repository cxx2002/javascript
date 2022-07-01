<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>表单验证</title>
    <style>
        font {
            color: red;
            font-size: 12px;
        }

        .true {
            color: green;
            font-size: 12px;
        }

        input {
            color: blueviolet;
        }

        .center {
            width: 600px;
            height: 400px;
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            margin: auto; /* 有了这个就自动居中了 */
        }

        #six {
            color: darkgray;
        }
    </style>
</head>
<body>
<script type="text/javascript">
    var username = false;
    var password = false;
    var passwordAgain = false;
    var email = false;
    var phoneNumber = false;
    window.onload = function () {
        document.getElementById("userName").onkeydown = function (ev) {
            username = false
            document.getElementById("pSpan").innerHTML = ""
        }
        document.getElementById("userName").onkeyup = function (ev) {
            if (!/^[0-9a-zA-Z_]{6,14}$/.test(document.getElementById("userName").value)) {
                document.getElementById("unSpan").innerHTML = "<font>用户名格式错误！长度6-14，且只包含数字和字母以及下划线</font>"
            } else {
                document.getElementById("unSpan").innerHTML = "<font class='true'>✔</font>"
                username = true
            }
            if (document.getElementById("userName").value.length < 6) {
                document.getElementById("unSpan").innerHTML = "<font id='six'>用户名长度不能小于6</font>"
            }
            if (ev.key === " ") {
                document.getElementById("unSpan").innerHTML = "<font>用户名不能含有空格！</font>"
            }
        }
        document.getElementById("userName").onblur = function (ev) {
            if (!/^[0-9a-zA-Z_]{6,14}$/.test(document.getElementById("userName").value)) {
                document.getElementById("unSpan").innerHTML = "<font>用户名格式错误！长度6-14，且只包含数字和字母以及下划线</font>"
            } else {
                document.getElementById("unSpan").innerHTML = "<font class='true'>✔</font>"
                username = true
            }
            if (document.getElementById("userName").value.length === 0) {
                document.getElementById("unSpan").innerHTML = "<font><!--用户名不能为空！--></font>"
            }
        }
        document.getElementById("userName").onfocus = function (){
            document.getElementById("unSpan").innerText = ""
        }
        document.getElementById("password").onkeyup = function (ev) {
            password = false
            if (!/^[0-9a-zA-Z!?,.;'":@#$%^&*()_+={}|/<>]{8,16}$/.test(document.getElementById('password').value)) {
                document.getElementById("pSpan").innerHTML = "<font>密码格式错误！长度8-14</font>"
            } else {
                document.getElementById("pSpan").innerHTML = "<font class='true'>✔</font>"
            }
            if (document.getElementById("password").value.length < 8) {
                document.getElementById("pSpan").innerHTML = "<font id='six'>密码长度不能小于8</font>"
            }
            if (ev.key === " ") {
                document.getElementById("pSpan").innerHTML = "<font>密码不能含有空格！</font>"
            }
            if (document.getElementById("passwordAgain").value.length > 0) {
                if (document.getElementById("passwordAgain").value === document.getElementById("password").value) {
                    document.getElementById("paSpan").innerHTML = "<font class='true'>✔</font>"
                    passwordAgain = true
                } else {
                    document.getElementById("paSpan").innerHTML = "<font>两次密码输入不一致</font>"
                    passwordAgain = false
                }
            }
        }
        document.getElementById("password").onblur = function () {
            if (!/^[0-9a-zA-Z!?,.;'":@#$%^&*()_+={}|/<>]{8,16}$/.test(document.getElementById('password').value)) {
                document.getElementById("pSpan").innerHTML = "<font>密码格式错误！长度8-14</font>"
            } else {
                document.getElementById("pSpan").innerHTML = "<font class='true'>✔</font>"
                password = true
            }
            if (document.getElementById("password").value.length === 0) {
                document.getElementById("pSpan").innerHTML = "<font><!--密码不能为空！--></font>"
            }
        }
        document.getElementById("password").onfocus = function (){
            document.getElementById("pSpan").innerText = ""
        }
        document.getElementById("passwordAgain").onkeyup = function () {
            passwordAgain = false
            if (document.getElementById("passwordAgain").value === document.getElementById("password").value
                && document.getElementById("passwordAgain").value.length > 0 && password) {
                document.getElementById("paSpan").innerHTML = "<font class='true'>✔</font>"
            } else {
                document.getElementById("paSpan").innerHTML = ""
            }
        }
        document.getElementById("passwordAgain").onblur = function () {
            if (document.getElementById("passwordAgain").value === document.getElementById("password").value && password) {
                document.getElementById("paSpan").innerHTML = "<font class='true'>✔</font>"
                passwordAgain = true
            } else if(document.getElementById("passwordAgain").value !== document.getElementById("password").value){
                document.getElementById("paSpan").innerHTML = "<font>两次密码输入不一致！</font>"
            }
            if (document.getElementById("passwordAgain").value.length === 0) {
                document.getElementById("paSpan").innerHTML = ""
            }
        }
        document.getElementById("passwordAgain").onfocus = function (){
            document.getElementById("paSpan").innerText = ""
        }
        document.getElementById("email").onkeyup = function () {
            email = false
            if (/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/.test(document.getElementById("email").value)) {
                document.getElementById("eSpan").innerHTML = "<font class='true'>✔</font>"
            } else {
                document.getElementById("eSpan").innerHTML = ""
            }
        }
        document.getElementById("email").onblur = function () {
            if (/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/.test(document.getElementById("email").value)) {
                document.getElementById("eSpan").innerHTML = "<font class='true'>✔</font>"
                email = true
            } else {
                document.getElementById("eSpan").innerHTML = "<font>邮箱格式错误！</font>"
            }
            if (document.getElementById("email").value.length === 0) {
                document.getElementById("eSpan").innerHTML = ""
            }
        }
        document.getElementById("email").onfocus = function (){
            document.getElementById("eSpan").innerText = ""
        }
        document.getElementById("phoneNumber").onkeyup = function () {
            phoneNumber = false
            if (/^(13[0-9]|15[0-9]|18[0-9]|17[0-9]|19[0-9])\d{8}$/.test(document.getElementById("phoneNumber").value)) {
                document.getElementById("pnSpan").innerHTML = "<font class='true'>✔</font>"
            } else {
                document.getElementById("pnSpan").innerHTML = ""
            }
        }
        document.getElementById("phoneNumber").onblur = function () {
            if (/^(13[0-9]|15[0-9]|18[0-9]|17[0-9]|19[0-9])\d{8}$/.test(document.getElementById("phoneNumber").value)) {
                document.getElementById("pnSpan").innerHTML = "<font class='true'>✔</font>"
                phoneNumber = true
            } else {
                document.getElementById("pnSpan").innerHTML = "<font>电话号码格式错误！</font>"
            }
            if (document.getElementById("phoneNumber").value.length === 0) {
                document.getElementById("pnSpan").innerHTML = ""
            }
        }
        document.getElementById("phoneNumber").onfocus = function (){
            document.getElementById("pnSpan").innerText = ""
        }
        document.getElementById("submit").onclick = function () {
            var flag = false
            if (!username)
                alert("用户名格式错误！")
            else if (!password)
                alert("密码格式有误！")
            else if (!passwordAgain)
                alert("两次密码不一致！")
            else if (!email)
                alert("邮箱格式有误！")
            else if (!phoneNumber)
                alert("电话号码格式有误！")
            else if (confirm("是否提交注册"))
                flag = true
            return flag
        }
    }
</script>

<form title="注册账号" id="register" name="register" method="get" action="#" class="center">
    用户名:<input type="text" id="userName" name="userName"><span id="unSpan"></span>
    <br>密码:<input type="password" id="password" name="password"><span id="pSpan"></span>
    <br>确认密码:<input type="password" id="passwordAgain" name="passwordAgain"><span id="paSpan"></span>
    <br>邮箱:<input type="text" id="email" name="email"><span id="eSpan"></span>
    <br>电话号码:<input type="text" id="phoneNumber" name="phoneNumber"><span id="pnSpan"></span>
    <br><input type="submit" id="submit" value="注册">
</form>

</body>
</html>

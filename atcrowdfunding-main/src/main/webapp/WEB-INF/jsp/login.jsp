<%--
  Created by IntelliJ IDEA.
  User: donghb
  Date: 2020/5/18
  Time: 10:24 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${applicationScope.APP_PATH}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${applicationScope.APP_PATH}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${applicationScope.APP_PATH}/css/login.css">
    <style>

    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div><a class="navbar-brand" href="index.html" style="font-size:32px;">尚筹网-创意产品众筹平台</a></div>
        </div>
    </div>
</nav>

<div class="container">

    <form class="form-signin" role="form">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 用户登录</h2>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" id="userNameId" name="loginacct"  placeholder="请输入登录账号" value="zhangsan" autofocus>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="password" class="form-control" id="pwdId" name="userpswd" placeholder="请输入登录密码" value="123456" style="margin-top:10px;">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <select class="form-control" >
                <option value="member">会员</option>
                <option value="user" selected>管理</option>
            </select>
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> 记住我
            </label>
            <br>
            <label>
                忘记密码
            </label>
            <label style="float:right">
                <a href="reg.html">我要注册</a>
            </label>
        </div>
        <a class="btn btn-lg btn-success btn-block" onclick="dologin()" > 登录</a>
    </form>
</div>
<script src="${applicationScope.APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
<script src="${applicationScope.APP_PATH}/jquery/layer/layer.js"></script>
<script src="${applicationScope.APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script>

    function dologin() {
        //获取用户名和密码：
        var loginAcct = $("#userNameId").val();
        var pwd = $("#pwdId").val();
        if (loginAcct == "") {
            layer.msg("用户名不能为空！", {time:1000, icon:5, shift:6});
            return;
        }
        if (pwd == "" ) {
            layer.msg("密码不能为空！", {time:1000, icon:5, shift:6});
            return;
        }

        $.ajax({
            type: "POST",
            url: "some.php",
            data: "name=John&location=Boston",
            success: function(msg){
                alert( "Data Saved: " + msg );
            }
        });

        //如果用户名和密码都不为空，那么发送登录请求：
        $.ajax({
            url:'${applicationScope.APP_PATH}/userManager/login.do',
            type:'POST',
            data:
                 {
                     loginacct:loginAcct,
                     userpswd : pwd
                 },
            dataType:'JSON',
            success:function (value) {
                if (value.resultBool) {
                    //跳转到登录成功页面：
                    var type = $(":selected").val();
                    if ( type == "user" ) {
                        //后台登录成功页面：
                        window.location.href = "${applicationScope.APP_PATH}/main.htm";
                    } else {
                        window.location.href = "${applicationScope.APP_PATH}/login.htm";
                    }
                } else {
                    //跳转到登录页面：
                    layer.msg(value.message, {time:1000, icon:5, shift:6});
                }
               /* var type = $(":selected").val();
                if ( type == "user" ) {
                    window.location.href = "main.html";
                } else {
                    window.location.href = "index.html";
                }*/
            }
        });

    }
</script>
</body>
</html>

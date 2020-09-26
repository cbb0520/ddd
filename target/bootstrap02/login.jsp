<%--
  Created by IntelliJ IDEA.
  User: 斌哥
  Date: 2020/9/16
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<div class="container">

    <div class="row">
        <div class="col-md-6 col-md-offset-3">

            <fieldset >
                <legend>登录</legend>
                <div class="form-group">
                    <label for="username">用户名：</label>
                    <input type="text"  id="username" name="username" class="form-control" placeholder="请输入用户名" />
                    <span class="glyphicon glyphicon-ok form-control-feedback sr-only" ></span>
                </div>

                <div class="form-group">
                    <label for="pwd">密码：</label>
                    <input type="password" id="pwd" name="pwd" class="form-control" placeholder="请输入密码" />

                </div>

                <br>
                <div class="row">
                    <input id="but1" type="button" class="btn btn-primary col-md-2 col-md-offset-3" value="登录" />
                    <input id="but2" type="button" value="注册" class="btn btn-warning col-md-2 col-md-offset-1" />
                </div>


            </fieldset>

        </div>
    </div>

</div>
<script type="text/javascript">
    $("#but1").click(function () {
        $.get("userlogin.action", {uname:$("#username").val(),parss:$("#pwd").val()}, function (data) {
            if(data==''){
                window.location = "userindex2.jsp";
            }else{
                alert(data)
            }
        }, "text");

    })
    $("#but2").click(function () {
        window.location = "zhuce.jsp";
    })
</script>
</body>
</html>

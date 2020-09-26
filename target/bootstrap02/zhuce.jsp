<%--
  Created by IntelliJ IDEA.
  User: 斌哥
  Date: 2020/9/16
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<div class="row">
    <div class="col-md-4 col-md-offset-4">

        <fieldset >
            <legend>注册</legend>
            <div class="form-group">
                <label for="username">用户名：</label>
                <input type="text"  id="username" name="username" class="form-control" placeholder="请输入用户名" autofocus required/>
                <span class="glyphicon glyphicon-ok form-control-feedback sr-only" ></span>
            </div>

            <div class="form-group">
                <label for="pwd">密码：</label>
                <input type="password" id="pwd" name="pwd" class="form-control" placeholder="请输入密码"  autofocus required/>

            </div>

            <br>
            <div class="row">
                <input id="but3" type="button" value="注册" class="btn btn-primary col-md-2 col-md-offset-5" />
            </div>


        </fieldset>

    </div>
</div>
<script type="text/javascript">


    $("#but3").click(function () {
        if($("#username").val()==''||$("#pwd").val()==''){
            alert("不能为空")
            }else {
        $.get("adduser.action", {uname:$("#username").val(),parss:$("#pwd").val()}, function (data) {
            alert(data)
            if(data=="注册成功"){
                window.location = "login.jsp";
            }
        }, "text");
    }


    })
</script>
</div>
</body>
</html>

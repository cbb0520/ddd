<%--
  Created by IntelliJ IDEA.
  User: 斌哥
  Date: 2020/9/18
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<div class="row">
    <div class="col-md-3 col-md-offset-4">

        <fieldset >
            <legend>添加</legend>
            <div class="form-group">
                <label for="name">姓名：</label>
                <input type="text"  id="name" name="username" class="form-control" placeholder="请输入姓名" autofocus required/>
                <span class="glyphicon glyphicon-ok form-control-feedback sr-only" ></span>
            </div>

            <div class="form-group">
                <label for="sex">性别：</label>
                <input type="text" id="sex" name="sex" class="form-control" placeholder="请输入性别"  autofocus required/>

            </div>
            <div class="form-group">
                <label for="age">年龄：</label>
                <input type="tetx" id="age" name="pwd" class="form-control" placeholder="请输入年龄"  autofocus required/>

            </div>
            <div class="form-group">
                <label for="shengri">年龄：</label>
                <input type="date" id="shengri" name="pwd" class="form-control" placeholder="请输入shengri"  autofocus required/>

            </div>

            <br>
            <div class="row">
                <input id="but4" type="button" value="添加" class="btn btn-primary col-md-2 col-md-offset-5" />
            </div>


        </fieldset>

    </div>
</div>
<script type="text/javascript">


    $("#but4").click(function () {
        if($("#name").val()==''||$("#sex").val()==''){
            alert("不能为空")
        }else {
            $.get("addUserInfo.action", {name:$("#name").val(),sex:$("#sex").val(),age:$("#age").val(),shengri:$("#shengri").val()}, function (data) {
                alert(data)
                if(data=="添加成功"){
                    window.location = "userindex3.jsp";
                }
            }, "text");
        }


    })
    </script>
</body>
</html>

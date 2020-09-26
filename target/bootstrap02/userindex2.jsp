<%--
  Created by IntelliJ IDEA.
  User: 斌哥
  Date: 2020/9/16
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-table-zh-CN.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/bootstrap-table.min.css">
</head>
<body>
<div class="table-responsive">
    <table class="table table-striped table-bordered table-hover table-condensed">
        <thead>
        <tr>
            <th>编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>出生日期</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <tbody id="bo">

        </tbody>
    </table>
    <!-- 分页工具-->

    <nav class="text-center">
        <input type="hidden" id="ye">
        <ul class="pagination">
            <li>
                <a href="#" id="a1" aria-label="Previous">
                    <span  aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li>
                <a href="#">1</a>
            </li>
            <li>
                <a href="#">2</a>
            </li>
            <li>
                <a href="#">3</a>
            </li>
            <li>
                <a href="#">4</a>
            </li>
            <li>
                <a href="#">5</a>
            </li>
            <li>
                <a href="#" id="next1" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
<script type="text/javascript">
    $(function () {
        $.post("qurryUser2.action",function(data){
          $("#ye").val(data.page)
            var table = "";
            for (var i = 0; i < data.rows.length; i++) {
                table += "<tr><td>" + data.rows[i].id + "</td><td>" +
                    data.rows[i].name + "</td><td>"+data.rows[i].sex+"</td><td>" +
                    data.rows[i].age +"</td><td>"+data.rows[i].shengri+"</td><td class='text-center'>"+
                    "<a href='#' id='xiu1' class='btn btn-info'  onclick='xiugai(" + data.rows[i].id + ")'>编辑</a>" +
                    "<a href='#' id='xiu3' class='btn btn-danger' onclick='shanchu(" + data.rows[i].id + ")'>删除</a></td></tr>"

            }
            document.getElementById("bo").innerHTML = table;


        },"json");
    })
    $("#a1").click(function () {
        var page = $("#ye").val()
        if ($("#ye").val()>1){
            page = page-1
        }
        $.post("qurryUser2.action",{page:page,rows:5},function(data){
            $("#ye").val(data.page)
            var table = "";
            for (var i = 0; i < data.rows.length; i++) {
                table += "<tr><td>" + data.rows[i].id + "</td><td>" +
                    data.rows[i].name + "</td><td>"+data.rows[i].sex+"</td><td>" +
                    data.rows[i].age +"</td><td>"+data.rows[i].shengri+"</td><td class='text-center'>"+
                    "<a href='#' id='xiu1' class='btn btn-info'  onclick='xiugai(" + data.rows[i].id + ")'>编辑</a>" +
                    "<a href='#' id='xiu3' class='btn btn-danger' onclick='shanchu(" + data.rows[i].id + ")'>删除</a></td></tr>"

            }
            document.getElementById("bo").innerHTML = table;


        },"json");
    })
    $("#next1").click(function () {

            page = parseInt($("#ye").val())+1

        $.post("qurryUser2.action",{page:page,rows:5},function(data){
            $("#ye").val(data.page)
            var table = "";
            for (var i = 0; i < data.rows.length; i++) {
                table += "<tr><td>" + data.rows[i].id + "</td><td>" +
                    data.rows[i].name + "</td><td>"+data.rows[i].sex+"</td><td>" +
                    data.rows[i].age +"</td><td>"+data.rows[i].shengri+"</td><td class='text-center'>"+
                    "<a href='#' id='xiu1' class='btn btn-info'  onclick='xiugai(" + data.rows[i].id + ")'>编辑</a>" +
                    "<a href='#' id='xiu3' class='btn btn-danger' onclick='shanchu(" + data.rows[i].id + ")'>删除</a></td></tr>"

            }
            document.getElementById("bo").innerHTML = table;


        },"json");
    })
</script>
</body>
</html>

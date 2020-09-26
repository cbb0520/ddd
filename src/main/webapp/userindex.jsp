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
    <link rel="stylesheet" href="css/bootstrap.css" />
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
        <tr>
            <td>10001</td>
            <td>Jerry</td>
            <td>男</td>
            <td>18</td>
            <td>1979-01-01</td>
            <td class="text-center">
                <a href="#" class="btn btn-info">编辑</a>
                <a href="#" class="btn btn-danger" onclick="return confirm('确实要删除该会员资料吗？');">删除</a>
            </td>
        </tr>
        </tbody>
    </table>
    <!-- 分页工具-->

    <nav class="text-center">
        <ul class="pagination">
            <li>
                <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
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
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
<script type="text/javascript">
    $(function () {
        $.post("qurryUser.action",function(data){

            var table = "";
            for (var i = 0; i < data.length; i++) {
                table += "<tr><td>" + data[i].id + "</td><td>" +
                    data[i].name + "</td><td>"+data[i].sex+"</td><td>" +
                    data[i].age +"</td><td>"+data[i].shengri+"</td><td class='text-center'>"+
                    "<a href='#' id='xiu1' class='btn btn-info'  onclick='xiugai(" + data[i].id + ")'>编辑</a>" +
                    "<a href='#' id='xiu3' class='btn btn-danger' onclick='shanchu(" + data[i].id + ")'>删除</a></td></tr>"

            }
            document.getElementById("bo").innerHTML = table;


        },"json");
    })
</script>
</body>
</html>

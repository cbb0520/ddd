<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/21
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>弹出对话框</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-table-zh-CN.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/bootstrap-table.min.css">
</head>

<body>

<div class="container">


    <button class="btn btn-success" data-toggle="modal" data-target="#addusermodal">添加</button>



    <form class="form-inline">
        <div class="input-group">
            <span class="input-group-addon">姓名：</span>
            <input type="text" placeholder="请输入姓名" id="searchname" class="form-control">
            <div class="input-group-btn">
                <input type="button" id="btnsearchuser" class="btn btn-primary" value="查询">
            </div>

        </div>
    </form>

    <table id="tbl_userlist">

    </table>
    <!--  对话框  写在主页面  (列表显示，添加显示，编辑显示  都在一个页面)  -->

    <!--  添加子页面-->
    <!--外层容器div -->
    <div id="addusermodal" class="modal" data-backdrop="" static>
        <!-- 对话框容器div-->
        <div class="modal-dialog">
            <!--内容容器div -->
            <div class="modal-content">
                <!--标题 -->
                <div class="modal-title text-center">
                    用户添加
                </div>
                <!--主体 -->
                <div class="modal-body">
                    <form>

                        <div class="input-group">
                            <span class="input-group-addon">用户名</span>
                            <input type="text" class="form-control" placeholder="请输入用户名">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon">密码&nbsp;&nbsp;&nbsp;</span>
                            <input type="password" class="form-control" placeholder="请输入密码">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon">生日&nbsp;&nbsp;&nbsp;</span>
                            <input type="date" class="form-control" placeholder="请输入邮箱">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon">角色&nbsp;&nbsp;&nbsp;</span>
                            <select class="selectpicker" id="roleid" name="roleid" title="请选择角色"
                                    data-width="150px"></select>
                        </div>

                    </form>
                </div>
                <!--底部 -->
                <div class="modal-footer ">
                    <div class="row">
                        <input type="button" class="btn btn-success col-md-5 col-md-offset-1" value="添加"/>
                        <input type="button" class="btn btn-success col-md-5" value="关闭"/>
                    </div>
                </div>
            </div>

        </div>

    </div>

    <!--编辑子页面 -->
    <div id="editusermodal" class="modal">
        <!-- 对话框容器div-->
        <div class="modal-dialog">
            <!--内容容器div -->
            <div class="modal-content">
                <!--标题 -->
                <div class="modal-title text-center">
                    用户编辑
                </div>
                <!--主体 -->
                <div class="modal-body">
                    <form>

                        <div class="input-group">
                            <span class="input-group-addon">用户名</span>
                            <input type="text" class="form-control" placeholder="请输入用户名">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon">密码&nbsp;&nbsp;&nbsp;</span>
                            <input type="password" class="form-control" placeholder="请输入密码">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon">邮箱&nbsp;&nbsp;&nbsp;</span>
                            <input type="email" class="form-control" placeholder="请输入邮箱">
                        </div>

                    </form>
                </div>
                <!--底部 -->
                <div class="modal-footer ">
                    <div class="row">
                        <input type="button" class="btn btn-success col-md-5 col-md-offset-1" value="添加"/>
                        <input id="btnedituserclose" type="button" class="btn btn-success col-md-5" value="关闭"/>
                    </div>
                </div>
            </div>

        </div>

    </div>

    <script type="text/javascript">


        $(function () {
            //初始化表格
            $('#tbl_userlist').bootstrapTable({
                url: 'qurryUser22.action',
                method: 'GET',                      //请求方式（*）
                //toolbar: '#toolbar',              //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: true,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
                pageSize: 5,                     //每页的记录行数（*）
                pageList: [5,10, 25, 50, 100],        //可供选择的每页的行数（*）
                search: false,                      //是否显示表格搜索
                strictSearch: true,
                showColumns: true,                  //是否显示所有的列（选择显示的列）
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                  //是否显示父子表
                //得到查询的参数
                queryParams : function (params) {
                    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                    var temp = {
                        rows: params.limit,                         //页面大小
                        page: (params.offset / params.limit) + 1,  //页码
                        name:$("#searchname").val()
                    };
                    return temp;
                },
                columns: [{
                    field: 'id',
                    title: '编号'
                }, {
                    field: 'name',
                    title: '姓名'
                },
                    {
                        field: 'sex',
                        title: '性别'
                    },
                    {
                        field: 'age',
                        title: '年龄'
                    },
                    {
                        field: '',
                        title: '操作',
                        formatter:function (value,row) {

                            var id =row.id;

                            return ' <button onclick=\"edituser('+id+')\" class=\"btn btn-primary\" >编辑</button>'+
                                    ' <button onclick=\"deluser('+id+')\" class=\"btn btn-danger\" >删除</button>';
                        }
                        // <button class="btn btn-primary" id="btnedituser">编辑</button>
                    }]
            });


//初始化下拉框
            //动态加载
            $.ajax({
                type: 'get',
                url: 'queryallroles.action',
                dataType: "json",
                success: function (data) {
                    //拼接下拉框
                    for (var i = 0; i < data.length; i++) {
                        $("#roleid").append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");
                    }
                    //这一步不要忘记 不然下拉框没有数据
                    $("#roleid").selectpicker("refresh");
                }
            });
        });


       /* $("#btnedituser").click(function () {
            $("#editusermodal").modal("show");
        });*/

        $("#btnedituserclose").click(function () {
            $("#editusermodal").modal("hide");
        });


        //实现删除操作
        function  deluser(id) {
            //ajax  del(id)
            alert(id);
        }

        //实现编辑
        function  edituser(id) {
            //ajax  del(id)
            alert(id);
            $("#editusermodal").modal("show");
        }


        //实现条件查询
        $("#btnsearchuser").click(function () {
            $('#tbl_userlist').bootstrapTable("refresh");
        });


    </script>
</div>
</body>

</html>
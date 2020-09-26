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
<div class="container">
    <div class="col-md-12">
        <div class="panel panel-success">
            <div class="panel-heading">

                <form class="form-inline">
                    <div class="form-group">
                        <label for="exampleInputName">姓名</label>
                        <input type="text" class="form-control"  id="exampleInputName" placeholder="请输入姓名">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail2">年龄</label>
                        <input type="email" class="form-control" id="exampleInputEmail2" placeholder="请输入年龄">
                    </div>
                    <button type="button" class="btn btn-primary" id="butt">查询</button>
                    <button type="button" class="btn btn-primary" id="butt2">添加</button>
                    <button type="button" class="btn btn-primary" id="butt3">删除</button>
                    <button type="button" class="btn btn-primary" id="butt4">编辑</button>
                </form>
            </div>
            <div class="panel-body">
                <table id="tb_departments"></table>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增</h4>
            </div>
            <div class="modal-body">
                <input type="hidden" id="uid">
                <div class="form-group">
                    <label for="uname">姓名</label>
                    <input type="text" name="txt_departmentname" class="form-control" id="uname" placeholder="姓名名称">
                </div>
                <div class="form-group">
                    <label for="usex">性别</label>
                    <input type="text" name="txt_parentdepartment" class="form-control" id="usex" placeholder="输入性别">
                </div>
                <div class="form-group">
                    <label for="uage">年龄</label>
                    <input type="text" name="txt_departmentlevel" class="form-control" id="uage" placeholder="输入年龄">
                </div>
                <div class="form-group">
                    <label for="shengr">生日</label>
                    <input type="date" name="txt_statu" class="form-control" id="shengr" placeholder="状态">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    var param = {
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
                name:$("#exampleInputName").val()
            };
            return temp;
        },
                columns: [{
                    checkbox: true
                }, {
                    field: 'id',
                    title: '编号',
                }, {
                    field: 'name',
                    title: '姓名',

                }, {
                    field: 'sex',
                    title: '性别',

                }, {
                    field: 'age',
                    title: '性别',

                },{
                    field: 'shengri',
                    title: '出生年月',
                },{
                    field: 'id',
                    title: '操作',
                    formatter : function(value, row, index) {
                        var html = "";
                        html += '<a type="button" class="btn btn-primary btn-sm"  onclick = "showFaultCaseModify(\''
                            + value
                            + '\');">编辑</a>';
                        html += '   ';
                        html += '<a type= "button" class="btn btn-danger btn-sm" onclick = "deleteFaultCase(\''
                            + value
                            + '\');">删除</a>';
                        return html;
                    },
                }]
   }
    $("#tb_departments").bootstrapTable(param)
$("#butt").click(function () {
    $("#tb_departments").bootstrapTable('refresh')
})
    $("#butt2").click(function () {
        window.location = "add.jsp";
    })
    $("#butt3").click(function () {
        var selwo =  $("#tb_departments").bootstrapTable("getSelections")
        if(selwo.length==0) {
        alert('请选择一条记录！');
            return;
        }
                var ids = "";
                for (var i = 0; i < selwo.length; i++) {
                    ids += selwo[i].id + ",";
                }
                $.get("deleUserInfo.action", {"ids": ids}, function (data) {
                      alert(data.msg)
                    },'json');
        ("#tb_departments").bootstrapTable('refresh')
    })
    $("#butt4").click(function () {
        var selwo =  $("#tb_departments").bootstrapTable("getSelections")
        if(selwo.length==0 ||selwo.length>1) {
            alert('请选择一条记录！');
            return;
        }
        $("#uid").val(selwo[0].id)
        $("#uname").val(selwo[0].name)
        $("#usex").val(selwo[0].sex)
        $("#uage").val(selwo[0].age)
        $("#shengr").val(selwo[0].shengri)
        $('#myModal').modal();
    })
    $("#btn_submit").click(function () {
        if($("#uname").val()==''||$("#usex").val()==''){
            alert("不能为空")
        }else {
            $.get("updateUserInfo.action", {id:$("#uid").val(),name:$("#uname").val(),sex:$("#usex").val(),age:$("#uage").val(),shengri:$("#shengr").val()}, function (data) {
                alert(data)
                if(data=="编辑成功"){
                    window.location = "userindex3.jsp";
                }
            }, "text");
        }
    })
    function showFaultCaseModify(id) {
     alert(id)
    }
    function deleteFaultCase(id) {
        alert(id)
    }
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: donghb
  Date: 2020/5/20
  Time: 6:06 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${applicationScope.APP_PATH}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${applicationScope.APP_PATH}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${applicationScope.APP_PATH}/css/main.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
        table tbody tr:nth-child(odd){background:#F4F4F4;}
        table tbody td:nth-child(even){color:#C00;}
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 用户维护</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li style="padding-top:8px;">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i> 张三 <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><i class="glyphicon glyphicon-cog"></i> 个人设置</a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-comment"></i> 消息</a></li>
                            <li class="divider"></li>
                            <li><a href="index.html"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                        </ul>
                    </div>
                </li>
                <li style="margin-left:10px;padding-top:8px;">
                    <button type="button" class="btn btn-default btn-danger">
                        <span class="glyphicon glyphicon-question-sign"></span> 帮助
                    </button>
                </li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <ul style="padding-left:0px;" class="list-group">
                    <li class="list-group-item tree-closed" >
                        <a href="main.html"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a>
                    </li>
                    <li class="list-group-item">
                        <span><i class="glyphicon glyphicon glyphicon-tasks"></i> 权限管理 <span class="badge" style="float:right">3</span></span>
                        <ul style="margin-top:10px;">
                            <li style="height:30px;">
                                <a href="user.html" style="color:red;"><i class="glyphicon glyphicon-user"></i> 用户维护</a>
                            </li>
                            <li style="height:30px;">
                                <a href="role.html"><i class="glyphicon glyphicon-king"></i> 角色维护</a>
                            </li>
                            <li style="height:30px;">
                                <a href="permission.html"><i class="glyphicon glyphicon-lock"></i> 许可维护</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed">
                        <span><i class="glyphicon glyphicon-ok"></i> 业务审核 <span class="badge" style="float:right">3</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="auth_cert.html"><i class="glyphicon glyphicon-check"></i> 实名认证审核</a>
                            </li>
                            <li style="height:30px;">
                                <a href="auth_adv.html"><i class="glyphicon glyphicon-check"></i> 广告审核</a>
                            </li>
                            <li style="height:30px;">
                                <a href="auth_project.html"><i class="glyphicon glyphicon-check"></i> 项目审核</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed">
                        <span><i class="glyphicon glyphicon-th-large"></i> 业务管理 <span class="badge" style="float:right">7</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="cert.html"><i class="glyphicon glyphicon-picture"></i> 资质维护</a>
                            </li>
                            <li style="height:30px;">
                                <a href="type.html"><i class="glyphicon glyphicon-equalizer"></i> 分类管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="process.html"><i class="glyphicon glyphicon-random"></i> 流程管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="advertisement.html"><i class="glyphicon glyphicon-hdd"></i> 广告管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="message.html"><i class="glyphicon glyphicon-comment"></i> 消息模板</a>
                            </li>
                            <li style="height:30px;">
                                <a href="project_type.html"><i class="glyphicon glyphicon-list"></i> 项目分类</a>
                            </li>
                            <li style="height:30px;">
                                <a href="tag.html"><i class="glyphicon glyphicon-tags"></i> 项目标签</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed" >
                        <a href="param.html"><i class="glyphicon glyphicon-list-alt"></i> 参数管理</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="form" style="float:left;">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">查询条件</div>
                                <input class="form-control has-success" id="queryConditionId" type="text" placeholder="请输入查询条件">
                            </div>
                        </div>
                        <button type="button" class="btn btn-warning" id="btnId"><i class="glyphicon glyphicon-search"></i> 查询</button>
                    </form>
                    <button type="button" class="btn btn-danger" style="float:right;margin-left:10px;" onclick="deleteBatch()"><i class=" glyphicon glyphicon-remove" ></i> 删除</button>
                    <button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='${applicationScope.APP_PATH}/user/add.htm'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <table class="table  table-bordered">
                            <thead>
                            <tr >
                                <th width="30">#</th>
                                <th width="30"><input type="checkbox" onclick="allCheck(this)"></th>
                                <th>账号</th>
                                <th>名称</th>
                                <th>邮箱地址</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%--<tr>
                                <td>1</td>
                                <td><input type="checkbox"></td>
                                <td>Lorem</td>
                                <td>ipsum</td>
                                <td>dolor</td>
                                <td>
                                    <button type="button" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>
                                    <button type="button" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>
                                    <button type="button" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>
                                </td>
                            </tr>--%>
                            </tbody>
                            <tfoot>
                            <tr >
                                <td colspan="6" align="center">
                                    <ul class="pagination">
                                        <li class="disabled"><a href="#">上一页</a></li>
                                        <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li><a href="#">下一页</a></li>
                                    </ul>
                                </td>
                            </tr>

                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${applicationScope.APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
<script src="${applicationScope.APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script src="${applicationScope.APP_PATH}/jquery/layer/layer.js"></script>
<script src="${applicationScope.APP_PATH}/script/docs.min.js"></script>
<script type="text/javascript">
    $(function () {
        $(".list-group-item").click(function(){
            if ( $(this).find("ul") ) {
                $(this).toggleClass("tree-closed");
                if ( $(this).hasClass("tree-closed") ) {
                    $("ul", this).hide("fast");
                } else {
                    $("ul", this).show("fast");
                }
            }
        });


        /**
         * 思路：
         *    1.首先是先将数据列表的轮廓展示出来，然后数据通过ajax的方式
         *      偷偷的将数据查询出来，如果数量很大需要很长时间的话，可以通过
         *      动态的加载的方式来展示这些数据。
         *
         *   2.获取这些数据后，将其拼接到tBody的标签中：
         */
        var layers = -1;

        $.ajax({
            type:'POST',
            url:'${applicationScope.APP_PATH}/user/findUserList.do',
            data:{},
            dataType:'json',
            beforeSend:function () {
                //如果是form表单的话，是对数据的验证：
                //如果是列表的话，那么就显示加载中
                layers = layer.msg('加载中。。。', {
                    icon: 16,
                    shade: 0.2,
                    time: false
                });
            },
            /*车工*/
            success:function (value) {
                layer.close(layers)
                var str = '';
                $.each(value.data,function (i,e) {
                    str+=
                        '<tr>' +
                            '<td>'+(i + 1)+'</td>' +
                            /*'<td><input type="checkbox" id="allId"></td>' +*/
                            '<td><input type="checkbox" id='+e.id+'></td>' +
                            '<td>'+e.loginacct+'</td>' +
                            '<td>'+e.username+'</td>' +
                            '<td>'+e.email+'</td>' +
                            '<td>' +
                                '<button type="button" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>' +
                                '<button type="button" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>' +
                                '<button type="button" class="btn btn-primary btn-xs" id="delId" onclick="del('+e.id+')"><i class=" glyphicon glyphicon-remove"></i></button>' +
                            '</td>' +
                        '</tr>'
                });
                //将str添加到tbody中：
                $("tbody").append(str);
            }
        });


        var layersstatus = -1;
        //模糊查询：此时只有该记录中的某个字段含有这个值就应该讲该数据显示出来：
        //给查询按钮绑定一个点击事件：
        $("#btnId").click(function () {
            //获取输入框中的值：
            var inputVal = $("#queryConditionId").val();
            $.ajax({
                type:'POST',
                url:'${applicationScope.APP_PATH}/user/findUserList.do',
                data:{
                    condition:inputVal
                },
                dataType:'json',
                beforeSend:function () {
                    //一般是对数据的验证：
                    layersstatus = layer.msg('加载中。。。', {
                        icon: 16,
                        shade: 0.2,
                        time: false
                    });
                },
                /*成功！*/
                success:function (value) {
                    //将原来的tbody下tr清空,否则就会造成查询一条数据，列表中就会多一条数据。
                    $("tbody tr").remove();
                    var str = '';
                    layer.close(layersstatus);
                    //仍然是将结果拼接到tbody中：
                    $.each(value.data,function (i,e) {
                        str+=
                            '<tr>' +
                            '<td>'+(i + 1)+'</td>' +
                            '<td><input type="checkbox"></td>' +
                            '<td>'+e.loginacct+'</td>' +
                            '<td>'+e.username+'</td>' +
                            '<td>'+e.email+'</td>' +
                            '<td>' +
                            '<button type="button" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>' +
                            '<button type="button" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>' +
                            '<button type="button" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>' +
                            '</td>' +
                            '</tr>'
                    });
                    //将str添加到tbody中：
                    $("tbody").append(str);
                }
            })

        });



    });

    /**页面的动态的选中：*/
    function allCheck(val) {
        //使用id这种选择器容易失效：
        /*$("#allId").attr("checked",val.checked);*/
        //只有第一次才会生效：
        // $("tbody :checkbox").attr("checked",val.checked);

        //遍历赋值，才会生效：
        var checkList = $("tbody :checkbox");
        $("tbody :checkbox").each(function (i,e) {
            e.checked = val.checked;
        });

    }


    //批量删除：
    function deleteBatch() {
        alert(".....");
        debugger;
        //a：获取选中的id值：
        var checkList = $("tbody :checkbox");
        var ids = {};
        $("tbody :checkbox").each(function (i,e) {
            ids[i] = e.id;
        });

        layer.confirm("确认要删除这个用户吗?",  {icon: 3, title:'提示'}, function(cindex){

            //发送ajax请求：
            var layers = -1;
            $.ajax({
                type:'POST',
                url:'${applicationScope.APP_PATH}/user/deleteBatchWithUser.do',
                data:{ids,ids},
                dataType:'json',
                before:function () {
                    layers = layer.msg('加载中。。。', {
                        icon: 16,
                        shade: 0.2,
                        time: false
                    });
                },
                success:function (value) {
                    layer.close(layers);
                    if (value.resultBool) {
                        layer.msg("删除成功", {time:1000, icon:4, shift:6});
                        window.location.href = "${applicationScope.APP_PATH}/user/user.htm";
                    } else {
                        layer.msg("删除失败", {time:1000, icon:5, shift:6});
                    }

                }
            });
        },function(cindex){
            layer.close(layers);
        })
    }


    //起作用的删除：
    function del(id){
        //获取选中
        var result = $("tbody :checked");
        if (result.length == 0) {
            layer.msg("请选中要删除的数据！", {time:1000, icon:5, shift:6});
        } else if (result.length > 1 ) {
            layer.msg("最多选中一条数据进行删除！", {time:1000, icon:5, shift:6});
        } else {
            //执行删除的请求：
            var cindex = -1;
            //避免误操作删除：
            layer.confirm("确认要删除这个用户吗?",  {icon: 3, title:'提示'}, function(cindex){
                $.ajax({
                    type:'POST',
                    url: '${applicationScope.APP_PATH}/user/deleteUserById.do',
                    data:{id,id},
                    success:function (value) {
                        layer.close(cindex);
                        if (value.resultBool) {
                            layer.msg("删除成功", {time:1000, icon:4, shift:6});
                            window.location.href = "${applicationScope.APP_PATH}/user/user.htm";
                        } else {
                            layer.msg("删除失败", {time:1000, icon:5, shift:6});
                        }
                    }
                });
            },function(cindex){
                layer.close(cindex);
            })
        }
    }


    //删除：这个方式绑定单击事件失效：
    $("#delId").click(function () {
        debugger;
    });

    $("tbody .btn-success").click(function(){
        window.location.href = "assignRole.html";
    });
    $("tbody .btn-primary").click(function(){
        window.location.href = "edit.html";
    });
</script>
</body>
</html>


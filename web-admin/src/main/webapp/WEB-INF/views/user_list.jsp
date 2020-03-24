<%--
  Created by IntelliJ IDEA.
  User: Ricardo
  Date: 2019-10-24
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>

<!DOCTYPE html>
<head>
    <title>RobotShop|Manage </title>
    <jsp:include page="../includes/header.jsp"></jsp:include>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

    <!-- Navbar -->
    <jsp:include page="../includes/nav.jsp"/>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <jsp:include page="../includes/sidebar.jsp"/>
    <!-- /.Main Sidebar Container -->

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">用户管理</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">首页</a></li>
                            <li class="breadcrumb-item active">控制面板</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <!-- /.row -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">用户列表</h3>
                                <div class="card-tools">
                                    <table>
                                        <tr>
                                            <th>
                                                <button type="button" class="btn btn-sm btn-default" onclick="window.location.href='user_form'"><i
                                                        class="fa fa-plus" ></i> 添加
                                                </button>&nbsp;
                                            </th>
                                            <th>
                                                <button type="button" class="btn btn-sm btn-danger"
                                                        onclick="App.deleteMulti('/delete')"><i class="fa fa-trash"></i>
                                                    批量删除
                                                </button>&nbsp;
                                            </th>
                                            <th>
                                                <button type="button" class="btn btn-sm btn-info"><i
                                                        class="fa fa-download"></i> 导入
                                                </button>&nbsp;
                                            </th>
                                            <th>
                                                <button type="button" class="btn btn-sm btn-info"><i
                                                        class="fa fa-upload"></i> 导出
                                                </button>&nbsp;
                                            </th>
                                            <th>
                                                <form action="search" method="post"<%-- style="margin-top: 16px"--%>>
                                                    <div class="input-group input-group-sm" style="width: 150px;">
                                                        <input type="text" name="search"
                                                               class="form-control float-right" placeholder="搜索">
                                                        <div class="input-group-append">
                                                            <button type="submit" class="btn btn-default"><i
                                                                    class="fas fa-search"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </th>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body table-responsive p-0">
                                <table id="dataTable" class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th><input type="checkbox" class="minimal icheck_master"/></th>
                                        <th>ID</th>
                                        <th>用户名</th>
                                        <th>手机号</th>
                                        <th>邮箱</th>
                                        <th>QQ</th>
                                        <th>上次修改时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%--<div class="alert alert-success alert-dismissible" ${baseResult.message == null ? "style='display:none;'" : ""}>
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                                            &times;
                                        </button>
                                        ${baseResult.message}
                                    </div>
                                    <c:forEach items="${users}" var="users">
                                        <tr>
                                            <td>
                                                <input type="checkbox" class="minimal" id="${users.userId}"/>
                                            </td>
                                            <td>${users.userId}</td>
                                            <td>${users.userName}</td>
                                            <td>${users.userPhone}</td>
                                            <td>${users.userEmail}</td>
                                            <td>${users.userQQ}</td>
                                            <td>${users.userUpdated}</td>
                                            <td>
                                                <button type="button" class="btn btn-sm btn-default"><i
                                                        class="fa fa-search"></i> 查看
                                                </button>&nbsp;
                                                <button type="button" class="btn btn-sm btn-primary"><i
                                                        class="fa fa-edit"></i> 编辑
                                                </button>&nbsp;
                                                <button type="button" class="btn btn-sm btn-danger"><i
                                                        class="fa fa-trash"></i> 删除
                                                </button>&nbsp;
                                            </td>
                                        </tr>
                                    </c:forEach>--%>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
                <!-- /.row -->
            </div>
        </section>
    </div>

</div>
<jsp:include page="../includes/footer.jsp"/>

<!-- 自定义模态框 -->
<sys:modal/>


<script>
    var _dataTable;

    $(function () {
        var _columns = [
            {
                "data": function (row, type, val, meta) {
                    return '<input id="' + row.userId + '" type="checkbox" class="minimal" />';
                }
            },
            {"data": "userId"},
            {"data": "userName"},
            {"data": "userPhone"},
            {"data": "userEmail"},
            {"data": "userQQ"},/*
            {"data": "userUpdated"},*/
            { "data":
                    function(obj){
                        return getMyDate(obj.userUpdated)//update_time是实体类的属性
                    }
            },
            {
                "data": function (row, type, val, meta) {
                    var detailUrl = "detail?id=" + row.userId;
                    var deleteUrl = "delete";
                    return '<button type="button" class="btn btn-sm btn-default" onclick="App.showDetail(\'' + detailUrl + '\');"><i class="fa fa-search"></i> 查看</button>&nbsp;&nbsp;&nbsp;' +
                        '<a href="user_form?id=' + row.userId + '" type="button" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i> 编辑</a>&nbsp;&nbsp;&nbsp;' +
                        '<button type="button" class="btn btn-sm btn-danger" onclick="App.deleteSingle(\'' + deleteUrl + '\', \'' + row.userId + '\')"><i class="fa fa-trash-o"></i> 删除</button>';
                }
            }
        ];
        console.log("aaaaaaaaaa");console.log(_columns);
        _dataTable = App.initDataTables("page", _columns);console.log("bbbbb");
    });

    function getMyDate(time){
        if(typeof(time)=="undefined"){
            return "";
        }
        var oDate = new Date(time),
            oYear = oDate.getFullYear(),
            oMonth = oDate.getMonth()+1,
            oDay = oDate.getDate(),
            oHour = oDate.getHours(),
            oMin = oDate.getMinutes(),
            oSen = oDate.getSeconds(),
            oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间

        return oTime;
    };

    //补0操作,当时间数据小于10的时候，给该数据前面加一个0
    function getzf(num){
        if(parseInt(num) < 10){
            num = '0'+num;
        }
        return num;
    }

/*    function search() {
        var username = $("#username").val();
        var phone = $("#phone").val();
        var email = $("#email").val();

        var param = {
            "username": username,
            "phone": phone,
            "email": email
        };

        _dataTable.settings()[0].ajax.data = param;
        _dataTable.ajax.reload();
    }*/
</script>
</body>
</html>

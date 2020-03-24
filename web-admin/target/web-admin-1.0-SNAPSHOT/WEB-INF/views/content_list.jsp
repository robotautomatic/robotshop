<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>

<!DOCTYPE html>
<html>
<head>
    <title>RobotShop | 内容管理</title>
    <jsp:include page="../includes/header.jsp"/>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

    <!-- Navbar -->
    <jsp:include page="../includes/nav.jsp"/>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <jsp:include page="../includes/sidebar.jsp"/>
    <!-- /.Main Sidebar Container -->

    <!-- Content Wrapper. Contains page content -->
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
                    <div class="col-xs-12">
                        <c:if test="${baseResult != null}">
                            <div class="alert alert-${baseResult.status == 200 ? "success" : "danger"} alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;
                                </button>
                                    ${baseResult.message}
                            </div>
                        </c:if>

                        <div class="box box-info box-info-search" style="display: none;">
                            <div class="box-header">
                                <h3 class="box-title">高级搜索</h3>
                            </div>

                            <div class="box-body">
                                <div class="row form-horizontal">
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <label for="title" class="col-sm-4 control-label">标题</label>

                                            <div class="col-sm-8">
                                                <input id="title" class="form-control" placeholder="标题"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <label for="subTitle" class="col-sm-4 control-label">子标题</label>

                                            <div class="col-sm-8">
                                                <input id="subTitle" class="form-control" placeholder="子标题"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <label for="titleDesc" class="col-sm-4 control-label">标题描述</label>

                                            <div class="col-sm-8">
                                                <input id="titleDesc" class="form-control" placeholder="标题描述"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="box-footer">
                                <button type="button" class="btn btn-info pull-right" onclick="search();">搜索</button>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">内容列表</h3>
                                <div class="card-tools">
                                    <table>
                                        <tr>
                                            <th>
                                                <button type="button" class="btn btn-sm btn-default"
                                                        onclick="window.location.href='/content/form'"><i
                                                        class="fa fa-plus"></i> 添加
                                                </button>&nbsp;
                                            </th>
                                            <th>
                                                <button type="button" class="btn btn-sm btn-danger"
                                                        onclick="App.deleteMulti('/content/delete')"><i
                                                        class="fa fa-trash"></i>
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
                                                <button type="button" class="btn btn-sm btn-info"
                                                        onclick="$('.box-info-search').css('display') == 'none' ? $('.box-info-search').show('fast') : $('.box-info-search').hide('fast')">
                                                    <i
                                                            class="fas fa-search"></i> 搜索
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

                                    <%--
                                                                <a href="/content/form" type="button" class="btn btn-sm btn-default"><i class="fa fa-plus"></i> 新增</a>&nbsp;&nbsp;&nbsp;
                                                                <button type="button" class="btn btn-sm btn-default" onclick="App.deleteMulti('/content/delete')"><i class="fa fa-trash-o"></i> 删除</button>&nbsp;&nbsp;&nbsp;
                                                                <a href="#" type="button" class="btn btn-sm btn-default"><i class="fa fa-download"></i> 导入</a>&nbsp;&nbsp;&nbsp;
                                                                <a href="#" type="button" class="btn btn-sm btn-default"><i class="fa fa-upload"></i> 导出</a>&nbsp;&nbsp;&nbsp;
                                                                <button type="button" class="btn btn-sm btn-primary" onclick="$('.box-info-search').css('display') == 'none' ? $('.box-info-search').show('fast') : $('.box-info-search').hide('fast')"><i class="fa fa-search"></i> 搜索</button>
                                                          --%>
                                </div>

                                <!-- /.box-header -->
                                <div class="card-body table-responsive p-0">
                                    <table id="dataTable" class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th><input type="checkbox" class="minimal icheck_master"/></th>
                                            <th>ID</th>
                                            <th>所属分类</th>
                                            <th>标题</th>
                                            <th>子标题</th>
                                            <th>标题描述</th>
                                            <th>链接</th>
                                            <th>图片1</th>
                                            <th>图片2</th>
                                            <th>更新时间</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <jsp:include page="../includes/copyright.jsp"/>
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
                    return '<input id="' + row.id + '" type="checkbox" class="minimal" />';
                }
            },
            {"data": "id"},
            {"data": "tbContentCategory.name"},
            {"data": "title"},
            {"data": "subTitle"},
            {"data": "titleDesc"},
            {
                "data": function (row, type, val, meta) {
                    if (row.url == null) {
                        return '';
                    }

                    return '<a href="' + row.url + '" target="_blank">查看</a>';
                }
            },
            {
                "data": function (row, type, val, meta) {
                    if (row.pic == null) {
                        return '';
                    }

                    return '<a href="' + row.pic + '" target="_blank">查看</a>';
                }
            },
            {
                "data": function (row, type, val, meta) {
                    if (row.pic2 == null) {
                        return '';
                    }

                    return '<a href="' + row.pic2 + '" target="_blank">查看</a>';
                }
            },
            {
                "data": function (row, type, val, meta) {
                    return DateTime.format(row.updated, "yyyy-MM-dd HH:mm:ss");
                }
            },
            {
                "data": function (row, type, val, meta) {
                    var detailUrl = "/content/detail?id=" + row.id;
                    var deleteUrl = "/content/delete";
                    return '<button type="button" class="btn btn-sm btn-default" onclick="App.showDetail(\'' + detailUrl + '\');"><i class="fa fa-search"></i> 查看</button>&nbsp;&nbsp;&nbsp;' +
                        '<a href="/content/form?id=' + row.id + '" type="button" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i> 编辑</a>&nbsp;&nbsp;&nbsp;' +
                        '<button type="button" class="btn btn-sm btn-danger" onclick="App.deleteSingle(\'' + deleteUrl + '\', \'' + row.id + '\')"><i class="fa fa-trash-o"></i> 删除</button>';
                }
            }
        ];

        _dataTable = App.initDataTables("/content/page", _columns);

    });

    function search() {
        var title = $("#title").val();
        var subTitle = $("#subTitle").val();
        var titleDesc = $("#titleDesc").val();

        var param = {
            "title": title,
            "subTitle": subTitle,
            "titleDesc": titleDesc
        };

        _dataTable.settings()[0].ajax.data = param;
        _dataTable.ajax.reload();
    }
</script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>

<!DOCTYPE html>
<html>
<head>
    <title>RobotShop | 内容管理</title>
    <jsp:include page="../includes/header.jsp"></jsp:include>
    <link rel="stylesheet" href="/static/assets/plugins/treeTable/themes/vsStyle/treeTable.min.css"/>
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
                        <h1 class="m-0 text-dark">内容管理</h1>
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
                        <c:if test="${baseResult != null}">
                            <div class="alert alert-${baseResult.status == 200 ? "success" : "danger"} alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;
                                </button>
                                    ${baseResult.message}
                            </div>
                        </c:if>

                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="box-title">分类列表</h3>
                                    <div class="card-tools">
                                        <table>
                                            <tr>
                                                <th>
                                                    <button type="button" class="btn btn-sm btn-default"
                                                            onclick="window.location.href='/content/category/form'"><i
                                                            class="fa fa-plus"></i> 添加
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
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                                <!-- /.box-header -->
                                <div class="card-body table-responsive p-0">
                                    <table id="treeTable" class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>名称</th>
                                            <th>排序</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${tbContentCategories}" var="tbContentCategory">
                                            <tr id="${tbContentCategory.id}" pId="${tbContentCategory.parent.id}">
                                                <td>${tbContentCategory.id}</td>
                                                <td>${tbContentCategory.name}</td>
                                                <td>${tbContentCategory.sortOrder}</td>
                                                <td>
                                                    <a href="/content/category/form?id=${tbContentCategory.id}"
                                                       type="button" class="btn btn-sm btn-primary"><i
                                                            class="fa fa-edit"></i> 编辑</a>&nbsp;&nbsp;&nbsp;
                                                    <button type="button" class="btn btn-sm btn-danger"
                                                            onclick="App.deleteSingle('/content/category/delete', '${tbContentCategory.id}', '警告：该删除操作会将包括选中类目在内的全部子类目及属于类目的内容一并删除，请谨慎操作！您还确定继续吗？')">
                                                        <i class="fa fa-trash-o"></i> 删除
                                                    </button>&nbsp;&nbsp;&nbsp;
                                                    <a href="/content/category/form?parent.id=${tbContentCategory.id}&parent.name=${tbContentCategory.name}"
                                                       type="button" class="btn btn-sm btn-default"><i
                                                            class="fa fa-plus"></i> 添加下级菜单</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
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
<script src="/static/assets/plugins/treeTable/jquery.treeTable.min.js"></script>

<!-- 自定义模态框 -->
<sys:modal/>

<%--<script>
    $(function () {
        $('#treeTable').treeTable({
            column: 1,
            expandLevel: 2
        });
    });
</script>--%>
</body>
</html>
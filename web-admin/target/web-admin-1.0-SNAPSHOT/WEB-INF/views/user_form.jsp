<%--
  Created by IntelliJ IDEA.
  User: Ricardo
  Date: 2019-10-24
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                        <h1 class="m-0 text-dark">${user.userId == null ? "新增":"编辑"}用户</h1>
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
            <!-- Horizontal Form -->
            <div class="card card-info">
                <div class="card-header">
                    <h3 class="card-title">${user.userId == null ? "新增" : "编辑"}用户</h3>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                <form:form id="inputForm" class="form-horizontal" action="saveUser" method="post" modelAttribute="user">
                    <div class="card-body">
                        <div class="alert alert-danger alert-dismissible" ${baseResult.message == null ? "style='display:none;'" : ""}>
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            ${baseResult.message}
                        </div>
                        <form:hidden path="userId" />
                        <div class="form-group row ">
                            <label for="userName" class="col-sm-2 col-form-label">用户名：</label>
                            <div class="col-sm-10">
                                <form:input path="userName" cssClass="form-control required " placeholder="请输入用户名"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="userPassword" class="col-sm-2 col-form-label">密码：</label>
                            <div class="col-sm-10">
                                <form:input path="userPassword" type="password" cssClass="form-control required" placeholder="请输入密码"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="userPhone" class="col-sm-2 col-form-label">手机：</label>
                            <div class="col-sm-10">
                                <form:input path="userPhone" cssClass="form-control" placeholder="请输入手机号"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="userEmail" class="col-sm-2 col-form-label">邮箱：</label>
                            <div class="col-sm-10">
                                <form:input path="userEmail" cssClass="form-control" placeholder="请输入邮箱地址"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="userQQ" class="col-sm-2 col-form-label">QQ：</label>
                            <div class="col-sm-10">
                                <form:input path="userQQ" cssClass="form-control" placeholder="请输入QQ号"/>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <button type="button    " class="btn btn-default" onclick="history.go(-1);">返回</button>
                        <button type="submit" class="btn btn-info float-right">提交</button>
                    </div>
                    <!-- /.card-footer -->
                </form:form>
            </div>
            <!-- /.card -->
        </section>
    </div>

</div>
<jsp:include page="../includes/footer.jsp"/>
</body>
</html>

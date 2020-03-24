    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<!-- Head Begin -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的商城 | 登录</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--    <!-- Bootstrap 3.3.7 -->
        <link rel="stylesheet" href="/static/assets/bower_components/bootstrap/dist/css/bootstrap.min.css"/>--%>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/static/assets/plugins/fontawesome-free/css/all.min.css"/>
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"/>
    <!-- Theme style -->
    <link rel="stylesheet" href="static/assets/css/adminlte.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="/static/assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
</head>
<!-- ./Head End -->

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="#">我的商城</a>
    </div>
    <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">欢迎管理员登录</p>

            <form action="/login" method="post">
                <div class="alert alert-danger alert-dismissible" ${message == null ? "style='display:none;'" : ""}>
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    ${message}
                </div>
                <div class="input-group mb-3">
                    <input name="userName" type="text" class="form-control" placeholder="用户名" value="${email}">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input name="userPassword" type="password" class="form-control" placeholder="密码" value="${password}">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-8">
                        <div class="icheck-primary">
                            <input type="checkbox" id="remember">
                            <label for="remember">
                                记住我
                            </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-4">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <a href="#">忘记密码？</a><br>
        </div>
        <!-- /.login-card-body -->
    </div>
</div>

<!-- jQuery -->
<script src="/static/assets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/static/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/static/assets/js/adminlte.min.js"></script>
<%--<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' /* optional */
        });
    });
</script>--%>
</body>
</html>

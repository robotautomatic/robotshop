<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
    <div class="col-xs-6">
        <dl>
            <dt>用户名：</dt>
            <dd>${user.userName}</dd>
            <br />

            <dt>手机：</dt>
            <dd>${user.userPhone}</dd>
            <br />

            <dt>邮箱：</dt>
            <dd>${user.userEmail}</dd>
            <br />

            <dt>QQ：</dt>
            <dd>${user.userQQ}</dd>
            <br />
        </dl>


        <dl>
            <dt>创建时间：</dt>
            <dd><fmt:formatDate value="${user.userCreated}" pattern="yyyy-MM-dd HH:mm:ss"/></dd>
            <br />

            <dt>更新时间：</dt>
            <dd><fmt:formatDate value="${user.userUpdated}" pattern="yyyy-MM-dd HH:mm:ss"/></dd>
        </dl>
    </div>
</div>
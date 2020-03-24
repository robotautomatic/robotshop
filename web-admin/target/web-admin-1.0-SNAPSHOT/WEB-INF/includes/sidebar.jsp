<%--
  Created by IntelliJ IDEA.
  User: Ricardo
  Date: 2019-10-27
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="uri" value="${requestScope['javax.servlet.forward.request_uri']}" />
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
        <img src="/static/assets/img/AdminLTELogo.png" alt="Logo" class="brand-image img-circle elevation-3"
             style="opacity: .8">
        <span class="brand-text font-weight-light">RobotShop</span>
    </a>

    <!-- Sidebar -->
        <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="/static/assets/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block">${sessionScope.user.userName}</a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->

                <li class="nav-item has-treeview menu-open">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-circle"></i>
                        <p>
                            功能菜单
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview" >
                        <li class="nav-item has-treeview ${((uri == "/user_list") or (uri == "/user_form")) ? "menu-open" : "menu-close"}">
                            <a href="#" class="nav-link ${((uri == "/user_list") or (uri == "/user_form")) ? "active" : ""}">
                                &nbsp;&nbsp;<i class="far fa-circle nav-icon"></i>
                                <p>
                                    用户管理
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview" >
                                <li class="nav-item">
                                    <a href="/user_list" class="nav-link ${uri == "/user_list" ? "active" : ""} ">
                                        &nbsp;&nbsp;&nbsp;&nbsp;<i class="far fa-dot-circle nav-icon"></i>
                                        <p>用户列表</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/user_form" class="nav-link ${uri == "/user_form" ? "active" : ""} ">
                                        &nbsp;&nbsp;&nbsp;&nbsp;<i class="far fa-dot-circle nav-icon"></i>
                                        <p>新增用户</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav nav-treeview" >
                        <li class="nav-item has-treeview ${((uri == "/content/category/list") or (uri == "/content/list")) ? "menu-open" : "menu-close"}">
                            <a href="#" class="nav-link ${((uri == "/content/category/list") or (uri == "/content/list")) ? "active" : ""}">
                                &nbsp;&nbsp;<i class="far fa-circle nav-icon"></i>
                                <p>
                                    内容管理
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview" >
                                <li class="nav-item">
                                    <a href="/content/category/list" class="nav-link ${uri == "/content/category/list" ? "active" : ""} ">
                                        &nbsp;&nbsp;&nbsp;&nbsp;<i class="far fa-dot-circle nav-icon"></i>
                                        <p>内容分类</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/content/list" class="nav-link ${uri == "/content/list" ? "active" : ""} ">
                                        &nbsp;&nbsp;&nbsp;&nbsp;<i class="far fa-dot-circle nav-icon"></i>
                                        <p>内容列表</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</aside>
<%--
                        <i class="nav-icon fas fa-user-alt"></i>
                        <ion-icon name="add"></ion-icon>
                        style="display: none;"
                        ${pageContext.request.getAttribute("javax.servlet.forward.request_uri")}
                         ${requestScope['javax.servlet.forward.request_uri']}
--%>
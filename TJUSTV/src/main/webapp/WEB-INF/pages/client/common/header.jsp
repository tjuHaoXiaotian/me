<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <script src="${pageContext.request.contextPath}/client/js/jquery-2.2.2.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <script src="${pageContext.request.contextPath}/client/js/jquery.cookie/jquery.cookie.js"></script>
  <script src="${pageContext.request.contextPath}/client/js/myJS.js"></script>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/new.css">
  <title>TJUSTV</title>
</head>
<body>
<!--header-->
<div id="header">
  <div id="header_left">
    <h1>TJUSTV</h1>
    <h2 id="toIndex">主页</h2>
    <h2 id="toSTV">学视专栏</h2>
  </div>
  <div id="header_right">
    <input type="text" placeholder="搜我O(∩_∩)O" id="searchInput">
    <button type="button" id="searchBtn">搜索</button>
    <button type="button" id="login" data-toggle="modal" data-target=".bs-example-modal-sm">登录</button>
    <%--<div id="loginTable" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">--%>
    <%--<div class="modal-dialog modal-sm">--%>
    <%--<div class="modal-content">--%>
    <%--<div class="modal-header">--%>
    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
    <%--<h4 class="modal-title" id="myModalLabel">请登录</h4>--%>
    <%--</div>--%>
    <%--<div class="modal-body">--%>
    <%--<form>--%>
    <%--<div class="form-group">--%>
    <%--<label for="userName">用户名</label>--%>
    <%--<input type="text" class="form-control" id="username" placeholder="用户名">--%>
    <%--</div>--%>
    <%--<div class="form-group">--%>
    <%--<label for="password">密码</label>--%>
    <%--<input type="password" class="form-control" id="password" placeholder="密码">--%>
    <%--</div>--%>
    <%--<span id="loginInfo" class="text-danger"></span>--%>
    <%--</form>--%>
    <%--</div>--%>
    <%--<div class="modal-footer">--%>
    <%--<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>--%>
    <%--<button type="button" class="btn" id="btn-login">登录</button>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
  </div>
</div>
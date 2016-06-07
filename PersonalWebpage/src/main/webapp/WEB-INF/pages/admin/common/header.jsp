<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<!doctype html>
<html class="no-js fixed-layout">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HaoXiaotian</title>
  <meta name="description" content="郝晓田的个人主页">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <%--<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/i/top-logo.png">--%>
  <LINK REL="SHORTCUT ICON" HREF="<%=request.getContextPath()%>/resources/img/logo2.jpg">
  <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/assets/i/top-logo.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/admin.css">



  <%-- dataTable --%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/datatables/media/css/dataTables.bootstrap.min.css">


  <script>
    function logout(){
      $.ajax({
        url: "https://sso.tju.edu.cn/cas/logout?service=http://localhost:8080/StudentUnion/cas",
        type: 'get'
      }).success(function(data){;

      }).error(function(){
      });

      $.ajax({
        url: "${pageContext.request.contextPath}/logout",
        type: 'get'
      }).success(function(data){;

      }).error(function(){
      });


    }
  </script>
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <strong>郝晓田homepage</strong> <small>后台管理</small>
  </div>



  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-p
    dills am-topbar-nav am-topbar-right admin-header-list" style="width: 300px; height: 50.95px;">
      <%--<li style="display: inline;"><a href=""><span class="am-icon-envelope-o"></span> 收件箱 <span class="am-badge am-badge-warning">5</span></a></li>--%>
      <li class="am-dropdown" data-am-dropdown style="display: inline;">
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="">
          <span class="am-icon-users"></span> 管理员 :<shiro:principal/>
          <%--<span class="am-icon-caret-down"></span>--%>
        </a>
        <%--<ul class="am-dropdown-content">--%>
          <%--<li><a href="#"><span class="am-icon-user"></span> 资料</a></li>--%>
          <%--<li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>--%>
          <%--<li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>--%>
        <%--</ul>--%>
      </li>
      <li class="am-hide-sm-only" style="display: inline;"><a href="" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="${pageContext.request.contextPath}/"><span class="am-icon-home"></span>网站首页</a></li>

        <shiro:hasRole name="admin">
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav-index'}">首页<span  class="am-icon-angle-right  am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav-index">
            <li><a href="${pageContext.request.contextPath}/admin/index"><span class="am-icon-home"></span>首页大图</a></li>
          </ul>
        </li>
        </shiro:hasRole>

        <shiro:hasRole name="admin">
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav-client'}">我的文章 <span  class="am-icon-angle-right  am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav-client">
            <li><a href="${pageContext.request.contextPath}/admin" class="am-cf"><span class="am-icon-table"></span> 文章列表</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/new"><span class="am-icon-plus-circle"></span> 发布文章</a></li>
          </ul>
        </li>
        </shiro:hasRole>

        <shiro:hasRole name="admin">
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav-video'}"> 文章类别<span class="am-icon-angle-right  am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav-video">
            <li><a href="${pageContext.request.contextPath}/admin/news?type=1" class="am-cf"><span class="am-icon-video-camera"></span> 学习</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/news?type=2"><span class="am-icon-upload"></span> 生活</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/news?type=3"><span class="am-icon-upload"></span> 感悟与成长</a></li>
            <%--<li><a href="admin-news-types.jsp"><span class="am-icon-upload"></span> 类别列表</a></li>--%>
            <%--<li><a href="${pageContext.request.contextPath}/resources/mng/newsTypes/new"><span class="am-icon-upload"></span> 添加类别</a></li>--%>
          </ul>
        </li>
        </shiro:hasRole>


        <li><a href="${pageContext.request.contextPath}/logout"><span class="am-icon-sign-out"></span> 注销</a></li>
      </ul>

      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><span class="am-icon-bookmark"></span> 郝晓田</p>
          <p>网站管理后台</p>
        </div>
      </div>

    </div>
  </div>
  <!-- sidebar end -->
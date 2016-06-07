<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <LINK REL="SHORTCUT ICON" HREF="<%=request.getContextPath()%>/resources/img/logo.jpg">
  <!--Import Google Icon Font-->
  <!--Import materialize.css-->
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material-icons.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/materialize.min.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css"  media="screen,projection"/>
  <!--Let browser know website is optimized for mobile-->
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>天津大学社团联合会</title>

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

<body class="grey lighten-4">
<ul id="slfw" class="dropdown-content red lighten-1">
  <li><a href="../class-room.jsp" class="white-text">审批教室</a></li>
  <li><a href="../meeting-room.jsp" class=" white-text">申请会议室</a></li>
  <li><a href="../place.jsp" class=" white-text">申请场地</a></li>
  <li><a href="../poster.jsp" class=" white-text">宣传品申请</a></li>
</ul>
<ul id="lxwm" class="dropdown-content red lighten-1">
  <li><a href="#!" class="white-text">商业合作</a></li>
  <li><a href="#!" class=" white-text">我为校园出点子</a></li>
</ul>
<nav>
  <div class="nav-wrapper red lighten-1">
    <ul class="right hide-on-med-and-down">
      <li><a href="${pageContext.request.contextPath}/index">首页</a></li>
      <%--<li><a href="badges.html">社团服务</a></li>--%>
      <%--<li><a class="dropdown-button" href="#!" data-activates="slfw">社团服务<i class="material-icons right">arrow_drop_down</i></a></li>--%>
      <li><a href="${pageContext.request.contextPath}/index/view/clubs">社团简介</a></li>
      <li><a href="${pageContext.request.contextPath}/index/view/join">加入社团</a></li>
      <%--<li><a class="dropdown-button" href="#!" data-activates="lxwm">联系我们<i class="material-icons right">arrow_drop_down</i></a></li>--%>
      <c:if test="${username == null}">

      </c:if>
      <c:choose>
        <c:when test="${username == null}">
          <li><a class="modal-trigger" href="${pageContext.request.contextPath}/admin">登录</a></li>
          <li><a href="">注册</a></li>
        </c:when>
        <c:otherwise>
          <li><a class="modal-trigger" >${username}</a></li>
          <li><a href="${pageContext.request.contextPath}/index/logout">注销</a></li>
        </c:otherwise>
      </c:choose>

    </ul>

    <div id="login-model" class="modal">
      <div class="modal-content" style="color:#333;">
        <h4>登录</h4>
        <form name="loginForm">
          <div class="row">
            <div class="col s6">
              <input id="username" name="account" type="text" class="validate">
              <label for="username">用户名</label>
            </div>
          </div>
          <div class="row">
            <div class="col s6">
              <input id="password" name="password" type="password" class="validate">
              <label for="password">密码</label>
            </div>
          </div>

        </form>

        <div class="modal-footer">
          <button onclick="login()" class="modal-action modal-close waves-effect waves-green btn-flat">登录</button>
        </div>
      </div>
    </div>

  </div>
</nav>




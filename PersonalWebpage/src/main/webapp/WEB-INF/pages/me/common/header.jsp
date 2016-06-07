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
  <LINK REL="SHORTCUT ICON" HREF="<%=request.getContextPath()%>/resources/img/logo2.jpg">
  <!--Import Google Icon Font-->
  <!--Import materialize.css-->
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/bower_components/bootstrap/dist/css/bootstrap.min.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/app/app.css"  media="screen,projection"/>
  <!--Let browser know website is optimized for mobile-->
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>HaoXiaotian</title>

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

<body class="home-template">
<header class="main-header " style="background-image: url(<%=request.getContextPath()%>/resources/img/logo-background.jpg);background-repeat: no-repeat;background-position:center 73%;background-attachment: scroll;">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <a class="branding" href="http://www.haoxiaotian.cn" title="Jack的个人主页">
          <img src="<%=request.getContextPath()%>/resources/img/logo2.jpg">
          <h3 style="color: #ffffff;">
            HaoXiaotian
          </h3>
          <h4 style="color: #ffffff;">
            天津大学  ·  软件学院  ·  2013 级软件工程专业
          </h4>
        </a>
      </div>
    </div>
  </div>
</header>





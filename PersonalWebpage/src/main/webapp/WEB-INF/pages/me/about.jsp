<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<%@include file="common/header.jsp" %>

<nav class="main-navigation">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="navbar-header">
                        <span class="nav-toggle-button collapsed" data-toggle="collapse" data-target="#main-menu">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-bars"></i>
                        </span>
                </div>
                <div class="collapse navbar-collapse" id="main-menu">
                    <ul class="menu">
                        <li  role="presentation">  <!-- nav-current 下面的那条线 -->
                            <a href="${pageContext.request.contextPath}/index.html">首页</a>
                        </li>
                        <li  role="presentation">
                            <a href="${pageContext.request.contextPath}/projects.html">项目</a>
                        </li>
                        <li  role="presentation" class="nav-current">
                            <a href="${pageContext.request.contextPath}/articles.html">文章</a>
                        </li>
                        <li  role="presentation">
                            <a href="http://www.cnblogs.com/1995hxt/">博客</a>
                        </li>
                        <li role="presentation">
                            <a href="https://github.com/tjuHaoXiaotian">github</a>
                        </li>
                        <li role="presentation">
                            <a href="${pageContext.request.contextPath}/resources/resume_java.pdf">简历</a>
                        </li>
                        <c:choose>
                            <c:when test="${user== null}">
                                <li role="presentation" >
                                    <a class="modal-trigger" href="${pageContext.request.contextPath}/admin">登录</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li role="presentation" >
                                    <shiro:hasRole name="admin">
                                        <a class="modal-trigger" href="${pageContext.request.contextPath}/admin">管理</a>
                                    </shiro:hasRole>
                                    <shiro:hasRole name="guest:*">
                                        <a class="modal-trigger">游客</a>
                                    </shiro:hasRole>
                                </li>
                                <li role="presentation" >
                                    <a href="${pageContext.request.contextPath}/logout">注销</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
                <%--<div class="collapse navbar-collapse" id="main-menu">--%>
                <%--<ul class="menu" id="menu">--%>
                <%----%>
                <%--</ul>--%>
                <%--</div>--%>
            </div>
        </div>
    </div>
</nav>
<section class="content-wrap">
    <div class="container">
        <div class="row">

            <main class="col-md-8 main-content">

                <article class="post tag-about-ghost tag-ghost-in-depth tag-zhu-shou-zhu-shou">
                    <div class="post-head">
                        <h1 class="post-title">
                            <a href="#">专业技能  ·  前端</a>
                        </h1>
                        <div class="post-meta">
                            <span class="author">
                                作者
                                <a href="#">jack</a>
                            </span>
                            &bull;
                            <time class="date" datetime="2016年1月7日">2016年1月7日</time>
                        </div>
                    </div>
                    <div class="post-content">
                        <ul>
                            <li>网页（web）端
                                <ul>
                                    <li> jquery  ·  angular js </li>
                                    <li> bootstrap  ·  easy ui  ·  amaze ui </li>
                                </ul>
                            </li>
                            <li>移动（mobile）端
                                <ul>
                                    <li> android 开发(原生)
                                    </li>
                                    <li>线上App
                                        <ul>
                                            <li><a href="projects.html#lostFound">北洋园校区失物招领</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                    <div class="post-permalink">
                        <a href="#" class="btn btn-default">阅读全文</a>
                    </div>
                    <div class="footer clearfix">
                        <hr>
                        <div class="pull-left tag-list">
                            <i class="fa fa-folder-open-o"></i>
                            <a href="#">Ghost</a>
                            <a href="#">新版本发布</a>
                            <a href="#">Ghost 0.7 版本</a>
                        </div>
                    </div>
                </article>


                <article class="post tag-about-ghost tag-ghost-in-depth tag-zhu-shou-zhu-shou">
                    <div class="post-head">
                        <h1 class="post-title">
                            <a href="#">专业技能  ·  后端</a>
                        </h1>
                        <div class="post-meta">
                            <span class="author">
                                作者
                                <a href="#">jack</a>
                            </span>
                            &bull;
                            <time class="date" datetime="2015-09-07">2015年9月7日</time>
                        </div>
                    </div>
                    <div class="post-content">
                        <ul>
                            <li>web 层： Spring MVC  ·  Strut2</li>
                            <li>整合层： Spring   </li>
                            <li>持久化层：Hibernate  ·  Mybatis (底层mysql)</li>
                            <li>鉴权&权限： Shiro  ·  Spring Security</li>
                            <li>web容器： Tomcat  ·  Nginx </li>
                            <li>语言基础： Java  ·  JVM </li>
                        </ul>
                    </div>
                    <div class="post-permalink">
                        <a href="#" class="btn btn-default">阅读全文</a>
                    </div>
                    <div class="footer clearfix">
                        <hr>
                        <div class="pull-left tag-list">
                            <i class="fa fa-folder-open-o"></i>
                            <a href="#">Ghost</a>
                            <a href="#">新版本发布</a>
                            <a href="#">Ghost 0.7 版本</a>
                        </div>
                    </div>
                </article>


            </main>
            <aside class="col-md-4 sidebar">
                <div class="widget">
                    <h4 class="title" id="recent-works">最近学习工作安排</h4>
                    <div class="content community">
                        <P>
                            1、<a href="#">飞行可视化，2d & 3d聚类+效果</a>
                        </P>
                        <p>
                            2、<a href="#">完善个人主页</a>
                        </p>
                        <p>
                            3、<a href="#">社团联合会项目</a>
                        </p>
                        <p>
                            4、<a href="#">学习struts2</a>
                        </p>
                        <p>
                            5、<a href="#">java从菜鸟到笨鸟pdf</a>
                        </p>
                    </div>
                </div>


                <div class="widget">
                    <h4 class="title" id="recent-article">最近文章</h4>
                    <div class="content download">
                        <a href="http://www.cnblogs.com/1995hxt/p/5495579.html" class="">Linux搭建git服务器</a>
                    </div>
                </div>


                <div class="widget">
                    <h4 class="title" id="interest">兴趣</h4>
                    <div class="content tag-cloud" id="interest-list">
                        <a href="http://www.oracle.com/technetwork/java/javase/downloads/index-jsp-138363.html">Java</a>
                        <a href="http://mvnrepository.com/">Maven</a>
                        <a href="http://hibernate.org/orm/">Hibernate</a>
                        <a href="https://spring.io/">Spring</a>
                        <a href="https://spring.io/">Spring MVC</a>
                        <a href="http://struts.apache.org/">Struts2</a>
                        <a href="http://www.mysql.com/">MySQL</a>
                        <a href="http://jquery.com/">Jquery</a>
                        <a href="http://www.bootcss.com/">BootStrap</a>
                        <a >Linux</a>
                        <a href="https://www.aliyun.com/">阿里云服务</a>
                        <a href="">腾讯云服务</a>
                        <a href="http://nginx.org/">Nginx</a>
                    </div>
                </div>
            </aside>
        </div>
    </div>

</section>
<%@include file="common/footer.jsp"%>
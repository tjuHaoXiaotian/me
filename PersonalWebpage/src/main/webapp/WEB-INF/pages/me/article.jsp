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
                        <li  role="presentation">
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

            <main class="col-sm-10 col-sm-offset-1 main-content">

                <article class="post tag-about-ghost tag-ghost-in-depth tag-zhu-shou-zhu-shou">
                    <div class="post-head">
                        <h1 class="post-title">
                            <a href="${pageContext.request.contextPath}/articles/article_${news.id}.html">${news.title}</a>
                        </h1>
                        <div class="post-meta">
                            <span class="author">
                                作者：
                                <a href="">${news.fromUser}</a>
                            </span>
                            &bull;
                            <time class="date" datetime="${news.createTime}">${news.createTime}</time>
                            &nbsp;&nbsp;
                            <span class="author">
                                访问量：
                                <a href="">${news.visitedTimes}</a>
                            </span>
                        </div>
                    </div>
                    <div class="post-content">
                        ${news.content}
                    </div>
                </article>

                <%--<div style=" position: absolute;left: 50%;transform: translate(-50%, -50%);">--%>
                <div style="margin:0 auto;">
                    <nav>
                        <ul class="pager">
                            <c:if test="${previous != null}">
                                <li class="previous"><a href="${pageContext.request.contextPath}/articles/article_${previous.id}.html">上一篇：${previous.title}<span aria-hidden="true"></span></a></li>
                            </c:if>
                            <c:if test="${next != null}">
                                <li class="next"><a href="${pageContext.request.contextPath}/articles/article_${next.id}.html">下一篇：${next.title}<span aria-hidden="true"></span></a></li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </main>


        </div>
    </div>

</section>
<%@include file="common/footer.jsp"%>

<script src="${pageContext.request.contextPath}/resources/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bower_components/datatables/media/js/dataTables.bootstrap.min.js"></script>


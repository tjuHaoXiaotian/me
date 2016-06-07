<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<%@include file="common/header.jsp" %>

<nav class="main-navigation">`
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="navbar-header">
                        <span class="nav-toggle-button collapse" data-target="#main-menu">
                            <span class="sr-only"> Toggle Navigation</span>
                            <i class="fa fa-bars"></i>
                        </span>
                </div>
                <div class="collapse navbar-collapse" id="main-menu">
                    <ul class="menu" id="menu">
                        <li  role="presentation">  <!-- nav-current 下面的那条线 -->
                            <a href="${pageContext.request.contextPath}/index.html">首页</a>
                        </li>
                        <li  role="presentation">
                            <a href="${pageContext.request.contextPath}/projects.html">项目</a>
                        </li>
                        <li  role="presentation"  class="nav-current">
                            <a href="${pageContext.request.contextPath}/articles.html">文章</a>
                        </li>
                        <li  role="presentation">
                            <a href="http://www.cnblogs.com/1995hxt/">博客</a>
                        </li>
                        <li role="presentation">
                            <a href="https://github.com/tjuHaoXiaotian">github</a>
                        </li>
                        <li role="presentation">
                            <a href="${pageContext.request.contextPath}/admin">登录</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>
<section class="content-wrap">
    <div class="container">
        <div class="row">

            <main class="col-md-10 col-md-offset-1 main-content">

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




            </main>

        </div>
    </div>

</section>
<%@include file="common/footer.jsp"%>

<script src="${pageContext.request.contextPath}/resources/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bower_components/datatables/media/js/dataTables.bootstrap.min.js"></script>


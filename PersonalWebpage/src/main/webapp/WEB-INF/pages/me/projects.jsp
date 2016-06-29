<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<%@include file="common/header.jsp" %>

<!-- start navigation -->
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
                        <li  role="presentation" class="nav-current">
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
<!-- end navigation -->
<section class="content-wrap">
    <div class="container">
        <div class="row">
            <main class="col-md-8 main-content">
                <article class="post tag-about-ghost tag-ghost-in-depth tag-zhu-shou-zhu-shou" id="front-projects">
                    <div class="post-head">
                        <h1 class="post-title">
                            <a href="#">前端  ·  Android</a>
                        </h1>
                        <div class="post-meta">
                            <span class="author">
                                作者
                                <a href="#">郝晓田</a>
                            </span>
                            &bull;
                            <time class="date" datetime="2015-09-07">2015年9月7日</time>
                        </div>
                    </div>
                    <div class="post-content">
                        <ul>
                            <li id="lostFound">北洋园LostFound
                                <ul style="margin-top:10px">
                                    <li style="float: left;margin-right: 50px;list-style-type:none;margin-left: -30px"> <img  src="${pageContext.request.contextPath}/resources/img/lost-found.png" style="width: 100px"></li>
                                    <li><a href="http://shouji.baidu.com/software/9401926.html">百度手机助手</a></li>
                                    <li><a href="http://android.myapp.com/myapp/detail.htm?apkName=com.xpple.lostfound"> 腾讯应用宝</a></li>
                                    <li><a href="http://apk.hiapk.com/appinfo/com.xpple.lostfound">安卓市场</a></li>
                                    <li><a href="http://apk.91.com/Soft/Android/com.xpple.lostfound-1-1.0.html">91</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <br>
                    <div class="post-permalink">
                        <a href="#" class="btn btn-default">阅读全文</a>
                    </div>
                    <div class="footer clearfix">
                        <hr>
                        <div class="pull-left tag-list">
                            <i class="fa fa-folder-open-o"></i>
                            <a href="#">Android</a>
                            <a href="#">Android studio</a>
                            <a href="#">Gradle</a>
                        </div>
                    </div>
                </article>

                <c:forEach var="article" items="${pageResult.results}">
                    <article class="post tag-about-ghost tag-ghost-in-depth tag-zhu-shou-zhu-shou">
                        <div class="post-head">
                            <h1 class="post-title">
                                <a href="${pageContext.request.contextPath}/articles/article_${article.id}.html">${article.title}</a>
                            </h1>
                            <div class="post-meta">
                                <span class="author">
                                    作者：
                                    <a href="#">${article.fromUser}</a>
                                </span>&bull;
                                <time class="date" datetime="+row.createTime+">${article.createTime}</time>&nbsp;&nbsp;
                                <span class="author">
                                    访问量：
                                    <a href="">${article.visitedTimes}</a>
                                </span>
                            </div>
                        </div>
                        <div class="post-content">
                            <c:if test="${article.imageUrl != null}">
                                <img align="center" src="${article.imageUrl}"/>
                            </c:if>
                            <p style="text-indent: 30px">${article.briefContent}</p>
                        </div>
                        <div class="footer clearfix">
                            <hr>
                            <div class="pull-right tag-list">
                                <i class="fa fa-folder-open-o"></i>
                                <a href="${pageContext.request.contextPath}/articles/article_${article.id}.html">阅读全文</a>
                            </div>
                        </div>
                    </article>
                </c:forEach>

                <article class="post tag-about-ghost tag-ghost-in-depth tag-zhu-shou-zhu-shou">
                    <div class="post-head">
                        <h1 class="post-title">
                            <a href="#">Java  ·  后端</a>
                        </h1>
                        <div class="post-meta">
                            <span class="author">
                                作者
                                <a href="#">郝晓田</a>
                            </span>
                            &bull;
                            <time class="date" datetime="2015-09-07">2015年9月7日</time>
                        </div>
                    </div>
                    <div class="post-content">
                        <%--<ul>--%>
                            <%--<li>web 层： Spring MVC  ·  Strut2</li>--%>
                            <%--<li>整合层： Spring   </li>--%>
                            <%--<li>持久化层：Hibernate  ·  Mybatis (底层mysql)</li>--%>
                            <%--<li>鉴权&权限： Shiro  ·  Spring Security</li>--%>
                            <%--<li>web容器： Tomcat  ·  Nginx </li>--%>
                            <%--<li>语言基础： Java  ·  JVM </li>--%>
                        <%--</ul>--%>
                        <a> 待完成。。。</a>
                    </div>
                    <div class="post-permalink">
                        <a href="#" class="btn btn-default">阅读全文</a>
                    </div>
                    <div class="footer clearfix">
                        <hr>
                        <div class="pull-left tag-list">
                            <i class="fa fa-folder-open-o"></i>
                            <a href="#">Java</a>
                            <a href="#">JVM</a>
                        </div>
                    </div>
                </article>

                <%--<article class="post tag-about-ghost tag-ghost-in-depth tag-zhu-shou-zhu-shou">--%>
                    <%--<div class="post-head">--%>
                        <%--<h1 class="post-title">--%>
                            <%--<a href="#">专业技能  ·  常用协议</a>--%>
                        <%--</h1>--%>
                        <%--<div class="post-meta">--%>
                            <%--<span class="author">--%>
                                <%--作者--%>
                                <%--<a href="#">jack</a>--%>
                            <%--</span>--%>
                            <%--&bull;--%>
                            <%--<time class="date" datetime="2015-09-07">2015年9月7日</time>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="post-content">--%>
                        <%--<ul>--%>
                            <%--<li> SSO  ·  Oauth2.0</li>--%>
                            <%--<li> SSL </li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>
                    <%--<div class="post-permalink">--%>
                        <%--<a href="#" class="btn btn-default">阅读全文</a>--%>
                    <%--</div>--%>
                    <%--<div class="footer clearfix">--%>
                        <%--<hr>--%>
                        <%--<div class="pull-left tag-list">--%>
                            <%--<i class="fa fa-folder-open-o"></i>--%>
                            <%--<a href="#">Ghost</a>--%>
                            <%--<a href="#">新版本发布</a>--%>
                            <%--<a href="#">Ghost 0.7 版本</a>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</article>--%>


                <%--<article class="post tag-about-ghost tag-ghost-in-depth tag-zhu-shou-zhu-shou">--%>
                    <%--<div class="post-head">--%>
                        <%--<h1 class="post-title">--%>
                            <%--<a href="#">专业技能  ·  其他</a>--%>
                        <%--</h1>--%>
                        <%--<div class="post-meta">--%>
                            <%--<span class="author">--%>
                                <%--作者--%>
                                <%--<a href="#">jack</a>--%>
                            <%--</span>--%>
                            <%--&bull;--%>
                            <%--<time class="date" datetime="2015-09-07">2015年9月7日</time>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="post-content">--%>
                        <%--<ul>--%>
                            <%--<li> 可视分析--%>
                                <%--<ul>--%>
                                    <%--<li>d3.js</li>--%>
                                    <%--<li>聚类</li>--%>
                                    <%--<li>线绑定（boundling）</li>--%>
                                <%--</ul>--%>
                            <%--</li>--%>
                            <%--<li> 软件测试--%>
                                <%--<ul>--%>
                                    <%--<li>Junit 单元测试，集成测试</li>--%>
                                    <%--<li>Selenium 行为录制回放</li>--%>
                                    <%--<li>Jmeter 压力测试</li>--%>
                                <%--</ul>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>
                    <%--<div class="post-permalink">--%>
                        <%--<a href="#" class="btn btn-default">阅读全文</a>--%>
                    <%--</div>--%>
                    <%--<div class="footer clearfix">--%>
                        <%--<hr>--%>
                        <%--<div class="pull-left tag-list">--%>
                            <%--<i class="fa fa-folder-open-o"></i>--%>
                            <%--<a href="#">Ghost</a>--%>
                            <%--<a href="#">新版本发布</a>--%>
                            <%--<a href="#">Ghost 0.7 版本</a>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</article>--%>


                <%--<article class="post tag-about-ghost tag-ghost-in-depth tag-zhu-shou-zhu-shou">--%>
                    <%--<div class="post-head">--%>
                        <%--<h1 class="post-title">--%>
                            <%--<a href="#">大学生活</a>--%>
                        <%--</h1>--%>
                        <%--<div class="post-meta">--%>
                             <%--<span class="author">--%>
                                <%--作者--%>
                                <%--<a href="#">jack</a>--%>
                            <%--</span>--%>
                            <%--&bull;--%>
                            <%--<time class="date" datetime="2015-09-07">2015年9月7日</time>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="post-content">--%>
                        <%--<p>Ghost 0.7.0 已经正式发布了！此版本主要对后台 UI 的重构，既包含重新设计，也包含底层功能的重大改进。--%>
                            <%--0.7.0 还为即将到来的 API 做了很多铺垫工作。 Ghost 0.7.0 的主要改进 [新增] 设计新后台界面 [新增] 后台能够搜索博文和用户 [新增] 安</p>--%>
                    <%--</div>--%>
                    <%--<div class="post-permalink">--%>
                        <%--<a href="#" class="btn btn-default">阅读全文</a>--%>
                    <%--</div>--%>
                    <%--<div class="footer clearfix">--%>
                        <%--<hr>--%>
                        <%--<div class="pull-left tag-list">--%>
                            <%--<i class="fa fa-folder-open-o"></i>--%>
                            <%--<a href="#">Ghost</a>--%>
                            <%--<a href="#">新版本发布</a>--%>
                            <%--<a href="#">Ghost 0.7 版本</a>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</article>--%>


                <%--<article class="post tag-about-ghost tag-ghost-in-depth tag-zhu-shou-zhu-shou">--%>
                    <%--<div class="post-head">--%>
                        <%--<h1 class="post-title">--%>
                            <%--<a href="#">兴趣爱好</a>--%>
                        <%--</h1>--%>
                        <%--<div class="post-meta">--%>
                             <%--<span class="author">--%>
                                <%--作者--%>
                                <%--<a href="#">jack</a>--%>
                            <%--</span>--%>
                            <%--&bull;--%>
                            <%--<time class="date" datetime="2015-09-07">2015年9月7日</time>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="post-content">--%>
                        <%--<p>Ghost 0.7.0 已经正式发布了！此版本主要对后台 UI 的重构，既包含重新设计，也包含底层功能的重大改进。--%>
                            <%--0.7.0 还为即将到来的 API 做了很多铺垫工作。 Ghost 0.7.0 的主要改进 [新增] 设计新后台界面 [新增] 后台能够搜索博文和用户 [新增] 安</p>--%>
                    <%--</div>--%>
                    <%--<div class="post-permalink">--%>
                        <%--<a href="#" class="btn btn-default">阅读全文</a>--%>
                    <%--</div>--%>
                    <%--<div class="footer clearfix">--%>
                        <%--<hr>--%>
                        <%--<div class="pull-left tag-list">--%>
                            <%--<i class="fa fa-folder-open-o"></i>--%>
                            <%--<a href="#">Ghost</a>--%>
                            <%--<a href="#">新版本发布</a>--%>
                            <%--<a href="#">Ghost 0.7 版本</a>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</article>--%>



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
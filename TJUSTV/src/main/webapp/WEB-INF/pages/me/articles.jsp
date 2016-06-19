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

                <!-- 分页 pagination -->
                <nav>
                    <ul class="pagination" id="pagination">
                        <!-- 第一页 -->
                        <c:choose>
                            <c:when test="${pageResult.currentPage <= 1}">
                                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">首页</span></a></li>
                                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">前一页</span></a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="${pageContext.request.contextPath}/articles.html?pageSize=1&pageNumber=1" aria-label="Previous"><span aria-hidden="true">首页</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/articles.html?pageSize=1&pageNumber=${pageResult.currentPage-1}" aria-label="Previous"><span aria-hidden="true">前一页</span></a></li>
                            </c:otherwise>
                        </c:choose>

                        <!-- 中间若干页 -->
                        <c:forEach var="page" begin="1" end="${pageResult.pageCount}" step="1">
                            <c:if test="${page>=(pageResult.currentPage-3) && page<(pageResult.currentPage+3)}">
                                <c:choose>
                                    <c:when test="${page == pageResult.currentPage}">
                                        <li class="active"><a href="${pageContext.request.contextPath}/articles.html?pageSize=1&pageNumber=${page}">${page}<span class="sr-only">(current)</span></a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="${pageContext.request.contextPath}/articles.html?pageSize=1&pageNumber=${page}">${page}<span class="sr-only">(current)</span></a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </c:forEach>

                    <!-- 尾页 -->
                        <c:choose>
                            <c:when test="${pageResult.currentPage >= pageResult.pageCount}">
                                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">后一页</span></a></li>
                                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">尾页</span></a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="${pageContext.request.contextPath}/articles.html?pageSize=1&pageNumber=${pageResult.currentPage+1}" aria-label="Previous"><span aria-hidden="true">后一页</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/articles.html?pageSize=1&pageNumber=${pageResult.pageCount}" aria-label="Previous"><span aria-hidden="true">尾页</span></a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </nav>

            </main>
            <aside class="col-md-4 sidebar">
                <div class="widget">
                    <h4 class="title" id="recent-article">最近文章</h4>
                    <div class="content community" id="recent-articles">

                    </div>
                </div>


                <div class="widget">
                    <h4 class="title" id="article-type">文章分类</h4>
                    <div class="content download">
                        <ul>
                            <li style="margin-left: -20px">
                                <a href="${pageContext.request.contextPath}/articles.html?type=1" class="">学习</a>
                            </li>
                            <li style="margin-left: -20px">
                                <a href="${pageContext.request.contextPath}/articles.html?type=2" class="">生活</a>
                            </li>
                            <li style="margin-left: -20px">
                                <a href="${pageContext.request.contextPath}/articles.html?type=3" class="">感悟与成长</a>
                            </li>
                        </ul>
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

<script src="${pageContext.request.contextPath}/resources/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bower_components/datatables/media/js/dataTables.bootstrap.min.js"></script>
<script type="application/javascript">

    var rootUrl = "<%=basePath%>";

    function getUrl(){
        var url = rootUrl+'${pageContext.request.contextPath}/articles';
        if(${param.containsKey("type")}){
            return url + "?type=${param.type}";
        }else{
            return url;
        }
    }

    function loadRecentArticles(){
        $.ajax({
            url: rootUrl+'${pageContext.request.contextPath}/articles/recent',
            contentType:"application/json",
            type: 'get',
            dataType: 'json'
        }).success(function(data){
            if(data.state == 200){
                var html = "";
                if(data != null){
                    var articles = data.data.newsArray;
                    console.log("result",articles);
                    for(var i = 0; i<articles.length;i++){
                        html += '<P>'+
                        '<a href="${pageContext.request.contextPath}/articles/article_'+articles[i].id+'.html">'+articles[i].title+'</a>'+
                                '<br><time class="date" datetime="'+articles[i].updateTime+'" style="margin-left:25%">——'+articles[i].updateTime+'</time>'+
                        '</P>';
                    }
                }
                $("#recent-articles").html(html);
            }else{
                alert("recent-articles 获取失败！");
            }
        }).error(function(){
            alert("recent-articles 获取失败");
        });
    }

    $(document).ready(function() {
        loadRecentArticles();
    });
</script>

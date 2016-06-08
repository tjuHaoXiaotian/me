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

            <main class="col-md-8 main-content">
                <table id="news">
                    <tbody id="news-modal-list">


                    </tbody>
                </table>

                <%--<article class="post tag-about-ghost tag-ghost-in-depth tag-zhu-shou-zhu-shou">--%>
                    <%--<div class="post-head">--%>
                        <%--<h1 class="post-title">--%>
                            <%--<a href="#">专业技能  ·  前端</a>--%>
                        <%--</h1>--%>
                        <%--<div class="post-meta">--%>
                            <%--<span class="author">--%>
                                <%--作者--%>
                                <%--<a href="#">jack</a>--%>
                            <%--</span>--%>
                            <%--&bull;--%>
                            <%--<time class="date" datetime="2016年1月7日">2016年1月7日</time>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="post-content">--%>
                        <%--<ul>--%>
                            <%--<li>网页（web）端--%>
                                <%--<ul>--%>
                                    <%--<li> jquery  ·  angular js </li>--%>
                                    <%--<li> bootstrap  ·  easy ui  ·  amaze ui </li>--%>
                                <%--</ul>--%>
                            <%--</li>--%>
                            <%--<li>移动（mobile）端--%>
                                <%--<ul>--%>
                                    <%--<li> android 开发(原生)--%>
                                    <%--</li>--%>
                                    <%--<li>线上App--%>
                                        <%--<ul>--%>
                                            <%--<li><a href="projects.html#lostFound">北洋园校区失物招领</a></li>--%>
                                        <%--</ul>--%>
                                    <%--</li>--%>
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
                            <%--<a href="#">专业技能  ·  后端</a>--%>
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
                            <%--<li>web 层： Spring MVC  ·  Strut2</li>--%>
                            <%--<li>整合层： Spring   </li>--%>
                            <%--<li>持久化层：Hibernate  ·  Mybatis (底层mysql)</li>--%>
                            <%--<li>鉴权&权限： Shiro  ·  Spring Security</li>--%>
                            <%--<li>web容器： Tomcat  ·  Nginx </li>--%>
                            <%--<li>语言基础： Java  ·  JVM </li>--%>
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


            </main>
            <aside class="col-md-4 sidebar" style="margin-top:35px">
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
    $(document).ready(function() {
        loadTable();
    });
    var table;
    function getUrl(){
        var url = rootUrl+'${pageContext.request.contextPath}/articles';
        if(${param.containsKey("type")}){
            return url + "?type=${param.type}";
        }else{
            return url;
        }
    }

    function getImage(imageUrl){
        if(imageUrl != null && imageUrl !=""){
            return '<img src="'+imageUrl+'"></img>'
        }else{
            return ""
        }
    }

    function loadTable(){
        $.ajax({
            url: getUrl(),
            type: 'get',
            dataType: 'json'
        }).success(function(data){
            table = $('#news').DataTable({
                "bProcessing": true,
                "searching":false,
                "bDestroy": true,
                "sPaginationType" : "full_numbers",
                "oLanguage" : {
                    "sLengthMenu": "每页显示 _MENU_ 条记录",
                    "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                    "sInfoEmpty": "没有数据",
                    "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                    "sZeroRecords": "没有检索到数据",
                    "sSearch": "搜索: &nbsp",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "前一页",
                        "sNext": "后一页",
                        "sLast": "尾页"
                    }
                },
                "aaSorting": [[ 0, "desc" ]],
                "data":data.data.newsArray,
                "columns": [
                    { "data": 'id' }
                ],
                "columnDefs": [
                    {
                        "targets": 0,
                        "render": function (data, type, row, table) {
                            return '<article class="post tag-about-ghost tag-ghost-in-depth tag-zhu-shou-zhu-shou">'+
                                        '<div class="post-head">'+
                                                '<h1 class="post-title">'+
                                                    '<a href="${pageContext.request.contextPath}/articles/article_'+row.id+'.html">'+row.title+'</a>'+
                                                '</h1>'+
                                                '<div class="post-meta">'+
                                                     '<span class="author">'+
                                                        '作者：'+
                                                        '<a href="#">'+row.fromUser+'</a>'+
                                                     '</span>&bull;'+
                                                     '<time class="date" datetime="'+row.createTime+'">'+row.createTime+'</time>&nbsp;&nbsp;'+
                                                     '<span class="author">'+
                                                        '访问量：'+
                                                        '<a href="">'+row.visitedTimes+'</a>'+
                                                     '</span>'+
                                                '</div>'+
                                        '</div>'+
                                        '<div class="post-content">'+ getImage(row.imageUrl)+
                                                '<p style="text-indent: 30px">'+row.briefContent+'</p>'+
                                        '</div>'+
                                        '<div class="footer clearfix">'+
                                             '<hr>'+
                                                '<div class="pull-right tag-list">'+
                                                    '<i class="fa fa-folder-open-o"></i>'+
                                                            '<a href="${pageContext.request.contextPath}/articles/article_'+row.id+'.html">阅读全文</a>'+
                                                '</div>'+
                                        '</div>'+
                                    '</article>';
                        }
                    }]
            });
//            table.oSort( [ [0,'desc'] ] );
        });

        $("#news_wrapper:first").css('display','none');
    }
//    $(function(){
//       loadTable();
//    });

    function loadRecentArticles(){
        $.ajax({
            url: rootUrl+'${pageContext.request.contextPath}/articles/recent',
            contentType:"application/json",
            type: 'get',
            dataType: 'json'
//             data:JSON.stringify(newApply)
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
        loadTable();
        loadRecentArticles();
    });
</script>

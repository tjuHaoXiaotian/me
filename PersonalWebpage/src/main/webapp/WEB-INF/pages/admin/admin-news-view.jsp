<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/header.jsp" %>
    <!-- content start -->
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">我的文章</strong> / <small>文章预览</small></div>
            </div>
            <hr>
            <div class="am-g ">
                <div class="am-u-sm-12" id="newsContent">
                    <h3 style="text-align: center">${news.title}</h3>
                    <span class="badge" style="margin-right:25%">${news.fromUser}&nbsp;&nbsp;&nbsp;&nbsp;${news.checkTime}</span>
                    <p>
                        ${news.content}
                    </p>
                </div>
            </div>




            <footer class="admin-content-footer" style="margin-top: 20%">
                <hr>
                <p class="am-padding-left">© 2016 by tju HaoXiaotian.</p>
            </footer>
        </div>

    </div>

    <!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>


<!-- ueEditor -->
<!-- 配置文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>

<script src="${pageContext.request.contextPath}/ueditor/ueditor.parse.js"></script>
<script type="text/javascript">

    uParse('#newsContent', {
        rootPath: '${pageContext.request.contextPath}/'
    })
</script>

</body>
</html>

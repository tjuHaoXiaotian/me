<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/header.jsp" %>

    <!-- content start -->
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">新闻类别</strong> / <small>${op}</small></div>
            </div>
            <hr>
            <div class="am-g ">
                <div class="am-u-sm-12">
                    <div class="am-tabs-bd">

                        <div class="am-tab-panel am-fade am-in am-active" id="tab2">
                        <form class="am-form" method="post">

                                <input type="hidden" name="id" value="${newsType.id}">

                            <div class="am-g am-margin-top">
                                <div class="am-u-sm-4 am-u-md-2 am-text-right">
                                    类别名称
                                </div>
                                <div class="am-u-sm-8 am-u-md-5">
                                    <input name="classDescription" type="text" value="${newsType.classDescription}" class="am-input-sm">
                                </div>
                                <div class="am-hide-sm-only am-u-md-5">*必填</div>
                            </div>

                            <div class="am-g am-margin-top">
                                <div class="am-u-sm-4 am-u-md-2 am-text-right" style="opacity: 0">
                                    话题
                                </div>
                                <div class="am-u-sm-8 am-u-md-5">
                                    <input type="submit" class="am-btn am-btn-primary am-btn-block" value="提交">
                                </div>
                                <div class="am-hide-sm-only am-u-md-5"></div>
                            </div>

                        </form>


                    </div>

                    </div>

                </div>
            </div>




            <footer class="admin-content-footer" style="margin-top: 20%">
                <hr>
                <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
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

<script type="text/javascript">
</script>

</body>
</html>

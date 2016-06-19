<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/header.jsp" %>

<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">TJUSAU</div>
        <div class="am-modal-bd">
            你，确定要删除这篇文章吗？
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-cancel>取消</span>
            <span class="am-modal-btn" data-am-modal-confirm>确定</span>
        </div>
    </div>
</div>

<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm-recovery">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">TJUSAU</div>
        <div class="am-modal-bd">
            你，确定要恢复这篇文章吗？
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-cancel>取消</span>
            <span class="am-modal-btn" data-am-modal-confirm>确定</span>
        </div>
    </div>
</div>

<!-- content start -->
<div class="admin-content" style="height: 100%">
    <div class="admin-content-body">
        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">我的文章</strong> / <small>文章列表</small></div>
        </div>

        <div class="am-g" style="height: 50%">
            <div class="am-u-sm-12">
                <table id="news" class="am-table am-table-bd am-table-striped admin-content-table">
                    <thead>
                    <tr>
                        <th hidden="hidden">ID</th>
                        <th>类型</th>
                        <th>标题</th>
                        <th>发布时间</th>
                        <th>状态</th>
                        <th>访问量</th>
                        <th>作者</th>
                        <th>置顶</th>
                        <th>置顶次序</th>
                        <th>管理</th>
                    </tr>
                    </thead>
                    <tbody id="news-modal-list">


                    </tbody>
                </table>
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
<script src="${pageContext.request.contextPath}/resources/assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="${pageContext.request.contextPath}/resources/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>


<script src="${pageContext.request.contextPath}/resources/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bower_components/datatables/media/js/dataTables.bootstrap.min.js"></script>


<script>

    //    var rootUrl = "http://121.42.217.4:8080";
    var rootUrl = "<%=basePath%>";
    $(document).ready(function() {
        loadTable();
    });
    var table;
    function getUrl(){
        var url = rootUrl+'${pageContext.request.contextPath}/news';
        if(${param.containsKey("type")}){
            return url + "?type=${param.type}";
        }else{
            return url;
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
                    { "data": 'id' } ,
                    { "data": 'type' } ,
                    { "data":'title'} ,
                    { "data": 'checkTime' },
                    { "data": 'status' },
                    { "data": 'visitedTimes' },
                    { "data": 'fromUser' },
                    { "data": 'id' },
                    { "data": 'id' },
                    { "data": 'id' }
                ],
                "columnDefs": [
                    {
                        "targets": 0,
                        "visible": false
                    },
                    {
                        "targets": 1,
                        "render": function (data, type, row, table) {
                            return data.classDescription;
                        }
                    },
                    {
                        "targets": 2,
                        "render": function (data, type, row, table) {
                            return '<a href="${pageContext.request.contextPath}/news/view/'+row.id+'"> <b><u>'+data+'</u></b></a>';
                        }
                    },
                    {
                        "targets": 4,
                        "render": function (data, type, row, table) {
                            return  function(){
                                if(data == 0){
                                    return '<span>未审查</span>';
                                }else if(data == 1){
                                    return '<span style="color: #5EB95E">已通过</span>';
                                }else if(data == 2){
                                    return '<span style="color: red">未通过</span>';
                                }else if(data == 3){
                                    return '<span style="color: #5EB95E">已发布</span>';
                                }else if(data == -1){
                                    return '<span style="color: red">已删除</span>';
                                }
                            };
                        }
                    },
                    {
                        "targets": 6,
                        "render": function (data, type, row, table) {
                            return data;
                        }

                    },
                    {
                        "targets": -3,
                        "render": function (data, type, row, table) {
                            return  '<a onclick="setNewsTop('+data+')" class="am-btn am-btn-default am-btn-sm"> 置顶</a>';
                        }

                    },
                    {
                        "targets": -2,
                        "render": function (data, type, row, table) {
                            return '<a href="" class="am-btn am-btn-default am-btn-xs"> <span class="am-icon-chevron-up"> 上移</span></a> ' +
                                    '<a href="" class="am-btn am-btn-default am-btn-xs"> <span class="am-icon-chevron-down"> 下移</span></a>';
                        }

                    },
                    {
                        "targets": -1,
                        "render": function (data, type, row, table) {
                            return ' <div class="am-btn-toolbar"> ' +
                                    '<div class="am-btn-group am-btn-group-xs"> ' +
                                    '<a href="${pageContext.request.contextPath}/news/view/'+data+'" class="am-btn am-btn-default am-btn-xs"> <span class="am-icon-file-image-o am-text-primary">查看</span></a> ' +
                                    '<a href="${pageContext.request.contextPath}/news/edit/'+data+'" class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span>编辑</a> ' +
                                    getDeleteOrRecovery(data,row.status)+
                                    '</div> </div>';
                        }
                    }]
            });
//            table.oSort( [ [0,'desc'] ] );
        });


    }

    function getDeleteOrRecovery(data,status){
        if(status == -1){
           return '<a onclick="recoverClick('+data+',this)" class="btn-delete am-btn am-btn-default am-btn-xs  am-hide-sm-only" id="'+data+'"><span class="am-text-danger am-icon-trash-o">恢复</span> </a> ';
        }else{
            return '<a onclick="deleteClick('+data+',this)" class="btn-delete am-btn am-btn-default am-btn-xs  am-hide-sm-only" id="'+data+'"><span class="am-text-danger am-icon-trash-o">删除</span> </a> ';
        }
    }

    function deleteType(id){
        $.ajax({
            url: rootUrl+'${pageContext.request.contextPath}/news/'+id,

//             contentType:"application/json",
            type: 'delete',
            dataType: 'json'
//             data:JSON.stringify(newApply)
        }).success(function(data){
            loadTable();
        }).error(function(){
            alert("删除失败");
        });
    }

    function deleteClick(id,ele) {
        $('#my-confirm').modal({
            relatedTarget: ele,
            onConfirm: function(options) {
                var $link = $(this.relatedTarget);
                console.log("数据：",$link.attr("id"));
                deleteType($link.attr("id"));
            },
            // closeOnConfirm: false,
            onCancel: function() {
            }
        });
    }

    function recoverClick(id,ele) {
        $('#my-confirm-recovery').modal({
            relatedTarget: ele,
            onConfirm: function(options) {
                var $link = $(this.relatedTarget);
                console.log("数据：",$link.attr("id"));
                recoverArticle($link.attr("id"));
            },
            // closeOnConfirm: false,
            onCancel: function() {
            }
        });
    }

    function recoverArticle(id){
        $.ajax({
            url: rootUrl+'${pageContext.request.contextPath}/news/recovery/'+id,

//             contentType:"application/json",
            type: 'put',
            dataType: 'json'
//             data:JSON.stringify(newApply)
        }).success(function(data){
            loadTable();
        }).error(function(){
            alert("恢复失败");
        });
    }


    function setNewsTop(id){
        $.ajax({
            url: rootUrl+'${pageContext.request.contextPath}/news/setTop/'+id,

//             contentType:"application/json",
            type: 'get',
            dataType: 'json'
//             data:JSON.stringify(newApply)
        }).success(function(data){
            alert("置顶成功");
//            loadTable();
        }).error(function(){
            alert("置顶失败");
        });
    }





</script>
</body>
</html>

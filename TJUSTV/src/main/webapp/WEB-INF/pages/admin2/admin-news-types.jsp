<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/header.jsp" %>

    <div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">TJUSAU</div>
            <div class="am-modal-bd">
                你，确定要删除这条视频记录吗？
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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">新闻稿件</strong> / <small>新闻列表</small></div>
            </div>

            <div class="am-g" style="height: 50%">
                <div class="am-u-sm-12">
                    <table id="newsTypes" class="am-table am-table-bd am-table-striped admin-content-table">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>类型</th>
                            <th>管理</th>
                        </tr>
                        </thead>
                        <tbody id="news-type-modal-list">
                        </tbody>
                    </table>
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



<script src="${pageContext.request.contextPath}/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/bower_components/datatables/media/js/dataTables.bootstrap.min.js"></script>

<script>
    //    var rootUrl = "http://121.42.217.4:8080";
    var rootUrl = "<%=basePath%>";
    $(document).ready(function() {
        loadTable();
    });
    var table;
    function loadTable(){
        $.ajax({
            url: rootUrl+'${pageContext.request.contextPath}/mng/newsTypes',
            type: 'get',
            dataType: 'json'
        }).success(function(data){
            table = $('#newsTypes').DataTable({
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
                "data":data.data.newsTypeArray,
                "columns": [
                    { "data": 'id' } ,
                    { "data":'classDescription'} ,
                    { "data": 'id' }
                ],
                "columnDefs": [
                    {
                        "targets": 0,
                        "render": function (data, type, row, table) {
                            return data;
                        }
                    },
                    {
                        "targets": 1,
                        "render": function (data, type, row, table) {
                            return data;
                        }

                    },
                    {
                        "targets": -1,
                        "render": function (data, type, row, table) {
                            return'<a href="${pageContext.request.contextPath}/mng/newsTypes/edit?id="'+data+' class="am-btn am-btn-default am-btn-xs" onclick=""> <span class="am-icon-pencil-square-o am-text-secondary"> 编辑</span></a>'
                                    +'<a onclick="deleteClick('+data+',this)" class="btn-delete am-btn am-btn-default am-btn-xs" id="'+data+'"> <span class="am-icon-trash-o am-text-danger"> 删除</span></a>';
                        }
                    }]
            });
        });


    }

    function deleteType(id){
        $.ajax({
            url: rootUrl+'${pageContext.request.contextPath}/mng/newsTypes/'+id,

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
</script>
</body>
</html>

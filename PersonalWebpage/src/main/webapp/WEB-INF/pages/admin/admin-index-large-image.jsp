<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/header.jsp" %>

<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">TJUSAU</div>
    <div class="am-modal-bd">
      你，确定要删除此大图吗？
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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong> / <small>首页大图</small></div>
    </div>

    <div class="am-g" style="height: 50%">
      <div class="am-u-sm-12">
        <table id="news" class="am-table am-table-bd am-table-striped admin-content-table">
          <thead>
          <tr>
            <th>预览图</th>
            <th>标题</th>
            <th>发布时间</th>
            <th>访问量</th>
            <th>操作人</th>
            <th>操作</th>
          </tr>
          </thead>
          <tbody id="news-modal-list">

              <c:forEach var="image" items="${images}" >
                <tr>
                  <c:choose>
                    <c:when test="${image.imageUrl == null}">
                      <td><img  src="${pageContext.request.contextPath}/resources/img/demo.jpg" style="height:80px;width:120px"/></td>
                    </c:when>
                    <c:otherwise>
                      <td><img src="${image.imageUrl}" style="height:80px;width:120px"/></td>
                    </c:otherwise>
                  </c:choose>

                  <c:choose>
                    <c:when test="${image.title == null}">
                      <td>标题-未设置</td>
                    </c:when>
                    <c:otherwise>
                      <td>${image.title}</td>
                    </c:otherwise>
                  </c:choose>

                  <c:choose>
                    <c:when test="${image.updateTime == null}">
                      <td>更新时间-未设置</td>
                    </c:when>
                    <c:otherwise>
                      <td>${image.updateTime}</td>
                    </c:otherwise>
                  </c:choose>

                  <c:choose>
                    <c:when test="${image.visitedTimes == null}">
                      <td>访问次数-未设置</td>
                    </c:when>
                    <c:otherwise>
                      <td>${image.visitedTimes}</td>
                    </c:otherwise>
                  </c:choose>

                  <c:choose>
                    <c:when test="${image.fromUser == null}">
                      <td>操作人-未设置</td>
                    </c:when>
                    <c:otherwise>
                      <td>${image.fromUser}</td>
                    </c:otherwise>
                  </c:choose>


                  <td>
                    <div class="am-btn-toolbar">
                       <div class="am-btn-group am-btn-group-xs">
                           <a href="${pageContext.request.contextPath}/" class="am-btn am-btn-primary am-btn-xs am-text-secondary" target="_blank"><span class="am-icon-file-image-o">查看</span></a>
                           <c:choose>
                             <c:when test="${image.title == null}">
                               <a href="${pageContext.request.contextPath}/admin/index/edit" class="am-btn am-btn-success am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span>编辑</a>
                             </c:when>
                             <c:otherwise>
                               <a href="${pageContext.request.contextPath}/admin/index/edit?id=${image.id}" class="am-btn am-btn-success am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span>编辑</a>
                             </c:otherwise>
                           </c:choose>
                           <a onclick="deleteClick(${image.id},this)" class="btn-delete am-btn am-btn-danger am-btn-xs am-text-secondary" id="${image.id}"><span class="am-icon-trash-o">删除</span> </a>
                       </div>
                    </div>
                  </td>
                </tr>
              </c:forEach>


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

  var rootUrl = "<%=basePath%>"+"${pageContext.request.contextPath}";

  function deleteType(id){
    $.ajax({
      url: rootUrl+'/admin/index/'+id,

//             contentType:"application/json",
      type: 'delete',
      dataType: 'json'
//             data:JSON.stringify(newApply)
    }).success(function(data){
      // 刷新页面
      window.location.reload();
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

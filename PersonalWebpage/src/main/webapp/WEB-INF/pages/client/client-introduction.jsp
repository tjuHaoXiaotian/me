<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2016/5/30
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@include file="common/header.jsp" %>
<style>
  .titles{
    padding-bottom: 30px;
    padding-top: 30px;
  }
  .titles label{
    background-color: rgb(255, 123, 123);
    font-size: 16px;
    border-radius: 5px;
    padding: 5px 20px;
    border: 2px solid rgb(239, 83, 80);
    color: #fff;
  }
  .titles label a{
    color: #fff;
  }
  #clubs_wrapper .row{
    background-color: #fff;
    padding: 20px;
    box-shadow: 0px 5px 5px #ccc;
  }
  .sorting_1 a{
    text-underline: none;
    color:rgb(239, 83, 80) ;
  }
</style>

<div class="container" style="margin-top:20px;">
  <div class="titles" >
    <label for="all"><a href="${pageContext.request.contextPath}/index/view/clubs">全部</a></label>
    <label for="func_div"><a href="${pageContext.request.contextPath}/index/view/clubs?type=0">职能类</a> </label>
    <label for="int_div" style="margin-left: 5px;"><a href="${pageContext.request.contextPath}/index/view/clubs?type=1">兴趣类</a></label>

    <%--<label for="search">搜索:</label>--%>
    <%--<input type="search" id="search" width="200" title="">--%>
    <%--<button name="search">搜索</button>--%>
  </div>

  <div class="content">
    <div id="all">
      <div class="am-g" style="height: 50%">
        <div class="am-u-sm-12">
          <table id="clubs" class="am-table am-table-bd am-table-striped admin-content-table">
            <thead>
            <tr>
              <th>社团名</th>
              <%--<th>负责人</th>--%>
              <%--<th>联系电话</th>--%>
              <th>简介</th>
              <%--<th>状态</th>--%>
              <%--<th>部门数量</th>--%>
              <%--<th>管理</th>--%>
            </tr>
            </thead>
            <tbody id="clubs-modal-list">


            </tbody>
          </table>
          <div style="clear: both;"></div>
        </div>
      </div>
    </div>
    <div id="func_div">



    </div>
    <div id="int_div">

    </div>
  </div>

</div>

<!--Import jQuery before materialize.js-->
<%--<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>--%>
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/materialize.min.js"></script>
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
    if(${type == null})
    {
      return rootUrl + '${pageContext.request.contextPath}/clubs';
    }else{
      return rootUrl + '${pageContext.request.contextPath}/clubs?type=${type}';

    }
  }

  function loadTable(){
    $.ajax({
      url: getUrl(),
      type: 'get',
      dataType: 'json'
    }).success(function(data){
      table = $('#clubs').DataTable({
        "bProcessing": true,
        "bDestroy": true,
        "sPaginationType" : "full_numbers",
        "oLanguage" : {
          "sLengthMenu": "",
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
        "data":data.data.clubs,
        "columns": [
          { "data": 'name' } ,
          { "data": 'briefIntroduction' },
        ],
        "columnDefs": [
          {
            "targets": 0,
            "render": function (data, type, row, table) {
              return '<a href="${pageContext.request.contextPath}/clubs/club_'+row.clubId+'.html" target="_blank"> <b><u>'+data+'</u></b></a>';
            }
          }]
      });
    });


  }

</script>


</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>


<%@include file="common/header.jsp" %>


<div class="container" style="margin-top:20px;">
  <div class="row">
    <div class="col s12">
      <div class="card" style="padding:30px;">
        <h4><a href="<%=request.getContextPath()%>/mng/clubs/${clubId}/departments/add">添加部门</a> </h4>
        <table>
          <thead>
          <tr>
            <th data-field="id">部门</th>
            <th data-field="name">信息</th>
            <th data-field="name">查看</th>
          </tr>
          </thead>

          <tbody>
          <C:forEach var="department" items="${departments}">

            <tr>
              <td>${department.depName}</td>
              <td>${department.info}</td>
              <td><a href="<%=request.getContextPath()%>/mng/departments/${department.depId}">查看</a></td>
            </tr>
          </C:forEach>


          </tbody>
        </table>
        <div class="clear:both;"></div>
      </div>
    </div>
  </div>
</div>
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/materialize.min.js"></script>
<script>
  $(".dropdown-button").dropdown();
  $(document).ready(function(){
    $('.slider').slider({full_width: true});
  });
  $(document).ready(function() {
    $('select').material_select();
    $('.modal-trigger').leanModal();
  });
</script>
</body>
</html>

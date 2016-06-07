<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>


<%@include file="common/header.jsp" %>


<div class="container" style="margin-top:20px;">
      <div class="row">
        <div class="col s12">
          <div class="card" style="padding:30px;">

            <form name="departmentsForm">
              <div class="row">
                <div class="input-field col s3">
                  <input name="name" id="departmentName" type="text" class="validate" placeholder="${department.depName}">
                  <label  for="departmentName">请输入添加部门</label>
                </div>
              </div>
              <div class="row">
                  <div class="input-field col s6">
                    <textarea name="info" id="textarea1" class="materialize-textarea" placeholder="${department.info}"></textarea>
                    <label for="textarea1">部门简介</label>
                  </div>
                </div>
           </form>
            <div class="row">
              <input type="submit" value="添加" class="waves-effect waves-light btn red lighten-1" onclick="addDep()">
            </div>
           <div class="clear:both;"></div>
          </div>
        </div>
      </div>
    </div>
    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/materialize.min.js"></script>
    <script>



      var rootUrl = "<%=basePath%>"+"${pageContext.request.contextPath}/mng/clubs/${clubId}/departments";
      function addDep(){
        var departments = [];
        var  department = {
          depName:document.departmentsForm.name.value,
          info:document.departmentsForm.info.value
        };
        departments.push(department);
        $.ajax({
          url: rootUrl,
          contentType:"application/json",
          type: 'post',
          dataType:'JSON',
          data:JSON.stringify(departments)
        }).success(function(data){
          if(data.state != 200){
            alert(data.message);
          }else{
//            window.location.replace(rootUrl);
          }
        }).error(function(){

        });
      }










    $(".dropdown-button").dropdown();
    $(document).ready(function(){
    $('.slider').slider({full_width: true});
  });
  $(document).ready(function() {
    $('select').material_select();
  });
  $(document).ready(function(){
    $('.slider').slider({full_width: true});
    $('.modal-trigger').leanModal();
    $(".dropdown-button").dropdown();
  });
    </script>
  </body>
</html>

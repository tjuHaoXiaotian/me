<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>


<%@include file="common/header.jsp" %>
<style>
  .mianmian{
    background-color: #fff;padding: 50px;box-shadow: 0px 5px 5px #ccc;
  }
  .maintext{
    margin-top: 20px;
    background-color: #f5f5f5;
  }
  .maintext h4{
    font-size: 20px;
    font-weight: bold;
    color: #555;
  }
  .maintext ul li a{
    color: #ef5350;
  }
  #newsContent{
    padding: 40px;
  }
</style>

<div class="container" style="margin-top:20px;">
    <div class="row mianmian">

      <div class="col s2 maintext">
        <h4>部门情况</h4>
        <ul>
          <c:forEach var="dep" items="${departments}">
            <li>
              <c:choose>
                <c:when test="${department.depId == dep.depId}">
                  <a href="${pageContext.request.contextPath}/clubs/${dep.club.clubId}/departments/department_${dep.depId}.html"> ${dep.depName}</a>
                </c:when>
                <c:otherwise>
                  <a href="${pageContext.request.contextPath}/clubs/${dep.club.clubId}/departments/department_${dep.depId}.html" style="color:#000000;"> ${dep.depName}</a>
                </c:otherwise>
              </c:choose>
            </li>
          </c:forEach>
        </ul>

      </div>
      <div class="col s10" id="newsContent">

        <div>
          <h3 style="text-align: center;display: inline;"><a href="${pageContext.request.contextPath}/clubs/club_${department.club.clubId}.html">${department.club.name}</a></h3><h4 style="text-align: center;display: inline">/ ${department.depName}</h4>
        </div>
        <p>
          <span>部门联系电话：</span>${department.tel}
        </p>
        <p>
          <span>部门email：</span>${department.email}
        </p>
        <p>
          <span>负责人：</span>${department.responsiblePerson}
        </p>
        <p>
          ${department.introduction}
        </p>
      </div>

    </div>
</div>

<footer class="row admin-content-footer" style="margin-top: 20%">
  <hr>
  <p class="s12"  style="text-align: center">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
</footer>


<!--Import jQuery before materialize.js-->
<%--<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>--%>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/materialize.min.js"></script>

<!-- ueEditor -->
<!-- 配置文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>

<script src="${pageContext.request.contextPath}/ueditor/ueditor.parse.js"></script>
<script>

  $(document).ready(function(){
    $(".dropdown-button").dropdown();
    $('.slider').slider({full_width: true});
    $('.modal-trigger').leanModal();
  });



  //    var rootUrl = "http://localhost:8080/SAU/mng/admin/login";
  var rootUrl = "<%=basePath%>"+"${pageContext.request.contextPath}/mng";

  function login(){
    var adminUser = {
      account:document.loginForm.account.value,
      password:document.loginForm.password.value
    };
    $.ajax({
      url: rootUrl + "/users/login",
      contentType:"application/json",
      type: 'post',
      dataType:'JSON',
      data:JSON.stringify(adminUser)
    }).success(function(data){
      if(data.state != 200){
        alert(data.message);
      }else{
        window.location.reload();
      }
    }).error(function(){

    });
  }


  uParse('#newsContent', {
    rootPath: '${pageContext.request.contextPath}/'
  })


</script>
</body>
</html>

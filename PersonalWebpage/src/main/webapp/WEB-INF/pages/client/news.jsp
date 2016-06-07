<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>


<%@include file="common/header.jsp" %>
<style>
  #newsContent h2{
  font-size: 18px;
    font-weight: bold;
  }
  #newsContent h3{
    font-size: 18px;
    font-weight: bold;
  }
  #newsContent p{
   margin-bottom: 20px;
    margin-top: 20px;
  }
</style>

<div class="container" style="margin-top:20px;">
    <div class="row">
      <div class="s12" id="newsContent" style="background-color: #fff;padding: 50px;box-shadow: 0px 5px 5px #ccc;">
        <h3 style="text-align: center;font-size: 24px">${news.title}</h3>
        <span class="badge" style="margin-right:25%">${news.fromUser}&nbsp;&nbsp;&nbsp;&nbsp;${news.checkTime}</span>
        <div>
          ${news.content}
          <div style="clear: both;"></div>
        </div>
      </div>

    </div>
</div>

<footer class="row admin-content-footer" style="margin-top: 20%">
  <hr>
  <p class="s12"  style="text-align: center">© 2016 #333  Licensed under MIT license.</p>
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

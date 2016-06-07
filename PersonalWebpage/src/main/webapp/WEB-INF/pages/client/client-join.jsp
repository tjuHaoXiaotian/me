<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2016/5/30
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>


<%@include file="common/header.jsp" %>


<div class="container" style="margin-top:20px;">



</div>

<!--Import jQuery before materialize.js-->
<%--<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>--%>
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/materialize.min.js"></script>
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



</script>
</body>
</html>

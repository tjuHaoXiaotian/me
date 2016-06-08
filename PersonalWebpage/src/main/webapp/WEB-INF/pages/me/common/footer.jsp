<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<footer class="main-footer">
  <div class="container">
    <div class="row">
      <div class="col-md-4">
        <div class="widget">
          <h4 class="title" id="#">最新文章</h4>
          <div class="content recent-post" id="recent-post">

          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget">
          <h4 class="title" id="">友情链接</h4>
          <div class="content tag-cloud">
            <a href="http://www.oracle.com/technetwork/java/javase/downloads/index-jsp-138363.html">Java</a>
            <a href="http://mvnrepository.com/">Maven</a>
            <a href="http://hibernate.org/orm/">Hibernate</a>
            <a href="https://spring.io/">Spring</a>
            <a href="https://spring.io/">Spring MVC</a>
            <a href="http://struts.apache.org/">Struts2</a>
            <a href="http://www.mysql.com/">MySQL</a>
            <a href="http://jquery.com/">Jquery</a>
            <a href="http://www.bootcss.com/">BootStrap</a>
            <a >Linux</a>
            <a href="https://www.aliyun.com/">阿里云服务</a>
            <a href="">腾讯云服务</a>
            <a href="http://nginx.org/">Nginx</a>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget">
          <h4 class="title">项目</h4>
          <a href="${pageContext.request.contextPath}/projects.html#lostFound">北洋园LostFound</a>
        </div>
      </div>
    </div>
  </div>
</footer>
<div class="copyright">
  <div class="container">
    <div class="row">
      <div class="col-sm-12 info">
        <span>Copyright &copy; <a href="http://www.ghostchina.com/">Ghost中文网</a></span> |
        <span><a href="http://www.miibeian.gov.cn/" target="_blank">京ICP备11008151号</a></span> |
        <span>京公网安备11010802014853</span>
      </div>
    </div>
  </div>
</div>

<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>

<script>
  var rootUrl = "<%=basePath%>";
  function loadRecentArticlesForBottom(){
    $.ajax({
      url: rootUrl+'${pageContext.request.contextPath}/articles/recent',
      contentType:"application/json",
      type: 'get',
      dataType: 'json'
    }).success(function(data){
      if(data.state == 200){
        var html = "";
        if(data != null){
          var articles = data.data.newsArray;
          console.log("result",articles);
          var length = articles.length >3?3:articles.length;
          for(var i = 0; i<length;i++){
            html+='<div class="recent-single-post">'+
            '<a class="post-title" href="${pageContext.request.contextPath}/articles/article_'+articles[i].id+'.html">'+articles[i].title+'</a>'+
            '<div class="date">'+articles[i].updateTime+'</div>'+
            '    </div>';
          }
        }
        $("#recent-post").html(html);
      }else{
        alert("recent-articles 获取失败！");
      }
    }).error(function(){
      alert("recent-articles 获取失败");
    });
  }

  $(function(){
    $("#menu").find("li").click(function(e){
      e.preventDefault();
      $("#menu li").eq($(this).index()).addClass("nav-current").siblings().removeClass("nav-current");
    },function(){

    });

    $("#interest-list").find("a").hover(function(e){
      e.preventDefault();
      $("#interest-list a").eq($(this).index()).css("background-color","#e67e22").css("color","white").siblings().css("background-color","white").css("color","#959595");
    },function(){
      $("#interest-list a").eq($(this).index()).css("background-color","white").css("color","#959595");
    });


  });

  $(document).ready(function() {
    loadRecentArticlesForBottom();
  });
</script>
</body>
</html>
















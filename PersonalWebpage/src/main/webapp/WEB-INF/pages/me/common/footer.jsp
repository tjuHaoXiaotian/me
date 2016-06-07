<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<footer class="main-footer">
  <div class="container">
    <div class="row">
      <div class="col-md-4">
        <div class="widget">
          <h4>最新文章</h4>
          <div class="content recent-post">
            <div class="recent-single-post">
              <a class="post-title" href="#">Ghost 0.7.0 正式发布</a>
              <div class="date">September 7, 2015</div>
            </div>
            <div class="recent-single-post">
              <a class="post-title" href="#">Ghost 0.7 中 {{ghost_foot}} 助手函数将不再输出 jQuery</a>
              <div class="date">August 29, 2015</div>
            </div>
            <div class="recent-single-post">
              <a class="post-title" href="#">Ghost 0.7 即将发布，高清大图提前看</a>
              <div class="date">August 23, 2015</div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget">
          <h4 class="title" id="">标签云</h4>
          <div class="content tag-cloud">
            <a href="">Ghost</a>
            <a href="">新版本发布</a>
            <a href="">JavaScript</a>
            <a href="">Promise</a>
            <a href="">主题</a>
            <a href="">MySQL</a>
            <a href="">Node.js</a>
            <a href="">深度玩转 Ghost</a>
            <a href="">Ubuntu</a>
            <a href="">阿里云服务</a>
            <a href="">Nginx</a>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget">
          <h4 class="title">合作伙伴</h4>
          <a href="#">Bootstrap 中文网</a>
          <a href="#">开放CDN服务</a>
          <a href="#">Grunt中文网</a>
          <a href="#">阿里云</a>
          <a href="#">又拍云</a>
          <a href="#">UCloud </a>
          <a href="#">七牛云存储</a>
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
  $(function(){
    $("#menu").find("li").click(function(e){
      e.preventDefault();
      $("#menu li").eq($(this).index()).addClass("nav-current").siblings().removeClass("nav-current");
    },function(){

    });

//        $("#interest-list").find("a").hover(function(e){
//            e.preventDefault();
//            $("#interest-list a").eq($(this).index()).addClass("tag-list-background").siblings().removeClass("tag-list-background");
//        },function(){
//            $("#interest-list a").eq($(this).index()).removeClass("tag-list-background");
//        });

    $("#interest-list").find("a").hover(function(e){
      e.preventDefault();
      $("#interest-list a").eq($(this).index()).css("background-color","#e67e22").css("color","white").siblings().css("background-color","white").css("color","#959595");
    },function(){
      $("#interest-list a").eq($(this).index()).css("background-color","white").css("color","#959595");
    });

//        $("#interest-list a").mouseover(function(e){
//            e.preventDefault();
////            $(this).tab("show");
//            $("#interest-list a").eq($(this).index()).addClass("tag-list-background").siblings().removeClass("tag-list-background");
//
//        });
  });
</script>
</body>
</html>
















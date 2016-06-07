<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>


<%@include file="common/header.jsp" %>


<div class="container" style="margin-top:20px;">
    <div class="row">

        <div class="col s3">
            <div class="card">
                <div class="card-content">
                    <span class="card-title"><b>要闻</b></span>
                    <ul>
                        <c:forEach var="news" items="${importants.results}" step="1">
                            <li>
                                <a href="${pageContext.request.contextPath}/index/view/news/${news.id}">${news.title}</a>
                                 <br><span class="badge" style="margin-right:0px">${news.checkTime}</span>
                                <br>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col s6">
            <div class="slider text-red">
                <ul class="slides">
                    <c:forEach var="image" items="${images}">
                        <li>
                            <a href="${pageContext.request.contextPath}/index/view/images/${image.id}">
                                <img src="${image.imageUrl}">
                                <div class="caption left-align">
                                    <h5 class="white-text">${image.title}</h5>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <div class="col s3">
            <div class="card">
                <div class="card-content">
                    <span class="card-title"><b>公告</b></span>
                    <ul>
                        <c:forEach var="news" items="${publics.results}" step="1">
                            <li>
                                <a href="${pageContext.request.contextPath}/index/view/news/${news.id}">${news.title}</a><br><span style="margin-right:0px" class="badge">${news.checkTime}</span>
                            </li>
                            <br>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>



        <div class="row">
            <a href="#">
                <div class="col s3">
                    <div class="card">
                        <div class="card-image">
                            <img src="<%=request.getContextPath()%>/resources/img/123/6.jpg">
                            <span class="card-title">勇敢大声唱</span>
                        </div>
                        <div class="card-content">
                            <p>青春，是人生协奏曲中最华美的乐章。人们热爱它的无限希望，热爱它的无限可能，热爱它的朝气蓬勃。</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="#">
                <div class="col s3">
                    <div class="card">
                        <div class="card-image">
                            <img src="<%=request.getContextPath()%>/resources/img/123/5.jpeg">
                            <span class="card-title">走进汉式婚礼</span>
                        </div>
                        <div class="card-content">
                            <p>“一捧捧黄土塑造千万个你我，静脉是长城，动脉是黄河，</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="#">
                <div class="col s3">
                    <div class="card">
                        <div class="card-image">
                            <img src="<%=request.getContextPath()%>/resources/img/123/4.jpg">
                            <span class="card-title">聚焦简历：打造个人职业品牌</span>
                        </div>
                        <div class="card-content">
                            <p>3月24日下午2时，由天津大学就业指导中心主办的简历特训会在卫津路校区大学</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="#">
                <div class="col s3">
                    <div class="card">
                        <div class="card-image">
                            <img src="<%=request.getContextPath()%>/resources/img/123/3.jpg">
                            <span class="card-title">人工智能AlphaGO</span>
                        </div>
                        <div class="card-content">
                            <p>
                                仪式伊始，党委副书记、纪委书记、工会主席汪曣发表致辞。在简明介绍了举办“</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="#">
                <div class="col s3">
                    <div class="card">
                        <div class="card-image">
                            <img src="<%=request.getContextPath()%>/resources/img/123/2.jpg">
                            <span class="card-title">相约四点半 师生面对面</span>
                        </div>
                        <div class="card-content">
                            <p>3月29日下午4时30分，“四点半工程”启动仪式于天津大学北洋园校区郑</p>
                        </div>
                    </div>
                </div>
            </a>
        </div>


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

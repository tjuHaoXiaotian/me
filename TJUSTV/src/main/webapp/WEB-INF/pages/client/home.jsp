<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"  %>
<%@include file="common/header.jsp"%>

<!--carousel-->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="${pageContext.request.contextPath}/client/img/u16.png" alt="...">
            <div class="carousel-caption">

            </div>
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/client/img/u18.png" alt="...">
            <div class="carousel-caption">

            </div>
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/client/img/u20.png" alt="...">
            <div class="carousel-caption">

            </div>
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/client/img/u22.png" alt="...">
            <div class="carousel-caption">

            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<!--container-->
<div id="container">
    <!--type of videos-->
    <div id="btn-types">
        <button id="btn-type0" class="btn-type" data-type-id="0" >热门</button>
        <button id="btn-type1" class="btn-type" data-type-id="1" >精选</button>
        <button id="btn-type2" class="btn-type" data-type-id="2" >经典</button>
        <button id="btn-type3" class="btn-type" data-type-id="3" >最新</button>
        <button id="btn-type4" class="btn-type" data-type-id="4" >游戏</button>
        <button id="btn-type5" class="btn-type" data-type-id="5" >搞笑</button>
        <button id="btn-type6" class="btn-type" data-type-id="6" >学视</button>
    </div>
    <div id="container_second">
        <div class="item" style="display: none;">
            <div class="shown_one">
                <div class="shown_one_bg">
                    <div class="shown_one_ctrl hidden">
                        <div class="circle">
                            <div class="button2" title="play" data-play-path="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="shown_one_txt">
                <div class="txt_left">
                    <h3></h3>
                    <h6>评分:</h6>
                    <span class="star_yellow" title="1/5"></span>
                    <span class="star_yellow" title="2/5"></span>
                    <span class="star_yellow" title="3/5"></span>
                    <span class="star_yellow" title="4/5"></span>
                    <span class="star_gray" title="5/5"></span>
                </div>
            </div>
        </div>
    </div>
</div>
<!--footer-->
<div id="footer">
    <h6>@2016 TJUSTV</h6>
    <!--<button type="button" id="adminLogin">管理员登陆</button>-->
</div>

</body>
<script>

</script>
</html>

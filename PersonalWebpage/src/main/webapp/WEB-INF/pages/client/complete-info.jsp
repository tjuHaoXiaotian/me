<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>


<%@include file="common/header.jsp" %>



<div class="container" style="margin-top:20px;">
    <div class="row">
        <div class="col s12">
            <div class="card" style="padding:30px;">
                <c:choose>
                    <c:when test="${club==null}">
                        <h4 style="color:#666;">Unername，这是您首次进入系统</h4>
                        <h5 style="color:#aaa;font-weight:300;">请完善您的社团信息</h5>
                    <form action="<%=request.getContextPath()%>/mng/clubs/add" method="post">
                    </c:when>
                    <c:otherwise>
                        <h4 style="color:#666;">${club.name},欢迎进入系统  &nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/mng/clubs/${club.clubId}/departments"> 部门信息</a></h4>
                        <h5 style="color:#aaa;font-weight:300;">您的社团信息：</h5>
                        <form action="<%=request.getContextPath()%>/mng/clubs/update" method="post">
                    </c:otherwise>
                </c:choose>


                    <div class="row">
                        <div class="input-field col s3">
                            <input id="weeks1" name="name" type="text" class="validate" placeholder="${club.name}">
                            <label for="weeks1">输入贵社团名称</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s3">
                            <input id="weeks2" name="responsiblePerson" type="text" class="validate" placeholder="${club.responsiblePerson}">
                            <input id="weeks3" name="tel" type="text" class="validate" placeholder="${club.tel}">
                            <label for="weeks3">输入贵社团负责人电话</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <textarea id="textarea1" name="introduction" class="materialize-textarea" placeholder="${club.introduction}"></textarea>
                            <label for="textarea1">社团简介</label>
                        </div>
                    </div>

                    <div class="row">
                        <input type="submit"class="waves-effect waves-light btn red lighten-1" value="添加信息">
                    </div>


            </form>
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
    });
    $(document).ready(function(){
        $('.slider').slider({full_width: true});
        $('.modal-trigger').leanModal();
        $(".dropdown-button").dropdown();
    });
</script>
</body>
</html>


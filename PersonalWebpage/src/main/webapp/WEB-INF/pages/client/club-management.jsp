<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>


<%@include file="common/header.jsp" %>


<div class="container" style="margin-top:20px;">
    <div class="row">
        <div class="col s12">
            <div class="card" style="padding:30px;">
                <table>
                    <thead>
                    <tr>
                        <th data-field="id">社团名字</th>
                        <th data-field="name">状态</th>
                        <%--<th data-field="price"></th>--%>
                        <th></th>
                    </tr>
                    </thead>

                    <tbody>
                    <C:forEach var="club" items="${clubs}">

                        <tr>
                            <td>${club.name}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${club.user.state=='0'}">
                                        正常
                                    </c:when>
                                    <c:when test="${club.user.state=='1'}">
                                        禁用
                                    </c:when>
                                    <c:otherwise>
                                        未知状态
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><a href="<%=request.getContextPath()%>/mng/club/shift?id=${club.user.userId}">切换状态</a></td>
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

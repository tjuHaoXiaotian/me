<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>


<%@include file="common/header.jsp" %>


    <div id="detail-model" class="modal">
      <div class="modal-content" style="color:#333;">
        <h4>详细信息</h4>
        <p>

          社团名称：${applys[param.index].clubName}<br/>
          申请类型：
          <c:choose>
          <c:when test="${applys[param.index].targetName}=='1'">
          教室
          </c:when>
          <c:when test="${applys[param.index].targetName}=='2'">
          会议室
          </c:when>
          <c:when test="${applys[param.index].targetName}=='3'">
          场地
          </c:when>
          <c:when test="${applys[param.index].targetName}=='4'">
          宣传品
          </c:when>
          <c:otherwise>
          未知类型
          </c:otherwise>
          </c:choose>
          <br/>
          申请时间：第${applys[param.index].week}周
          <c:choose>
          <c:when test="${applys[param.index].targetName}=='4'">
          至 第${applys[param.index].weekDay}周
          </c:when>
          <c:otherwise>
          星期${applys[param.index].weekDay} 第${applys[param.index].units}节
          </c:otherwise>
          </c:choose>
          <br/>
          申请缘由：${applys[param.index].reason}<br/>
          申请表下载：<a href="#" style="color:#999;text-decoration:underline;">申请表.docx</a>
        <form>
          <div class="input-field col s6">
            <textarea id="textarea1" name="refuseReason" class="materialize-textarea"></textarea>
            <label for="textarea1">拒绝理由</label>
          </div>
        </form>
        </p>
        <div class="modal-footer">
          <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">同意</a>
          <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">拒绝</a>
        </div>
      </div>
    </div>

    <div class="container" style="margin-top:20px;">
      <div class="row">
        <div class="col s12">
          <div class="card" style="padding:30px;">
            <table>
              <thead>
                <tr>
                    <th data-field="id">社团名字</th>
                    <th data-field="name">状态</th>
                    <th data-field="price">日期</th>
                    <th></th>
                </tr>
              </thead>

              <tbody>
              <C:forEach var="apply" items="${applys}" varStatus="status">

                <tr>
                  <td>${apply.clubName}</td>
                  <td>
                    <c:choose>
                      <c:when test="${apply.status=='0'}">
                        待审批
                      </c:when>
                      <c:when test="${apply.status=='1'}">
                        未通过
                      </c:when>
                      <c:when test="${apply.status=='2'}">
                        已批准
                      </c:when>
                      <c:otherwise>
                        未知状态
                      </c:otherwise>
                    </c:choose>
                  </td>
                  <td>${apply.recordTime}</td>

                  <td>
                    <form action="#detail-model" method="post">
                      <input name="index" value="${status.index}" type="hidden" />
                      <input type="submit" value="查看详细"/>
                    </form>
                    <%--<button onclick="details()"></button>--%>
                  </td>
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

//      function details(ID){
//        console.log(ID);
//        var i = document.getElementById("index");
//        alert(i);
//      }
    </script>
  </body>
</html>

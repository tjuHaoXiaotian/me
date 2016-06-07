<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>


<%@include file="common/header.jsp" %>



    <div class="container" style="margin-top:20px;">
      <div class="row">
        <div class="col s12">
          <div class="card" style="padding:30px;">
            <form action="<%=request.getContextPath()%>/mng/applys/add?type=4" method="post">
              <div class="row">
                <div class="input-field col s3">
                 <select name="targetName">
                   <option value="" disabled selected>悬挂场地</option>
                   <option value="1">大活</option>
                   <option value="2">七里台</option>
                   <option value="3">鹏翔</option>
                 </select>
                 <label>输入悬挂场地</label>
               </div>
              </div>
              <div class="row">
                <div class="input-field col s3">
                  <input id="startweek" type="text" name="week" class="validate">
                  <label for="startweek">输入申请起始周数</label>
                </div>
              </div>
              <div class="row">
                <div class="input-field col s3">
                  <input id="endweek" type="text" name="weekDay" class="validate">
                  <label for="endweek">输入申请终止周数</label>
                </div>
              </div>
              <div class="row">
                  <div class="input-field col s6">
                    <textarea id="textarea1" name="reason" class="materialize-textarea"></textarea>
                    <label for="textarea1">申请缘由</label>
                  </div>
                </div>
                <div class="row">
                  <div class="file-field input-field col s6">
                    <div class="btn red lighten-1">
                      <span>申请表照片</span>
                      <input type="file" >
                    </div>
                    <div class="file-path-wrapper">
                      <input class="file-path validate" type="text" name="picturePath">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="file-field input-field col s6">
                    <div class="btn red lighten-1">
                      <span>宣传品样图</span>
                      <input type="file">
                    </div>
                    <div class="file-path-wrapper">
                      <input class="file-path validate"  name="filePath" type="text">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <input type="submit"class="waves-effect waves-light btn red lighten-1">
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
    </script>
  </body>
</html>

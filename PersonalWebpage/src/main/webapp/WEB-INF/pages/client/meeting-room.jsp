<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>


<%@include file="common/header.jsp" %>


    <div class="container" style="margin-top:20px;">
      <div class="row">
        <div class="col s12">
          <div class="card" style="padding:30px;">
            <form action="<%=request.getContextPath()%>/mng/applys/add?type=2" method="post">
              <div class="row">
                <div class="input-field col s3">
                 <select name="targetName">
                   <option value="" disabled selected>会议室编号</option>
                   <option value="1">1</option>
                   <option value="2">2</option>
                   <option value="3">3</option>
                   <option value="4">4</option>
                 </select>
                 <label>会议室编号</label>
               </div>
              </div>
              <div class="row">
                <div class="input-field col s3">
                  <input id="weeks" name="week" type="text" class="validate">
                  <label for="weeks">输入申请周数</label>
                </div>
              </div>
              <div class="row">
                <div class="input-field col s3">
                 <select name="units">
                   <option value=""  disabled selected>申请节数</option>
                   <option value="1">1-2</option>
                   <option value="2">3-4</option>
                   <option value="3">5-6</option>
                   <option value="3">7-8</option>
                   <option value="3">9-10</option>
                   <option value="3">11-12</option>
                 </select>
                 <label>申请节数</label>
               </div>
              </div>
              <div class="row">
                <div class="input-field col s3">
                 <select name="weekDay">
                   <option value="" disabled selected>星期几</option>
                   <option value="1">星期一</option>
                   <option value="2">星期二</option>
                   <option value="3">星期三</option>
                   <option value="3">星期四</option>
                   <option value="3">星期五</option>
                   <option value="3">星期六</option>
                   <option value="3">星期日</option>
                 </select>
                 <label>申请星期数</label>
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
                      <input class="file-path validate" name="picturePath" type="text">
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

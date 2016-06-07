<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>


<%@include file="common/header.jsp" %>


    <div class="container" style="margin-top:20px;">
      <div class="row">
        <div class="col s12">
          <div class="card" style="padding:30px;">
            <form>
              <div class="row">
                <div class="input-field col s3">
                 <select name="clubName">
                   <option value="" disabled selected>选择申报社团</option>
                   <option value="1">1</option>
                   <option value="2">2</option>
                   <option value="3">3</option>
                   <option value="3">4</option>
                 </select>
                 <label>选择申报社团</label>
               </div>
              </div>
              <div class="row">
                <div class="input-field col s3">
                  <input id="weeks" name="studentName" type="text" class="validate">
                  <label for="weeks">姓名</label>
                </div>
              </div>
              <div class="row">
                <div class="input-field col s3">
                  <input id="grade" name="grade" type="text" class="validate">
                  <label for="grade">年级</label>
                </div>
              </div>
              <div class="row">
                <div class="input-field col s3">
                  <input id="tel" name="tel" type="text" class="validate">
                  <label for="tel">电话</label>
                </div>
              </div>
              <div class="row">
                <div class="input-field col s3">
                  <input id="major" name="major" type="text" class="validate">
                  <label for="major">专业</label>
                </div>
              </div>
              <div class="row">
                  <div class="input-field col s6">
                    <textarea id="textarea1" name="info" class="materialize-textarea"></textarea>
                    <label for="textarea1">个人简介</label>
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

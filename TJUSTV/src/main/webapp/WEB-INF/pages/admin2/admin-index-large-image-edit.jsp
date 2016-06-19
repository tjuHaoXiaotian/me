<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/header.jsp" %>
<!-- content start -->
<div class="admin-content">
  <div class="admin-content-body">
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong> / <small>首页大图修改</small></div>
    </div>
    <hr>
    <div class="am-g ">
      <div class="am-u-sm-12">
        <div class="am-tabs-bd">

          <div class="am-tab-panel am-fade am-in am-active" id="tab2">
            <form class="am-form">

              <input type="text" id="newsId" style="display: none"/>


              <div class="am-g am-margin-top">
                <div class="am-u-sm-4 am-u-md-2 am-text-right">
                  轮播标题
                </div>
                <div class="am-u-sm-8 am-u-md-5">
                  <input id="title" type="text" class="am-input-sm">
                </div>
                <div class="am-hide-sm-only am-u-md-5">*必填</div>
              </div>

              <div class="am-g am-margin-top">
                <div class="am-u-sm-4 am-u-md-2 am-text-right">
                  关键字
                </div>
                <div class="am-u-sm-8 am-u-md-5">
                  <input id="keyWords" type="text" class="am-input-sm">
                </div>
                <div class="am-hide-sm-only am-u-md-5"></div>
              </div>


              <div class="am-g am-margin-top">
                <div class="am-u-sm-4 am-u-md-2 am-text-right">
                  正文
                </div>
                <div class="am-u-sm-8 am-u-md-10 am-u-end col-end">
                  <!-- 加载编辑器的容器 -->
                  <script id="editor" name="content" type="text/plain" style="height:500px;">

                  </script>
                </div>
              </div>



            </form>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right" style="opacity: 0">
                话题
              </div>
              <div class="am-u-sm-8 am-u-md-5">
                <button onclick="updateNews()" class="am-btn am-btn-primary am-btn-block" >修改</button>
              </div>
              <div class="am-hide-sm-only am-u-md-5"></div>
            </div>

          </div>

        </div>

      </div>
    </div>



    <%--<div id="btns">--%>
    <%--<div>--%>
    <%--<button onclick="getAllHtml()">获得整个html的内容</button>--%>
    <%--<button onclick="getContent()">获得内容</button>--%>
    <%--<button onclick="setContent()">写入内容</button>--%>
    <%--<button onclick="setContent(true)">追加内容</button>--%>
    <%--<button onclick="getContentTxt()">获得纯文本</button>--%>
    <%--<button onclick="getPlainTxt()">获得带格式的纯文本</button>--%>
    <%--<button onclick="hasContent()">判断是否有内容</button>--%>
    <%--<button onclick="setFocus()">使编辑器获得焦点</button>--%>
    <%--<button onmousedown="isFocus(event)">编辑器是否获得焦点</button>--%>
    <%--<button onmousedown="setblur(event)" >编辑器失去焦点</button>--%>

    <%--</div>--%>
    <%--<div>--%>
    <%--<button onclick="getText()">获得当前选中的文本</button>--%>
    <%--<button onclick="insertHtml()">插入给定的内容</button>--%>
    <%--<button id="enable" onclick="setEnabled()">可以编辑</button>--%>
    <%--<button onclick="setDisabled()">不可编辑</button>--%>
    <%--<button onclick=" UE.getEditor('editor').setHide()">隐藏编辑器</button>--%>
    <%--<button onclick=" UE.getEditor('editor').setShow()">显示编辑器</button>--%>
    <%--<button onclick=" UE.getEditor('editor').setHeight(300)">设置高度为300默认关闭了自动长高</button>--%>
    <%--</div>--%>

    <%--<div>--%>
    <%--<button onclick="getLocalData()" >获取草稿箱内容</button>--%>
    <%--<button onclick="clearLocalData()" >清空草稿箱</button>--%>
    <%--</div>--%>

    <%--</div>--%>
    <%--<div>--%>
    <%--<button onclick="createEditor()">--%>
    <%--创建编辑器</button>--%>
    <%--<button onclick="deleteEditor()">--%>
    <%--删除编辑器</button>--%>
    <%--</div>--%>


    <footer class="admin-content-footer" style="margin-top: 20%">
      <hr>
      <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </footer>
  </div>

</div>

<!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="${pageContext.request.contextPath}/resources/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>


<!-- ueEditor -->
<!-- 配置文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.js"></script>

<script type="text/javascript">
  //实例化编辑器
  //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
  var ue = UE.getEditor('editor',{
    autoHeightEnabled: false,
    autoFloatEnabled: false
  });


  //    function isFocus(e){
  //        alert(UE.getEditor('editor').isFocus());
  //        UE.dom.domUtils.preventDefault(e)
  //    }
  //    function setblur(e){
  //        UE.getEditor('editor').blur();
  //        UE.dom.domUtils.preventDefault(e)
  //    }
  //    function insertHtml() {
  //        var value = prompt('插入html代码', '');
  //        UE.getEditor('editor').execCommand('insertHtml', value)
  //    }
  //    function createEditor() {
  //        enableBtn();
  //        UE.getEditor('editor');
  //    }
  //    function getAllHtml() {
  //        alert(UE.getEditor('editor').getAllHtml())
  //    }
  //    function getContent() {
  //        var arr = [];
  //        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
  //        arr.push("内容为：");
  //        arr.push(UE.getEditor('editor').getContent());
  //        alert(arr.join("\n"));
  //    }
  //    function getPlainTxt() {
  //        var arr = [];
  //        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
  //        arr.push("内容为：");
  //        arr.push(UE.getEditor('editor').getPlainTxt());
  //        alert(arr.join('\n'))
  //    }
  //    function setContent(isAppendTo) {
  //        var arr = [];
  //        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
  //        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
  //        alert(arr.join("\n"));
  //    }
  //    function setDisabled() {
  //        UE.getEditor('editor').setDisabled('fullscreen');
  //        disableBtn("enable");
  //    }
  //
  //    function setEnabled() {
  //        UE.getEditor('editor').setEnabled();
  //        enableBtn();
  //    }
  //
  //    function getText() {
  //        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
  //        var range = UE.getEditor('editor').selection.getRange();
  //        range.select();
  //        var txt = UE.getEditor('editor').selection.getText();
  //        alert(txt)
  //    }
  //
  //    function getContentTxt() {
  //        var arr = [];
  //        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
  //        arr.push("编辑器的纯文本内容为：");
  //        arr.push(UE.getEditor('editor').getContentTxt());
  //        alert(arr.join("\n"));
  //    }
  //    function hasContent() {
  //        var arr = [];
  //        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
  //        arr.push("判断结果为：");
  //        arr.push(UE.getEditor('editor').hasContents());
  //        alert(arr.join("\n"));
  //    }
  //    function setFocus() {
  //        UE.getEditor('editor').focus();
  //    }
  //    function deleteEditor() {
  //        disableBtn();
  //        UE.getEditor('editor').destroy();
  //    }
  //    function disableBtn(str) {
  //        var div = document.getElementById('btns');
  //        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
  //        for (var i = 0, btn; btn = btns[i++];) {
  //            if (btn.id == str) {
  //                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
  //            } else {
  //                btn.setAttribute("disabled", "true");
  //            }
  //        }
  //    }
  //    function enableBtn() {
  //        var div = document.getElementById('btns');
  //        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
  //        for (var i = 0, btn; btn = btns[i++];) {
  //            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
  //        }
  //    }
  //
  //    function getLocalData () {
  //        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
  //    }
  //
  //    function clearLocalData () {
  //        UE.getEditor('editor').execCommand( "clearlocaldata" );
  //        alert("已清空草稿箱")
  //    }

  var rootUrl = "<%=basePath%>"+"${pageContext.request.contextPath}";
  <%--console.log("rootUrl",<%=basePath%>);--%>
  $(function(){
    initFormData();
  });

  //    $(document).ready(function() {
  //        getTypes();
  //        initEditorData();
  //    });


  function initFormData(){
    $.ajax({
      url: rootUrl + "/admin/index/${id}",
      contentType:"application/json",
      type: 'get',
      dataType:'JSON'
    }).success(function(data){

      if(data.state == 200){
        var news = data.data.news;
        $("#newsId").val(news.id);
        $("#title").val(news.title);
        $("#keyWords").val(news.keyWords);
        //对编辑器的操作最好在编辑器ready之后再做
        ue.ready(function() {
          //设置编辑器的内容
          ue.setContent(news.content);
//                    //获取html内容，返回: <p>hello</p>
//                    var html = ue.getContent();
//                    //获取纯文本内容，返回: hello
//                    var txt = ue.getContentTxt();
        });

      }else{
        alert("iamge 获取失败！");
      }
    }).error(function(){
      alert("image 获取失败！");
    });
  }



  function updateNews(){

    ue.ready(function() {
      var news = {
        id:$("#newsId").val(),
        title:$("#title").val(),
        keyWords: $("#keyWords").val(),
        content:ue.getContent(),
        briefContent:UE.getEditor('editor').getContentTxt().substring(0,25)
      };

      console.log("数据是：",JSON.stringify(news));
      $.ajax({
        url: rootUrl + "/admin/index",
        contentType:"application/json",
        type: 'put',
        dataType:'JSON',
        data:JSON.stringify(news)
      }).success(function(data){
        if(data.state != 200){
          alert(data.message + "\n" + data.data.error);
        }else{
          alert("修改成功！");
        }
      }).error(function(){

      });
    });


  }



</script>

</body>
</html>

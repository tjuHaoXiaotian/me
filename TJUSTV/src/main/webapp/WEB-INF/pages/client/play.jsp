<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"  %>
<%@include file="common/header.jsp"%>

<!--container-->
<div id="container">
    <!--视频-->
    <div id="videoBox">
        <video id="theVideo" controls src="" ></video>
    </div>
    <!--操作-->
    <div id="videoAction">
        <div id="praise" title="点赞">
            <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true" data-actioned="false" title="点赞"></span>
        </div>
        <div id="collection" title="收藏">
            <span class="glyphicon glyphicon-folder-open" aria-hidden="true" data-actioned="false" title="收藏"></span>
        </div>
    </div>
    <!--评论-->
    <div id="comments" class="panel panel-default">
        <div class="panel-heading">视频评论</div>
        <div class="panel-body">
            <table class="table">
                <thead>
                    <th>#</th>
                    <th>评论内容</th>
                    <th>用户</th>
                    <th>时间</th>
                </thead>
                <tbody>

                </tbody>
            </table>
            <div id="newComment">
                <textarea rows="3" placeholder="这个视频怎么样?写点什么吧~"></textarea>
                <button class="btn">评论</button>
            </div>
        </div>
    </div>
</div>

<!--footer-->
<div id="footer">
    <h6>@2016 TJUSTV</h6>
</div>

</body>
<script>
    var $tbody = $('div#comments tbody');
    var videoId = getUrlParam('videoId');
    var userId = $.cookie('STV_userId');
    $(document).ready(function(){
        $('video#theVideo').attr('src', getUrlParam('path'));
        $('div#videoAction div').on('mouseenter', function() {
            $(this).find('span').first().addClass('yellow');
        });
        $('div#videoAction div').on('mouseleave', function() {
            if ($(this).find('span').first().attr('data-actioned') == 'false') {
                $(this).find('span').first().removeClass('yellow');
            }
        });


        getComments();

        $('div#videoAction div').on('click', function() {
            if ($(this).find('span').last().attr('data-actioned') == 'true') {
                $(this).find('span').last().attr('data-actioned', 'false');
                alert('已取消' + $(this).attr('title'));


            } else {
                if ($(this).find('span').last().attr('data-actioned') == 'false') {
                    $(this).find('span').last().attr('data-actioned', 'true');
                    var text = $(this).attr('title');
                    if ($(this).attr('id') == 'praise') {
                        $.getJSON('http://121.42.217.4:8080/TJUSTV/videos/' + videoId + '/praise', function(result) {
                            if (result.state == 200) {
                                alert('已' + text);
                            }
                        });
                    }
                    if ($(this).attr('id') == 'collection') {
                        var data = {
                            'videoId' : videoId
                        };
                        $.post(' http://121.42.217.4:8080/TJUSTV/users/' + userId + '/collections', data, function(result) {
                            if (result.state == 200) {
                                alert('已' + text);
                            }
                        });
                    }
                }
            }
        });

        $('div#newComment button').on('click', function() {

            if (userId == null) {
                alert("您还没有登陆,请登录后评论!");
            } else {
                var commentData = {
                    'videoId' : getUrlParam('videoId'),
                    'content' : $('div#newComment textarea').val()
                };
                $.post('http://121.42.217.4:8080/TJUSTV/users/' + userId + '/comments', commentData, function(result) {
                    if (result.state == 200) {
                        getComments();
                        $('div#newComment textarea').val('');
                    }
                });
            }
        });
    });

    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) {
            return unescape(r[2]);
        } else {
            return null;
        } //返回参数值
    }
    function getLocalTime(nS) {
        return new Date(parseInt(nS)).toLocaleString().replace(/:\d{1,2}$/,' ');
    }
    function getComments() {
        $tbody.text('');
        $.getJSON('http://121.42.217.4:8080/TJUSTV/videos/' + videoId + '/comments', function(result) {
            if (result.state == 200) {
                var data = result.data.comments;

                for (var i = 0; i < data.length; i++) {
                    var $tr = $('<tr></tr>');
                    var num = i + 1;
                    var $num = $('<td>' + num + '</td>');
                    var $comment = $('<td>' + data[i].content + '</td>');
                    var $user = $('<td>' + data[i].user.account + '</td>');
                    var time = data[i].createtime;
                    time = getLocalTime(time);
                    var $time = $('<td>' + time + '</td>');
                    $tr.append($num).append($comment).append($user).append($time);
                    $tbody.append($tr);
                }
            }
        });
    }

</script>
</html>

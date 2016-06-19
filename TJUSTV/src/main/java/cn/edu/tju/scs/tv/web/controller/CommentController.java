package cn.edu.tju.scs.tv.web.controller;


import cn.edu.tju.scs.common.dto.BizCode;
import cn.edu.tju.scs.common.dto.StateCode;
import cn.edu.tju.scs.tv.domain.Comment;
import cn.edu.tju.scs.tv.domain.User;
import cn.edu.tju.scs.tv.service.CommentService;
import cn.edu.tju.scs.tv.service.UserService;
import cn.edu.tju.scs.tv.web.controller.base.BaseController;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * User Controller
 * Created by jack on 2016/3/28.
 */

@Controller(value = "commentController")
@RequestMapping(value = {"/comments"})
public class CommentController extends BaseController {


    @Autowired
    CommentService commentService;

    @Autowired
    UserService userService;
    /**
     * 添加一个评论，可能有错
     * @return
     */
    @RequiresUser
    @RequestMapping(method = RequestMethod.POST)
    public @ResponseBody
    StateCode comment(@RequestParam("videoId") Integer videoId,@RequestParam("content")String  content, @RequestParam(value = "userId") int userId ) {
        StateCode stateCode;
        User user = userService.findUserById(userId);
        if(user != null) {
            stateCode =  StateCode.buildCode(BizCode.SUCCESS);
            Comment comment = new Comment();
            comment.setContent(content);
            comment.setVideoId(videoId);
            comment.setUser(user);
            commentService.add(comment);
        }else{
            stateCode = StateCode.buildCode(BizCode.FAIL);
        }
        return stateCode;

    }


    /**
     * 删除一个评论
     * @return
     */
    @RequiresUser
    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    public @ResponseBody
    StateCode deComment(@PathVariable int id) {
        commentService.removeComment(id);
        return StateCode.buildCode(BizCode.SUCCESS);
    }
}

package cn.edu.tju.scs.tv.web.controller;

import cn.edu.tju.scs.common.dto.BizCode;
import cn.edu.tju.scs.common.dto.StateCode;
import cn.edu.tju.scs.tv.domain.Comment;
import cn.edu.tju.scs.tv.domain.User;
import cn.edu.tju.scs.tv.service.CollectionService;
import cn.edu.tju.scs.tv.service.CommentService;
import cn.edu.tju.scs.tv.service.UserService;
import cn.edu.tju.scs.tv.web.aspect.RequireOwner;
import cn.edu.tju.scs.tv.web.controller.base.BaseController;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
* User Controller
* Created by jack on 2016/3/28.
*/

@Controller(value = "userController")
@RequestMapping(value = "/users")
public class UserController extends BaseController {

    @Autowired
    UserService userService;

    @Autowired
    CommentService commentService;

    @Autowired
    CollectionService collectionService;



    /**
     * 查看所有用户信息
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public @ResponseBody
    StateCode getAllUser() {
        StateCode stateCode =  StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("users",userService.getAll());
        return stateCode;
    }

    /**
     * 查看 指定 id 用户信息
     * @return
     */
    @RequireOwner("User")
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public @ResponseBody
    StateCode getAllUser(@PathVariable int id) {
        StateCode stateCode =  StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("user",userService.findUserById(id));
        return stateCode;
    }




    /**
     * 添加一个收藏
     * @return
     */
    @RequiresUser
    @RequestMapping(value = "/{userId}/collections",method = RequestMethod.POST)
    public @ResponseBody
    StateCode collect(@PathVariable int userId,@RequestParam(value = "videoId") int videoId ) {
        StateCode stateCode =  StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("collectionId",collectionService.collect(userId,videoId));
        return stateCode;
    }

    /**
     * 取消一个收藏
     * @return
     */
    @RequiresUser
    @RequestMapping(value = "/{userId}/collections/{collectionId}",method = RequestMethod.DELETE)
    public @ResponseBody
    StateCode deCollect(@PathVariable int userId,@PathVariable int collectionId) {
        collectionService.deCollect(collectionId);
        return StateCode.buildCode(BizCode.SUCCESS);
    }


    /**
     * 查看所有收藏
     * @return
     */
    @RequiresUser
    @RequestMapping(value = "/{userId}/collections",method = RequestMethod.GET)
    public @ResponseBody
    StateCode getAllCollection(@PathVariable int userId) {
        StateCode stateCode =  StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("collections", collectionService.getAllCollection(userId));
        return stateCode;
    }


    /**
     * 添加一个评论，可能有错
     * @return
     */
    @RequiresUser
    @RequestMapping(value = "/comments",method = RequestMethod.POST)
    public @ResponseBody
    StateCode comment(@RequestParam("user") String username,@RequestParam("videoId") Integer videoId,@RequestParam("content")String  content) {
        StateCode stateCode;
        User user = userService.findUserByName(username);
        if(user != null) {
            stateCode =  StateCode.buildCode(BizCode.SUCCESS);
            Comment comment = new Comment();
            comment.setContent(content);
            comment.setVideoId(videoId);
            comment.setUser(user);
            commentService.add(comment);
            stateCode.addData("comment",comment);
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
    @RequestMapping(value = "/{userId}/comments/{commentId}",method = RequestMethod.DELETE)
    public @ResponseBody
    StateCode deComment(@PathVariable int userId,@PathVariable int commentId) {
        commentService.removeComment(commentId);
        return StateCode.buildCode(BizCode.SUCCESS);
    }


}

package cn.edu.tju.scs.club.web.controller;

import cn.edu.tju.scs.common.Constants;
import cn.edu.tju.scs.common.dto.BizCode;
import cn.edu.tju.scs.common.dto.StateCode;
import cn.edu.tju.scs.club.domain.User;
import cn.edu.tju.scs.club.service.UserService;
import cn.edu.tju.scs.club.web.controller.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by Takahashi on 2016/3/26.
 */
@Controller(value = "userController")
@RequestMapping(value ={"users"})
public class UserController extends BaseController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public @ResponseBody
    StateCode login(@RequestBody User user, HttpSession httpSession){
        if(userService.hasMatchUser(user.getAccount(),user.getPassword())){
            httpSession.setAttribute(Constants.USER_SESSION_KEY,user.getAccount());
            System.out.println("有这样的用户——————————————————————————————————————");
            return  StateCode.buildCode(BizCode.SUCCESS);
        }else {
//            throw new RuntimeException("match failure");
//            int a =  1 / 0;
            System.out.println("无这样的用户——————————————————————————————————————");
            return  StateCode.buildCode(BizCode.WRONGUSER);
        }

    }
}

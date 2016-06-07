package cn.edu.tju.scs.me.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * homepage controller
 * Created by haoxiaotian on 2016/6/7 19:50.
 */
@Controller
@RequestMapping("/index.html")
public class MeController {

    /**
     * 首页
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String homepage(){
        return "me/index";
    }

}

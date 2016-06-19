package cn.edu.tju.scs.me.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    public String homepage(HttpServletResponse response){
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Pragma","no-cache");

        response.setDateHeader("Expires",0);
        response.setContentType("text/html;charset=utf-8");

        return "me/index";
    }

}

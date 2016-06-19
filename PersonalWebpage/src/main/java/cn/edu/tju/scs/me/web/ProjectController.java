package cn.edu.tju.scs.me.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;

/**
 * ProjectController
 * Created by haoxiaotian on 2016/6/7 20:22.
 */
@Controller
@RequestMapping("projects.html")
public class ProjectController {

    /**
     * projects 页面
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String projects(HttpServletResponse response){
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Pragma","no-cache");

        response.setDateHeader("Expires",0);
        response.setContentType("text/html;charset=utf-8");
        return "me/projects";
    }
}

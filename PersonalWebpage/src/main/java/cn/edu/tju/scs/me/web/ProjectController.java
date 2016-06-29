package cn.edu.tju.scs.me.web;

import cn.edu.tju.scs.admin.domain.News;
import cn.edu.tju.scs.admin.service.NewsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * ProjectController
 * Created by haoxiaotian on 2016/6/7 20:22.
 */
@Controller
@RequestMapping("projects.html")
public class ProjectController {


    @Resource
    NewsService newsService;
    /**
     * projects 页面
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String projects(HttpServletResponse response,Model model){
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Pragma","no-cache");

        response.setDateHeader("Expires",0);
        response.setContentType("text/html;charset=utf-8");

        model.addAttribute("pageResult",newsService.findPublishedNewsByPage(4,1,10));  // 4 为可视化
        return "me/projects";
    }
}

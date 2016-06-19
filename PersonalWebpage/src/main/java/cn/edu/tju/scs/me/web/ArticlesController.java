package cn.edu.tju.scs.me.web;

import cn.edu.tju.scs.admin.service.NewsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * AboutController
 * Created by haoxiaotian on 2016/6/7 20:24.
 */
@Controller
@RequestMapping("articles.html")
public class ArticlesController {
    @Resource
    NewsService newsService;
    /**
     * about 页面
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String articles(@RequestParam(value = "type",required = false) Integer type,
                           @RequestParam(value = "pageNumber",required = false) Integer pageNumber,
                           @RequestParam(value = "pageSize",required = false) Integer pageSize,
                           Model model,HttpServletResponse response){
        if(pageNumber == null || pageNumber < 1){
            pageNumber = 1;
        }
        if(pageSize == null){
            pageSize = 10;
        }
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Pragma","no-cache");

        response.setDateHeader("Expires",0);
        response.setContentType("text/html;charset=utf-8");
        model.addAttribute("pageResult",newsService.findPublishedNewsByPage(type,pageNumber,pageSize));
        return "me/articles";
    }


}

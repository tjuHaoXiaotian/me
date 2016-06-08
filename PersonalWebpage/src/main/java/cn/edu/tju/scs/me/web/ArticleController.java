package cn.edu.tju.scs.me.web;

import cn.edu.tju.scs.admin.domain.News;
import cn.edu.tju.scs.admin.service.NewsService;
import cn.edu.tju.scs.common.dto.BizCode;
import cn.edu.tju.scs.common.dto.StateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * AboutController
 * Created by haoxiaotian on 2016/6/7 20:24.
 */
@Controller
@RequestMapping("/articles")
public class ArticleController {

    @Resource
    NewsService newsService;
    /**
     * about 页面
     * @return
     */
    @RequestMapping(value = "/article_{id}.html",method = RequestMethod.GET)
    public String articles(@PathVariable("id")Integer id,Model model){
        News news = newsService.getNews(id);
        news.setVisitedTimes(news.getVisitedTimes()+1);
        newsService.updateNews(news);
        model.addAttribute("news",news);
        return "me/article";
    }

    /**
     * 根据类型获取新闻
     * @param type
     * @return
     */
    @RequestMapping(method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    StateCode getNewsPublished(@RequestParam(value = "type",required = false) Integer type){
        StateCode code = StateCode.buildCode(BizCode.SUCCESS);
        code.addData("newsArray",newsService.getAllPublished(type));
        return code;
    }


    /**
     * 最近文章
     * @return
     */
    @RequestMapping(value = "/recent",method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    StateCode getRecentArticles(){
        StateCode code = StateCode.buildCode(BizCode.SUCCESS);
        code.addData("newsArray",newsService.getRecentNews());
        return code;
    }


}

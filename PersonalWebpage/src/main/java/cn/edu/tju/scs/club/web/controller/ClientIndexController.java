package cn.edu.tju.scs.club.web.controller;

import cn.edu.tju.scs.admin.domain.IndexPicNews;
import cn.edu.tju.scs.admin.domain.News;
import cn.edu.tju.scs.admin.service.IndexPicNewsService;
import cn.edu.tju.scs.admin.service.NewsService;
import cn.edu.tju.scs.common.dao.base.PageResults;
import cn.edu.tju.scs.common.dto.BizCode;
import cn.edu.tju.scs.common.dto.StateCode;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * Created by jack on 2016/5/23.
 */

@Controller
@RequestMapping(value = {"/index"})
public class ClientIndexController {

    @Autowired
    NewsService newsService;

    @Autowired
    IndexPicNewsService indexPicNewsService;


    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model,HttpSession httpSession){

        String username = (String) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("username",username);
        httpSession.setAttribute("username",username);
        PageResults<News> importants = newsService.getPartsFromTopToEndByType(1,1,11);// 要闻
        PageResults<News> publics = newsService.getPartsFromTopToEndByType(2,1,11);// 公告
        PageResults<News> clubs = newsService.getPartsFromTopToEndByType(3,1,11);// 社团

        model.addAttribute("images",indexPicNewsService.getAllIndexPicNews());

        model.addAttribute("importants",importants);
        model.addAttribute("publics",publics);
        model.addAttribute("clubs",clubs);

        return "client/index";

    }







    @RequestMapping(method = RequestMethod.GET,value = "/view/news/{id}")
    public String viewNews(@PathVariable("id") int id,Model model){
        News news = newsService.getNews(id);
        news.setVisitedTimes(news.getVisitedTimes()+1);
        newsService.updateNews(news);
        model.addAttribute("news",news);
        return "client/news";
    }

    @RequestMapping(method = RequestMethod.GET,value = "/view/images/{id}")
    public String viewIndexImage(@PathVariable("id") int id,Model model){
        IndexPicNews news = indexPicNewsService.getOne(id);
        news.setVisitedTimes(news.getVisitedTimes()+1);
        indexPicNewsService.updateIndexPicNews(news);
        model.addAttribute("news",news);
        return "client/news";
    }

    @RequestMapping(method = RequestMethod.GET,value = "/view/clubs")
    public String getClubsHtml(@RequestParam(value = "type",required = false) Integer type,Model model){
        if(type == null){
            return "client/client-introduction";
        }else{
            model.addAttribute("type",type);
            return "client/client-introduction";
        }
    }

    @RequestMapping(method = RequestMethod.GET,value = "/view/join")
    public String getJoinHtml(){
        return "client/client-introduction";
    }

    @RequestMapping(value = "/sso",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public @ResponseBody StateCode getSsoSession(HttpSession httpSession){
        StateCode stateCode = StateCode.buildCode(BizCode.SUCCESS);
        System.out.println(httpSession);
        stateCode.addData("session",httpSession);
        return stateCode;
    }


}

package cn.edu.tju.scs.admin.web;

import cn.edu.tju.scs.common.Constants;
import cn.edu.tju.scs.club.domain.User;
import cn.edu.tju.scs.common.dto.BizCode;
import cn.edu.tju.scs.admin.common.NewsStatusCode;
import cn.edu.tju.scs.common.dto.StateCode;
import cn.edu.tju.scs.admin.domain.News;
import cn.edu.tju.scs.admin.domain.NewsType;
import cn.edu.tju.scs.admin.service.NewsService;
import cn.edu.tju.scs.admin.service.NewsTypeService;
import cn.edu.tju.scs.admin.util.MyDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;

/**
 * Created by jack on 2016/5/10.
 */

@Controller
@RequestMapping(value ="posts")
public class DraftsController {

    @Autowired
    NewsService newsService;

    @Autowired
    NewsTypeService newsTypeService;

    /**
     * 添加投稿
     * @param news
     * @return
     */
    @RequestMapping(method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    StateCode addNews(@RequestBody News news,HttpSession httpSession){
        NewsType newsType = newsTypeService.getNewsType(news.getType().getId());
        news.setType(newsType);
        int length = news.getContent().length();
        news.setBriefContent(news.getContent().substring(0,length >= 25 ? 25:length));

        // 管理员提交
        news.setCheckTime(Timestamp.valueOf(MyDate.getCurrentTime()));
        news.setStatus(NewsStatusCode.SUBMITTED.getStatus());

        // 设置 填写用户
        User user = (User) httpSession.getAttribute(Constants.CURRENT_USER);
        news.setFromUser(user.getClub().getName()+":"+user.getAccount());

        newsService.saveNews(news);
        return StateCode.buildCode(BizCode.SUCCESS);
    }


    /**
     * 查看所有投稿
     * @param status 根据状态筛选
     * @return
     */
    @RequestMapping(method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    StateCode getPosts(@RequestParam(value = "status",required = false) Integer status,@RequestParam(value = "fromUser",required = false) String fromUser){
        StateCode code = StateCode.buildCode(BizCode.SUCCESS);
        if(fromUser!=null){
            code.addData("newsArray",newsService.getAllDraftsByFromUser(fromUser));
            return code;
        }
        if(status != null && status >= 0){
            code.addData("newsArray",newsService.getAllDraftsByStatus(status));
        }else{
            code.addData("newsArray",newsService.getAllDrafts());
        }

        return code;
    }


    /**
     * 返回审查页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET,value = "check/{id}")
    public String checkNews(@PathVariable("id") int id,Model model){
        News news = newsService.getNews(id);
//        news.setVisitedTimes(news.getVisitedTimes()+1);
//        newsService.updateNews(news);
        model.addAttribute("news",news);
        return "admin/admin-news-check";
    }

    /**
     * 通过审查
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET,value = "receive/{id}")
    public String receiveNews(@PathVariable("id") int id,Model model,HttpSession httpSession){
//        newsService.updateStatus(1,id);
        News news = newsService.getNews(id);
        // 设置操作用户：
        User user = (User) httpSession.getAttribute(Constants.CURRENT_USER);
        news.setCheckUser(user.getClub().getName()+":"+user.getAccount());
        news.setStatus(1);
        newsService.updateNews(news);
        model.addAttribute("news",news);
        return "admin/admin-news-check";
    }

    /**
     * 拒绝通过
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET,value = "reject/{id}")
    public String rejectNews(@PathVariable("id") int id,Model model,HttpSession httpSession){
//        newsService.updateStatus(2,id);
        News news = newsService.getNews(id);
        // 设置操作用户：
        User user = (User) httpSession.getAttribute(Constants.CURRENT_USER);
        news.setCheckUser(user.getClub().getName()+":"+user.getAccount());
        news.setStatus(2);
        newsService.updateNews(news);

        model.addAttribute("news",news);
        return "admin/admin-news-check";
    }

    /**
     * 发布通过审查投稿
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET,value = "publish/{id}")
    public String publishNews(@PathVariable("id") int id,Model model,HttpSession httpSession){
//        newsService.updateStatus(3,id);
        News news = newsService.getNews(id);
        // 设置操作用户：
        User user = (User) httpSession.getAttribute(Constants.CURRENT_USER);
        news.setCheckUser(user.getClub().getName()+":"+user.getAccount());
        news.setStatus(3);
        newsService.updateNews(news);

        model.addAttribute("news",news);
        return "admin/admin-news";
    }

}

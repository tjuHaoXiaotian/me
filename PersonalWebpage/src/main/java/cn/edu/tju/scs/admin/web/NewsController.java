package cn.edu.tju.scs.admin.web;

import cn.edu.tju.scs.common.Constants;
import cn.edu.tju.scs.me.domain.User;
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
@RequestMapping(value ="/news")
public class NewsController {

    @Autowired
    NewsService newsService;

    @Autowired
    NewsTypeService newsTypeService;


    /**
     * 添加新闻（直接发布）
     * @param news
     * @return
     */
    @RequestMapping(method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    StateCode addNews(@RequestBody News news,HttpSession httpSession){
        NewsType newsType = newsTypeService.getNewsType(news.getType().getId());
        news.setType(newsType);

        // 管理员提交
        // 设置状态为已发布
        news.setStatus(NewsStatusCode.PUBLISHED.getStatus());
        // 设置审核时间
        news.setCheckTime(Timestamp.valueOf(MyDate.getCurrentTime()));

        String content = news.getContent();
        if(content.contains("<img")){
            int index = content.indexOf("<img");
            int endIndex = content.indexOf("/>",index) + 2;
            String imgBlock = content.substring(index, endIndex);
            int srcIndex = imgBlock.indexOf("src") + 5;
            int srcEndIndex = imgBlock.indexOf('\"',srcIndex);
            String url = imgBlock.substring(srcIndex, srcEndIndex);
            System.out.println("imageUrl is" + url);
            news.setImageUrl(url);
        }

        // 设置操作用户：
        User user = (User) httpSession.getAttribute(Constants.CURRENT_USER);
        if(user.getAccount().equals("3013218138")){
            news.setFromUser("郝晓田");
        }else{
            news.setFromUser(user.getAccount());
        }

        newsService.saveNews(news);
        System.out.println("发布时间："+news.getCheckTime());
        return StateCode.buildCode(BizCode.SUCCESS);
    }


    /**
     * 更新新闻
     * @param news
     * @return
     */
    @RequestMapping(method = RequestMethod.PUT,produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    StateCode updateNews(@RequestBody News news){
        if(news.getId() > 0){
            News old = newsService.getNews(news.getId());
            old.setTitle(news.getTitle());
            old.setKeyWords(news.getKeyWords());
            old.setType(news.getType());
            old.setContent(news.getContent());
            old.setBriefContent(news.getBriefContent());

            // 设置审核时间
            old.setCheckTime(Timestamp.valueOf(MyDate.getCurrentTime()));
            String content = news.getContent();
            if(content.contains("<img")){
                int index = content.indexOf("<img");
                int endIndex = content.indexOf("/>",index) + 2;
                String imgBlock = content.substring(index, endIndex);
                int srcIndex = imgBlock.indexOf("src") + 5;
                int srcEndIndex = imgBlock.indexOf('\"',srcIndex);
                String url = imgBlock.substring(srcIndex, srcEndIndex);
                System.out.println("imageUrl is" + url);
                old.setImageUrl(url);
            }

            newsService.updateNews(old);
            return StateCode.buildCode(BizCode.SUCCESS);
        }else{
            StateCode stateCode = StateCode.buildCode(BizCode.FAIL);
            stateCode.addData("error","此新闻不存在，请新建！");
            return stateCode;
        }
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
        if(type != null && type >= 0){
            code.addData("newsArray",newsService.getAll(type));
        }else {
            code.addData("newsArray",newsService.getAll());
        }
        return code;
    }





//    @RequestMapping(value = "/type/{typeId}",method = RequestMethod.GET)
//    public @ResponseBody
//    StateCode getNewsByType(@PathVariable("typeId") int typeId){
//        StateCode code = StateCode.buildCode(BizCode.SUCCESS);
//        code.addData("newsArray",newsService.getAll(typeId));
//        return code;
//    }


    /**
     * 按照顺序获取新闻
     * @param type
     * @return
     */
    @RequestMapping(method = RequestMethod.GET,value = "/orderd",produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    StateCode getNewsByOder(@RequestParam(value = "type",required = false) Integer type){
        StateCode code = StateCode.buildCode(BizCode.SUCCESS);
        if(type != null && type >= 0){
            code.addData("newsArray",newsService.getAllFromTopToEndByType(type));
        }else {
            code.addData("newsArray",newsService.getAllFromTopToEnd());
        }
        return code;
    }

//    @RequestMapping(method = RequestMethod.GET,value = "/orderd/{type}")
//    public @ResponseBody
//    StateCode getNewsByOderAndType(@PathVariable(value = "type") int type){
//        StateCode code = StateCode.buildCode(BizCode.SUCCESS);
//        code.addData("newsArray",);
//        return code;
//    }


    /**
     * 后台预览新闻
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET,value = "/view/{id}")
    public String viewNews(@PathVariable("id") int id,Model model){
        News news = newsService.getNews(id);
//        news.setVisitedTimes(news.getVisitedTimes()+1);
//        newsService.updateNews(news);
        model.addAttribute("news",news);
        return "admin/admin-news-view";
    }


    /**
     * 返回编辑新闻页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET,value = "/edit/{id}")
    public String editNews(@PathVariable("id") Integer id,Model model){
//        News news = newsService.getNews(id);

        model.addAttribute("id",id);
        return "admin/admin-news-edit";
    }


    /**
     * 查看某条新闻
     * @param id
     * @return
     */
    @RequestMapping(method = RequestMethod.GET,value = "{id}",produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    StateCode getNews(@PathVariable("id") int id){

        StateCode code = StateCode.buildCode(BizCode.SUCCESS);
        code.addData("news",newsService.getNews(id));

        return code;
    }

    /**
     * 删除某条新闻(假删除)
     * @param id
     * @return
     */
    @RequestMapping(method = RequestMethod.DELETE,value = "{id}",produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    StateCode deleteNews(@PathVariable("id") int id){

//        boolean deleteImageResult = true;
////
////        System.out.println(new File(NewsController.class.getResource("/").toString()).getParent());
////        System.out.println("UrlUtil:"+PathUtil.BASE_FILE_PATH);
//        Set<String> imageUrls = new HashSet<String>();
//        String content = newsService.getNews(id).getContent();
//        while (content.contains("<img")){
//            int index = content.indexOf("<img");
//            int endIndex = content.indexOf("/>",index) + 2;
//            String imgBlock = content.substring(index, endIndex);
//            imageUrls.add(imgBlock);
////            System.out.println(imgBlock);
//            content = content.substring(endIndex);
//        }
//
//        Iterator<String> imageIterator = imageUrls.iterator();
//        while (imageIterator.hasNext()){
//            String imgBlock = imageIterator.next();
////            System.out.println("-----------------------------\n" + imgBlock);
//            int srcIndex = imgBlock.indexOf("src") + 5;
//            int srcEndIndex = imgBlock.indexOf('\"',srcIndex);
//            String url = imgBlock.substring(srcIndex, srcEndIndex);
//
//            url = (PathUtil.BASE_FILE_PATH+url).replace("/",File.separator);
//
//            FileUtil.deleteFile(url);
//        }
//
//        newsService.deleteNews(id);
        News news = newsService.getNews(id);
        if(news!=null){
            newsService.deleteNewsByStatus(id);
            return StateCode.buildCode(BizCode.SUCCESS);
        }else{
            return StateCode.buildCode(BizCode.FAIL);
        }
    }


    /**
     * 删除某条新闻(假删除)
     * @param id
     * @return
     */
    @RequestMapping(value = "/recovery/{id}",method = RequestMethod.PUT,produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    StateCode deDeleteNews(@PathVariable("id") int id){
        News news = newsService.getNews(id);
        if(news!=null){
            newsService.updateStatus(3,id);
            return StateCode.buildCode(BizCode.SUCCESS);
        }else{
            return StateCode.buildCode(BizCode.FAIL);
        }
    }


    /**
     * 将某条新闻置顶
     * @param id
     * @return
     */
    @RequestMapping(method = RequestMethod.GET,value = "/setTop/{id}",produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    StateCode setNewsTop(@PathVariable("id") int id){

        newsService.setNewsTop(id);

        return StateCode.buildCode(BizCode.SUCCESS);
    }


    
}

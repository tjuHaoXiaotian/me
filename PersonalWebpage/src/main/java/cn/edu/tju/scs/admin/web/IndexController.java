package cn.edu.tju.scs.admin.web;

import cn.edu.tju.scs.admin.domain.IndexPicNews;
import cn.edu.tju.scs.admin.util.FileUtil;
import cn.edu.tju.scs.admin.util.PathUtil;
import cn.edu.tju.scs.common.Constants;
import cn.edu.tju.scs.club.domain.User;
import cn.edu.tju.scs.club.service.UserService;
import cn.edu.tju.scs.club.web.controller.base.BaseController;
import cn.edu.tju.scs.common.dto.BizCode;
import cn.edu.tju.scs.common.dto.StateCode;
import cn.edu.tju.scs.admin.service.IndexPicNewsService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

/**
 * Created by jack on 2016/5/20.
 */

@Controller
@RequestMapping(value = {"/admin"})
public class IndexController extends BaseController{

    @Autowired
    UserService userService;

    /**
     * 后台查看新闻列表
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index(){
        Subject subject = SecurityUtils.getSubject();
        if(subject.hasRole("guest:*")){
            return "redirect:/index";
        }else{
            return "/admin/admin-news";
        }
    }

    /**
     * 后台投稿
     * @return
     */
    @RequestMapping(value = "/posts/new",method = RequestMethod.GET)
    public String newPost(){
        return "/admin/admin-news-drafts-new";
    }

    /**
     * 社团管理界面 我的投稿
     * @return
     */
    @RequestMapping(value = "/posts/mine",method = RequestMethod.GET)
    public String minePost(HttpSession httpSession,Model model){
        // 设置 填写用户
        User user = (User) httpSession.getAttribute(Constants.CURRENT_USER);
        model.addAttribute("fromUser",user.getClub().getName()+":"+user.getAccount());
        return "/admin/admin-news-drafts";
    }

    /**
     * 后台添加并发布新闻
     * @return
     */
    @RequestMapping(value = "/new",method = RequestMethod.GET)
    public String postNews(){
        return "/admin/admin-news-new";
    }

    /**
     * 后台查看来稿
     * @return
     */
    @RequestMapping(value = "/posts",method = RequestMethod.GET)
    public String posts(@RequestParam(value = "status",required = false) Integer status,Model model){
        if(status != null){
            model.addAttribute("status",status);
        }
        return "/admin/admin-news-drafts";
    }

    /**
     * 后台预览新闻
     * @return
     */
    @RequestMapping(value = "/news",method = RequestMethod.GET)
    public String viewNews(@RequestParam(value = "type",required = true) Integer type,Model model){
        model.addAttribute("type",type);
        return "/admin/admin-news";
    }


    @RequestMapping(value = "/club.html",method = RequestMethod.GET)
    public String myClub(Model model,HttpSession httpSession){
//        System.out.println("注解:"+user);
        User user = (User) httpSession.getAttribute(Constants.CURRENT_USER);
        Subject subject = SecurityUtils.getSubject();
        String username = (String) subject.getPrincipal();
        model.addAttribute("club",user.getClub());
//        model.addAttribute("club",userService.findByUsername(username).getClub());
        return "admin/admin-club";
    }


    @Autowired
    IndexPicNewsService indexPicNewsService;

    /**
     * 添加首页大图
     * @param indexPicNews
     * @return
     */
    @RequestMapping(value = {"/index"},method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    StateCode addImage(@RequestBody IndexPicNews indexPicNews,HttpSession httpSession){
        String content = indexPicNews.getContent();
        if(content.contains("<img")){
            int index = content.indexOf("<img");
            int endIndex = content.indexOf("/>",index) + 2;
            String imgBlock = content.substring(index, endIndex);
            int srcIndex = imgBlock.indexOf("src") + 5;
            int srcEndIndex = imgBlock.indexOf('\"',srcIndex);
            String url = imgBlock.substring(srcIndex, srcEndIndex);
            System.out.println("imageUrl is" + url);
            indexPicNews.setImageUrl(url);
        }

        // 设置操作用户：
        User user = (User) httpSession.getAttribute(Constants.CURRENT_USER);
        indexPicNews.setFromUser(user.getClub().getName()+":"+user.getAccount());

        indexPicNewsService.addIndexPicNews(indexPicNews);

        return StateCode.buildCode(BizCode.SUCCESS);
    }

    /**
     * 更新首页大图
     * @param news
     * @return
     */
    @RequestMapping(value = {"/index"},method = RequestMethod.PUT,produces = {"application/json;charset=UTF-8"})
    public @ResponseBody StateCode updateImage(@RequestBody IndexPicNews news){
        if(news.getId() > 0){
            IndexPicNews old = indexPicNewsService.getOne(news.getId());
            old.setTitle(news.getTitle());
            old.setKeyWords(news.getKeyWords());
            old.setContent(news.getContent());
            old.setBriefContent(news.getBriefContent());

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

            indexPicNewsService.updateIndexPicNews(old);
            return StateCode.buildCode(BizCode.SUCCESS);
        }else{
            StateCode stateCode = StateCode.buildCode(BizCode.FAIL);
            stateCode.addData("error","此新闻不存在，请新建！");
            return stateCode;
        }
    }

    /**
     * 删除首页大图
     * @param id
     * @return
     */
    @RequestMapping(value = "/index/{id}",method = RequestMethod.DELETE,produces = {"application/json;charset=UTF-8"})
    public @ResponseBody StateCode deleteImage(@PathVariable("id") int id){
        boolean deleteImageResult = true;
//
//        System.out.println(new File(NewsController.class.getResource("/").toString()).getParent());
//        System.out.println("UrlUtil:"+PathUtil.BASE_FILE_PATH);
        Set<String> imageUrls = new HashSet<String>();
        String content = indexPicNewsService.getOne(id).getContent();
        while (content.contains("<img")){
            int index = content.indexOf("<img");
            int endIndex = content.indexOf("/>",index) + 2;
            String imgBlock = content.substring(index, endIndex);
            imageUrls.add(imgBlock);
//            System.out.println(imgBlock);
            content = content.substring(endIndex);
        }

        Iterator<String> imageIterator = imageUrls.iterator();
        while (imageIterator.hasNext()){
            String imgBlock = imageIterator.next();
//            System.out.println("-----------------------------\n" + imgBlock);
            int srcIndex = imgBlock.indexOf("src") + 5;
            int srcEndIndex = imgBlock.indexOf('\"',srcIndex);
            String url = imgBlock.substring(srcIndex, srcEndIndex);

            url = (PathUtil.BASE_FILE_PATH+url).replace("/", File.separator);

            FileUtil.deleteFile(url);
        }

        indexPicNewsService.deleteIndexPicNews(id);
        return StateCode.buildCode(BizCode.SUCCESS);
    }

    /**
     * 返回编辑首页大图页面
     * @param model
     * @return
     */
    @RequestMapping(value = {"/index"},method = RequestMethod.GET)
    public String getAllImage(Model model){
        List<IndexPicNews> indexPicNewsList = indexPicNewsService.getAllIndexPicNews();
        if(indexPicNewsList == null || indexPicNewsList.size() == 0){
            indexPicNewsList = new ArrayList<IndexPicNews>();
            for(int i = 0; i< 3;i++){
                indexPicNewsList.add(new IndexPicNews());
            }
        }else{
            for(int i=indexPicNewsList.size();i<3;i++){
                indexPicNewsList.add(new IndexPicNews());
            }
        }
        model.addAttribute("images",indexPicNewsList);
        return "admin/admin-index-large-image";
    }


    /**
     * 获取某个首页大图详细信息
     * @param id
     * @return
     */
    @RequestMapping(value = "/index/{id}",method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    StateCode getNews(@PathVariable("id") int id){

        StateCode code = StateCode.buildCode(BizCode.SUCCESS);
        code.addData("news",indexPicNewsService.getOne(id));

        return code;
    }

    @RequestMapping(value = "/index/edit",method = RequestMethod.GET)
    public String edit(@RequestParam(value = "id",required = false) Integer id,Model model){
        if(id != null){
            model.addAttribute("id",id);
            return "admin/admin-index-large-image-edit";
        }else{
            return "admin/admin-index-large-image-new";
        }



    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String loginAction(@RequestParam("username") String username,@RequestParam("password") String password,HttpServletRequest req, HttpServletResponse resp,Model model){
        String error = null;
        Subject subject = SecurityUtils.getSubject();
        System.out.println(username +"  ; "+ password);
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        try {
            subject.login(token);
        } catch (UnknownAccountException e) {
            error = "用户名/密码错误";
        } catch (IncorrectCredentialsException e) {
            error = "用户名/密码错误";
        } catch (AuthenticationException e) {
            //其他错误，比如锁定，如果想单独处理请单独catch处理
            error = "其他错误：" + e.getMessage();
        }catch (Exception e){
            error = "其他错误：" + e.getMessage();
        }
        if(error != null) {//出错了，返回登录页面
            model.addAttribute("error", error);
            return "admin/admin-login";
        } else {//登录成功
            if(subject.hasRole("admin")){
                return "admin/admin-news";
            }else{
                model.addAttribute("club",userService.findByUsername(username).getClub());
                return "admin/admin-club";
            }
        }
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String adminLoginPage(){
        return "admin/admin-login";
    }


}

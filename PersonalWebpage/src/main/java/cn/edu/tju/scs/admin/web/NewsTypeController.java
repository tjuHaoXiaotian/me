package cn.edu.tju.scs.admin.web;

import cn.edu.tju.scs.common.dto.BizCode;
import cn.edu.tju.scs.common.dto.StateCode;
import cn.edu.tju.scs.admin.domain.NewsType;
import cn.edu.tju.scs.admin.service.NewsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * NewsTypeTypeController
 * Created by jack on 2016/5/10.
 */

@Controller
@RequestMapping(value ="newsTypes")
public class NewsTypeController {

    @Autowired
    NewsTypeService newsTypeService;


    /**
     * 添加新的类型
     * @param newsType
     * @return
     */
    @RequestMapping(value = "new",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    StateCode addNewsType(NewsType newsType){
        newsTypeService.saveNewsType(newsType);
        return StateCode.buildCode(BizCode.SUCCESS);
    }

    /**
     * 获取添加类型页面
     * @param model
     * @return
     */
    @RequestMapping(value = "new",method = RequestMethod.GET)
    public String addNewsTypeWebView(Model model){
        model.addAttribute("op", "添加");
        return "admin/admin-news-type-edit";
    }

    /**
     * 获取添编辑类型页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "edit",method = RequestMethod.GET)
    public String editNewsTypeWebView(@RequestParam(value = "id",required = true) int id,Model model){

        NewsType newsType = newsTypeService.getNewsType(id);
        if(newsType != null){
            model.addAttribute("newsType",newsType);
            model.addAttribute("op", "编辑");
            return "admin/admin-news-type-edit";
        }else{
            return "404";
        }
    }

    /**
     * 提交编辑结果
     * @param newsType
     * @return
     */
    @RequestMapping(value = "edit",method = RequestMethod.POST)
    public String editNewsType(NewsType newsType){
        newsTypeService.updateNewsType(newsType);
//        return "redirect:/localUsers";
        return "admin/admin-news-types";
    }

    /**
     * 获取所有类型
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public @ResponseBody
    StateCode getNewsType(){

        StateCode code = StateCode.buildCode(BizCode.SUCCESS);
        code.addData("newsTypes",newsTypeService.getAll());

        return code;
    }


    /**
     * 获取类型列表页
     * @return
     */
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String getNewsTypesWebView(){
        return "admin/admin-news-types";
    }


    /**
     * 查看某个类型
     * @param id
     * @return
     */
    @RequestMapping(method = RequestMethod.GET,value = "{id}",produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    StateCode getNewsType(@PathVariable("id") int id){

        StateCode code = StateCode.buildCode(BizCode.SUCCESS);
        code.addData("newsType",newsTypeService.getNewsType(id));

        return code;
    }

    @RequestMapping(method = RequestMethod.DELETE,value = "{id}",produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    StateCode deleteNewsType(@PathVariable("id") int id){
        newsTypeService.deleteNewsType(id);
        return StateCode.buildCode(BizCode.SUCCESS);
    }
}

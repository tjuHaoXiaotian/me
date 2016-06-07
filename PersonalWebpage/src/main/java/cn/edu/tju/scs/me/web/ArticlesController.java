package cn.edu.tju.scs.me.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * AboutController
 * Created by haoxiaotian on 2016/6/7 20:24.
 */
@Controller
@RequestMapping("articles.html")
public class ArticlesController {
    /**
     * about 页面
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String articles(@RequestParam(value = "type",required = false) Integer type,Model model){
        if(type != null){
            model.addAttribute("type",type);
        }
        return "me/articles";
    }


}

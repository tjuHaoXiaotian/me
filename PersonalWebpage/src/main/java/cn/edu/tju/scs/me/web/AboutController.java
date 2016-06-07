package cn.edu.tju.scs.me.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * AboutController
 * Created by haoxiaotian on 2016/6/7 20:24.
 */
@Controller
@RequestMapping("about.html")
public class AboutController {
    /**
     * about 页面
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String about(){
        return "me/about";
    }
}

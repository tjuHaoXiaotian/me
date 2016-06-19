package cn.edu.tju.scs.tv.web.controller;

import cn.edu.tju.scs.tv.web.controller.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by haoxiaotian on 2016/6/5 21:53.
 */

@Controller
@RequestMapping("/client")
public class ClientController  extends BaseController {

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(){
        return "client/home";
    }


}

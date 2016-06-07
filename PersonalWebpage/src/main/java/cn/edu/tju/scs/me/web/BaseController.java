package cn.edu.tju.scs.me.web;

import cn.edu.tju.scs.common.Constants;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * BaseController
 * Created by haoxiaotian on 2016/6/7 21:13.
 */

@Controller
public class BaseController {

    /**
     * 注销
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(Model model,HttpSession httpSession){

        Subject subject = SecurityUtils.getSubject();
        httpSession.setAttribute("username",null);
        httpSession.setAttribute(Constants.CURRENT_USER,null);
        subject.logout();


        // 创建HttpClient实例
        HttpClient httpclient = new DefaultHttpClient();
        // 创建Get方法实例
        HttpGet httpgets = new HttpGet("https://sso.tju.edu.cn/cas/logout?service=http://localhost:8080/Me/cas");
        try {
            httpclient.execute(httpgets);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/index.html";

    }
}

package cn.edu.tju.scs.tv.web.controller;

import cn.edu.tju.scs.UrlConfig;
import cn.edu.tju.scs.common.Constants;
import cn.edu.tju.scs.common.dto.BizCode;
import cn.edu.tju.scs.common.dto.StateCode;
import cn.edu.tju.scs.tv.service.UserService;
import cn.edu.tju.scs.tv.util.CheckMobile;
import cn.edu.tju.scs.tv.web.controller.base.BaseController;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * BaseController
 * Created by haoxiaotian on 2016/6/7 21:13.
 */

@Controller
public class BasicController extends BaseController {

    Logger logger = LoggerFactory.getLogger(BasicController.class);
    @Resource
    private UrlConfig urlConfig;

    @Resource
    UserService userService;
    /**
     * 注销
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(Model model,HttpSession httpSession,HttpServletRequest request) throws IOException {
        Boolean isMobile = check(request);
        Subject subject = SecurityUtils.getSubject();
        httpSession.setAttribute("username",null);
        httpSession.setAttribute(Constants.CURRENT_USER,null);
        subject.logout();

        // 创建HttpClient实例
        HttpClient httpclient = new DefaultHttpClient();
        // 创建Get方法实例
//        HttpGet httpgets = new HttpGet("http://sso.tju.edu.cn/cas/logout?service=http://localhost:8080/Me/cas");
        HttpGet httpgets = new HttpGet(urlConfig.getSsoUrlLogout()+"?service="+urlConfig.getLocalUrl()+"/cas");


        try {
            logger.info("执行单点退出！");
            httpclient.execute(httpgets);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if(isMobile){
            return "redirect:/mobile/logout";
        }
        return "redirect:/client/index";

    }

    /**
     * mobile 登录
     * @return
     */
    @RequestMapping(value = "/mobile",method = RequestMethod.GET)
    public @ResponseBody StateCode login(){
        Subject subject = SecurityUtils.getSubject();
        Session session = subject.getSession();
        StateCode stateCode = StateCode.buildCode(BizCode.SUCCESS);
        String sessionId = (String)session.getId();
        stateCode.addData("JSESSIONID",sessionId);
        return stateCode;
    }

    /**
     * mobile 退出
     * @return
     */
    @RequestMapping(value = "/mobile/logout",method = RequestMethod.GET)
    public @ResponseBody StateCode mobileLogout(){
        return StateCode.buildCode(BizCode.SUCCESS);
    }

    @RequiresUser
    @RequestMapping(value = "/currentUser",method = RequestMethod.GET)
    public @ResponseBody StateCode currentUser(){
        StateCode stateCode = StateCode.buildCode(BizCode.SUCCESS);

        String username = (String)SecurityUtils.getSubject().getPrincipal();
        if(userService.findByUsername(username) == null){

        }
        stateCode.addData("user",username);
        return stateCode;
    }


    @RequestMapping(value = "/dispatcher",method = RequestMethod.GET)
    public String dispatcher(HttpServletRequest request) throws IOException {
        if(check(request)){
            return "redirect:/mobile";
        }else{
            Subject subject = SecurityUtils.getSubject();
            if(subject.hasRole("guest:*")){
                return "redirect:/client/index";
            }else{
                return "redirect:/admin/index";
            }
        }
    }




    /**
     * 检查是否为移动端设备
     * @param request
     * @return
     * @throws IOException
     */
    public boolean check(HttpServletRequest request) throws IOException{
        boolean isFromMobile=false;

        HttpSession session= request.getSession();
        //检查是否已经记录访问方式（移动端或pc端）
        if(null==session.getAttribute("ua")){
            try{
                //获取ua，用来判断是否为移动端访问
                String userAgent = request.getHeader( "USER-AGENT" ).toLowerCase();
                if(null == userAgent){
                    userAgent = "";
                }
                isFromMobile= CheckMobile.check(userAgent);
                //判断是否为移动端访问
                if(isFromMobile){
                    System.out.println("移动端访问");
                    session.setAttribute("ua","mobile");
                } else {
                    System.out.println("pc端访问");
                    session.setAttribute("ua","pc");
                }
            }catch(Exception e){}
        }else{
            isFromMobile=session.getAttribute("ua").equals("mobile");
        }

        return isFromMobile;
    }
}

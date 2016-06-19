package cn.edu.tju.scs.tv.web.controller;

import cn.edu.tju.scs.common.dto.BizCode;
import cn.edu.tju.scs.common.dto.StateCode;
import cn.edu.tju.scs.tv.web.controller.base.BaseController;
import com.qcloud.video.AppConfig;
import com.qcloud.video.common.Sign;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by haoxiaotian on 2016/6/5 21:53.
 */

@Controller
@RequestMapping("/appSign")
public class AppSignController extends BaseController{

    @Autowired
    AppConfig appConfig;

    /**
     * 返回正常签名
     * @return
     */
    @RequiresUser
    @RequestMapping(value = "/base",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public @ResponseBody
    StateCode produceAppSign(){
        long expired = System.currentTimeMillis() / 1000 + 2592000; // 3天
        String sign = Sign.appSign(appConfig.getAppID(),appConfig.getSecretID(),appConfig.getSecretKey(),expired,appConfig.getBucketName());
        StateCode stateCode = StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("sign",sign);
        return stateCode;
    }

    /**
     * 返回一次性签名
     * @param resourcePath bucket 后的全路径
     * @return
     */
    @RequestMapping(value = "/once",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public @ResponseBody StateCode produceAppSignOnce(@RequestParam("resourcePath") String resourcePath){
        String sign = Sign.appSignOnce(appConfig.getAppID(), appConfig.getSecretID(), appConfig.getSecretKey(),resourcePath,appConfig.getBucketName());
        StateCode stateCode = StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("sign",sign);
        return stateCode;
    }

}

package cn.edu.tju.scs.admin.web;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>User: HaoXiaotian
 * <p>Date: 2016-04-15
 * <p>Version: 1.0
 */
@Controller
public class IndexController {
    @RequiresUser
    @RequiresRoles(value={"admin"})
    @RequestMapping("/admin/index")
    public String adminIndex() {
            return "admin/admin-index";
    }

    @RequestMapping("/index.html")
    public String Index() {
        return "redirect:/client/index";
    }

}

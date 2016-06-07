package cn.edu.tju.scs.auth.filter;

import cn.edu.tju.scs.common.Constants;
import cn.edu.tju.scs.club.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.filter.PathMatchingFilter;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 14-2-15
 * <p>Version: 1.0
 */
public class SysUserFilter extends PathMatchingFilter {

    @Autowired
    private UserService userService;

    @Override
    protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {

        String username = (String)SecurityUtils.getSubject().getPrincipal();
        System.out.println("过滤器："+username + "\n" + userService.findByUsername(username));
        if(userService.findByUsername(username) == null){
            ((HttpServletRequest) request).getSession().setAttribute(Constants.CURRENT_USER,username);
        }else{
            ((HttpServletRequest) request).getSession().setAttribute(Constants.CURRENT_USER, userService.findByUsername(username));
        }
        return true;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}

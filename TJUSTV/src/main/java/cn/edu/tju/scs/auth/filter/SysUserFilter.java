package cn.edu.tju.scs.auth.filter;

import cn.edu.tju.scs.common.Constants;
import cn.edu.tju.scs.tv.service.UserService;
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
        if(((HttpServletRequest) request).getSession().getAttribute(Constants.CURRENT_USER) == null){
//            if(userService.findByUsername(username) == null){
//                ((HttpServletRequest) request).getSession().setAttribute(Constants.CURRENT_USER,username);
//            }else{
////                ((HttpServletRequest) request).getSession().setAttribute(Constants.CURRENT_USER, userService.findByUsername(username));
//                ((HttpServletRequest) request).getSession().setAttribute(Constants.CURRENT_USER,username);
//            }
            ((HttpServletRequest) request).getSession().setAttribute(Constants.CURRENT_USER,username);
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

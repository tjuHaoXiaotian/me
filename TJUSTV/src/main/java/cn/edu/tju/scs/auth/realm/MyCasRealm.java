package cn.edu.tju.scs.auth.realm;

import cn.edu.tju.scs.tv.service.UserService;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cas.CasRealm;
import org.apache.shiro.subject.PrincipalCollection;

import java.util.HashSet;
import java.util.Set;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 14-2-13
 * <p>Version: 1.0
 */
public class MyCasRealm extends CasRealm {

    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String)principals.getPrimaryPrincipal();

        System.out.println("username:"+username);


        if(userService.findByUsername(username)!=null){
            SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
            if(userService.findRoles(username) == null || userService.findRoles(username).size() == 0){
                Set<String> roles = new HashSet<String>();
                roles.add("guest:*");
                authorizationInfo.setRoles(roles);
            }else{
                authorizationInfo.setRoles(userService.findRoles(username));
                authorizationInfo.setStringPermissions(userService.findPermissions(username));
            }
            return authorizationInfo;
        }else{
            SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
            Set<String> roles = new HashSet<String>();
            roles.add("guest:*");
            authorizationInfo.setRoles(roles);
            Set<String> permissions = new HashSet<String>();
            permissions.add("guest:*");
            authorizationInfo.setStringPermissions(permissions);
            return authorizationInfo;
        }

    }


}

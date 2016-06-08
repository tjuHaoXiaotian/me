package cn.edu.tju.scs.service;

import cn.edu.tju.scs.auth.domain.Role;
import cn.edu.tju.scs.auth.service.RoleService;
import cn.edu.tju.scs.me.domain.User;
import cn.edu.tju.scs.me.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by jack on 2016/4/1.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/applicationContext.xml")
public class TestUserService {


    /**
     * 一定要注入代理类，代理类才会进行事务增强
     */
	@Resource(name="userService")
	private UserService userService;


    @Autowired
    private RoleService roleService;


    @Test
    public void testAddUser() {
        
        for(int i = 0; i < 10;i ++){
            User user = new User();
            user.setAccount("00" + i);
            user.setPassword("test");
            user.setState(0);
            userService.saveUser(user);
        }

    }


    @Test
    public void testChangePassword(){
        userService.changePassword(6,"1");
    }

    @Test
    public void testUpdateUser(){
        User user = userService.findByUsername("admin");
        Set<Role> roleSet = new HashSet<Role>();
        roleSet.add(roleService.getRoleById(1));
        user.setRoles(roleSet);

        userService.updateUser(user);

        User user1 = userService.findByUsername("twt");
        Set<Role> roleSet2 = new HashSet<Role>();
        roleSet2.add(roleService.getRoleById(2));
        user1.setRoles(roleSet2);
        userService.updateUser(user1);

    }
}

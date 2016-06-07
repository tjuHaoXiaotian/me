package cn.edu.tju.scs.auth.service.impl;

import cn.edu.tju.scs.auth.domain.Permission;
import cn.edu.tju.scs.auth.domain.Role;
import cn.edu.tju.scs.auth.service.PermissionService;
import cn.edu.tju.scs.auth.service.RoleService;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/applicationContext.xml")
public class RoleServiceImplTest {

    @Autowired
    RoleService roleService;

    @Autowired
    PermissionService permissionService;

    public static List<Role> roles = new ArrayList<Role>();


    @BeforeClass
    public static void init(){
        Role role = new Role("admin","超级管理员",null,1);


        Role clubRole = new Role("clubUser","社团管理员",null,1);

        roles.add(role);
        roles.add(clubRole);
    }

    @Test
    public void testFindAllPermissions() throws Exception {
        List<Permission> permissions = permissionService.getAllAdmin();
        Set<Permission> permissionSet = new HashSet<Permission>();
        for(Permission permission:permissions){
            permissionSet.add(permission);
        }
        roles.get(0).setPermissions(permissionSet);
        System.out.println(roles.get(0));

        Set<Permission> permissionSet1 = new HashSet<Permission>();
        permissionSet1.add(permissionService.getById(1));
        permissionSet1.add(permissionService.getById(10));
        permissionSet1.add(permissionService.getById(15));
        permissionSet1.add(permissionService.getById(18));
        permissionSet1.add(permissionService.getById(20));
        permissionSet1.add(permissionService.getById(21));
        permissionSet1.add(permissionService.getById(26));
        permissionSet1.add(permissionService.getById(35));
        permissionSet1.add(permissionService.getById(40));
        permissionSet1.add(permissionService.getById(45));
        roles.get(1).setPermissions(permissionSet1);
        System.out.println(roles.get(1));
        for(Role role:roles){
            roleService.addRole(role);
        }
    }
}
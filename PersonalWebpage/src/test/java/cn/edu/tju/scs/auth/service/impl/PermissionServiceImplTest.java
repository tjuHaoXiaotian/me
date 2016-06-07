package cn.edu.tju.scs.auth.service.impl;

import cn.edu.tju.scs.auth.domain.Permission;
import cn.edu.tju.scs.auth.service.PermissionService;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/applicationContext.xml")
public class PermissionServiceImplTest {

    @Autowired
    PermissionService permissionService;

    @Test
    public void testFindPermissions() throws Exception {

    }

    public static List<Permission> permissions = new ArrayList<Permission>();

    @BeforeClass
    public static void init(){
        /**
         * 投稿
         */
        Permission permission = new Permission("投稿管理","post:*",1);
        Permission permission1 = new Permission("添加投稿","post:add",1);
        Permission permission2 = new Permission("更新投稿","post:update",1);
        Permission permission3 = new Permission("删除投稿","post:delete",1);
        Permission permission4 = new Permission("查看投稿","post:view",1);

        Permission permission5 = new Permission("首页顶图管理","indexImage:*",1);
        Permission permission6 = new Permission("添加首页顶图","indexImage:add",1);
        Permission permission7 = new Permission("更新首页顶图","indexImage:update",1);
        Permission permission8 = new Permission("删除首页顶图","indexImage:delete",1);
        Permission permission9 = new Permission("查看首页顶图","indexImage:view",1);

        Permission permission10 = new Permission("新闻管理","news:*",1);
        Permission permission11 = new Permission("添加新闻","news:add",1);
        Permission permission12 = new Permission("更新新闻","news:update",1);
        Permission permission13 = new Permission("删除新闻","news:delete",1);
        Permission permission14 = new Permission("查看新闻","news:view",1);

        Permission permission15 = new Permission("社团管理","club:*",1);
        Permission permission16 = new Permission("添加社团","club:add",1);
        Permission permission17 = new Permission("更新社团","club:update",1);
        Permission permission18 = new Permission("删除社团","club:delete",1);
        Permission permission19 = new Permission("查看社团","club:view",1);

        Permission permission20 = new Permission("部门管理","department:*",1);
        Permission permission21 = new Permission("添加部门","department:add",1);
        Permission permission22 = new Permission("更新部门","department:update",1);
        Permission permission23 = new Permission("删除部门","department:delete",1);
        Permission permission24 = new Permission("查看部门","department:view",1);

        Permission permission25 = new Permission("申请管理","apply:*",1);
        Permission permission26 = new Permission("添加申请","apply:add",1);
        Permission permission27 = new Permission("更新申请","apply:update",1);
        Permission permission28 = new Permission("删除申请","apply:delete",1);
        Permission permission29 = new Permission("查看申请","apply:view",1);

        Permission permission30 = new Permission("教学楼管理","building:*",1);
        Permission permission31 = new Permission("添加教学楼","building:add",1);
        Permission permission32 = new Permission("更新教学楼","building:update",1);
        Permission permission33 = new Permission("删除教学楼","building:delete",1);
        Permission permission34 = new Permission("查看教学楼","building:view",1);

        Permission permission35 = new Permission("教室管理","classroom:*",1);
        Permission permission36 = new Permission("添加教室","classroom:add",1);
        Permission permission37 = new Permission("更新教室","classroom:update",1);
        Permission permission38 = new Permission("删除教室","classroom:delete",1);
        Permission permission39 = new Permission("查看教室","classroom:view",1);

        Permission permission40 = new Permission("计划管理","schedule:*",1);
        Permission permission41 = new Permission("添加计划","schedule:add",1);
        Permission permission42 = new Permission("更新计划","schedule:update",1);
        Permission permission43 = new Permission("删除计划","schedule:delete",1);
        Permission permission44 = new Permission("查看计划","schedule:view",1);


        permissions.add(permission);
        permissions.add(permission1);
        permissions.add(permission2);
        permissions.add(permission3);
        permissions.add(permission4);
        permissions.add(permission5);
        permissions.add(permission6);
        permissions.add(permission7);
        permissions.add(permission8);
        permissions.add(permission9);
        permissions.add(permission10);
        permissions.add(permission11);
        permissions.add(permission12);
        permissions.add(permission13);
        permissions.add(permission14);
        permissions.add(permission15);
        permissions.add(permission16);
        permissions.add(permission17);
        permissions.add(permission18);
        permissions.add(permission19);
        permissions.add(permission20);
        permissions.add(permission21);
        permissions.add(permission22);
        permissions.add(permission23);
        permissions.add(permission24);
        permissions.add(permission25);
        permissions.add(permission26);
        permissions.add(permission27);
        permissions.add(permission28);
        permissions.add(permission29);
        permissions.add(permission30);
        permissions.add(permission31);
        permissions.add(permission32);
        permissions.add(permission33);
        permissions.add(permission34);
        permissions.add(permission35);
        permissions.add(permission36);
        permissions.add(permission37);
        permissions.add(permission38);
        permissions.add(permission39);
        permissions.add(permission40);
        permissions.add(permission41);
        permissions.add(permission42);
        permissions.add(permission43);
        permissions.add(permission44);

    }

    @Test
    public void testAddPermission(){
        for(Permission permission:permissions){
            permissionService.addPermissions(permission);
        }
    }
}
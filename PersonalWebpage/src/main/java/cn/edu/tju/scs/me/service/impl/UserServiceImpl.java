package cn.edu.tju.scs.me.service.impl;

import cn.edu.tju.scs.auth.domain.Permission;
import cn.edu.tju.scs.auth.domain.Role;
import cn.edu.tju.scs.auth.service.PermissionService;
import cn.edu.tju.scs.auth.service.RoleService;
import cn.edu.tju.scs.auth.util.PasswordHelper;
import cn.edu.tju.scs.me.dao.UserDao;
import cn.edu.tju.scs.me.domain.User;
import cn.edu.tju.scs.me.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

/**
 * UserServiceImpl
 * Created by jack on 2016/3/26.
 */
@Service(value = "userService")
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Autowired
    private PasswordHelper passwordHelper;

    @Autowired
    RoleService roleService;

    @Autowired
    PermissionService permissionService;

    @Override
    public User findUserByName(String name) {
        String query = "from User where account = ?";
        return userDao.getByHQL(query,name);
    }

    @Override
    public User findUserById(int id) {
        String query = "from User where userId = ?";
        return userDao.getByHQL(query,id);
    }

    @Override
    public boolean hasMatchUser(String userName, String password) {
        String query = "select count(*) from User where account = ? and password = ? and state = ?";
        return userDao.countByHql(query,userName,password,0) == 1;
    }

    @Override
    public void changeState(User user) {
        userDao.update(user);
    }

    @Override
    public void saveUser(User user) {
        //加密密码
        passwordHelper.encryptPassword(user);
        // 新建用户信息
        user.setState(0);
        userDao.save(user);
    }

    @Override
    public User findUserByClubId(Integer clubId) {
        String hql = "from User where club.clubId = ?";
        return userDao.getByHQL(hql,clubId);
    }

    @Override
    public void updateUser(User user) {
        // 重新加密密码
        passwordHelper.encryptPassword(user);
        userDao.update(user);
    }

    @Override
    public void deleteUserByClubId(int clubId) {
        String sql = "delete from users where REF_CLUB_ID = ?";
        userDao.querySql(sql,clubId);
    }

    @Override
    public User findByUsername(String username) {
        String hql = "from User where account = ?";
        return userDao.getByHQL(hql,username);
    }

    @Override
    public void changePassword(Integer userId, String newPassword) {
        User user = userDao.get(userId);
        user.setPassword(newPassword);
        passwordHelper.encryptPassword(user);
        userDao.update(user);
    }

    public PasswordHelper getPasswordHelper() {
        return passwordHelper;
    }

    public void setPasswordHelper(PasswordHelper passwordHelper) {
        this.passwordHelper = passwordHelper;
    }

    // 根据用户名查找其角色
    public Set<String> findRoles(String username){
        User user = findUserByName(username);
        Set<Role> roles = user.getRoles();
        Set<String> roleNames = new HashSet<String>();
        for(Role role:roles){
            roleNames.add(role.getRoleName());
        }
        return roleNames;
    }

    // 根据用户名查找其权限
    public Set<String> findPermissions(String username){
        User user = findUserByName(username);
        Set<Role> roles = user.getRoles();
        Set<Permission> permissions = roleService.findAllPermissions(roles);
        return permissionService.findPermissions(permissions);
    }

}

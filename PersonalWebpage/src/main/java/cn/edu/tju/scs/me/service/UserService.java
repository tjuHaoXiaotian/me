package cn.edu.tju.scs.me.service;

import cn.edu.tju.scs.me.domain.User;

import java.util.Set;

/**
 * User Service
 * Created by jack on 2016/3/26.
 */
public interface UserService {

    public User findUserByName(String name);

    public User findUserById(int id);

    public boolean hasMatchUser(String userName, String password);

    public void changeState(User user);

    public void saveUser(User user);

    public User findUserByClubId(Integer clubId);

    public void updateUser(User user);

    public void deleteUserByClubId(int clubId);

    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
    public User findByUsername(String username);

    /**
     * 修改用户名
     * @param userId
     * @param newPassword
     */
    public void changePassword(Integer userId, String newPassword);


    // 根据用户名查找其角色
    public Set<String> findRoles(String username);

    // 根据用户名查找其权限
    public Set<String> findPermissions(String username);
}

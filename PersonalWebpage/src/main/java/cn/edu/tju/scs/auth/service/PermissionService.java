package cn.edu.tju.scs.auth.service;

import cn.edu.tju.scs.auth.domain.Permission;

import java.util.List;
import java.util.Set;

/**
 * Created by jack on 2016/5/29.
 */
public interface PermissionService {

    // 得到权限对应的权限字符串
    Set<String> findPermissions(Set<Permission> permissions);


    // 添加权限
    void addPermissions(Permission permission);

    List<Permission> getAllAdmin();

    Permission getById(int id);
}

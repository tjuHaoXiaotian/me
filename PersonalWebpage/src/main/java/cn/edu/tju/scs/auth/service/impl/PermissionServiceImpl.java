package cn.edu.tju.scs.auth.service.impl;

import cn.edu.tju.scs.auth.dao.PermissionDao;
import cn.edu.tju.scs.auth.domain.Permission;
import cn.edu.tju.scs.auth.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by jack on 2016/5/29.
 */

@Service("permissionService")
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    PermissionDao permissionDao;

    @Override
    public Set<String> findPermissions(Set<Permission> permissions) {
        Set<String> permissionNames = new HashSet<String>();
        for(Permission permission:permissions){
            permissionNames.add(permission.getPermission());
        }
        return permissionNames; // 实际返回的就是权限
    }

    @Override
    public void addPermissions(Permission permission) {
        permissionDao.save(permission);
    }

    @Override
    public List<Permission> getAllAdmin() {
        String hql = "from Permission where permission like ?";
        return permissionDao.getListByHQL(hql,"%*%");
    }

    @Override
    public Permission getById(int id) {
        return permissionDao.get(id);
    }
}

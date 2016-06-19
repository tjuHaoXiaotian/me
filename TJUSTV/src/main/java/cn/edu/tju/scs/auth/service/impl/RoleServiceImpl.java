package cn.edu.tju.scs.auth.service.impl;

import cn.edu.tju.scs.auth.dao.RoleDao;
import cn.edu.tju.scs.auth.domain.Permission;
import cn.edu.tju.scs.auth.domain.Role;
import cn.edu.tju.scs.auth.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by jack on 2016/5/29.
 */

@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleDao roleDao;

    @Override
    public Set<Permission> findAllPermissions(Set<Role> roles) {
        Set<Permission> permissions = new HashSet<Permission>();
        for(Role role:roles){
            permissions.addAll(role.getPermissions());
        }

        return permissions;
    }

    @Override
    public void addRole(Role role) {
        roleDao.save(role);
    }

    @Override
    public Role getRoleById(int id) {
        return roleDao.get(id);
    }
}

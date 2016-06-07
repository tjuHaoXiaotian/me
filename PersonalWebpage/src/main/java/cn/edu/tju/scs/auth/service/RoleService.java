package cn.edu.tju.scs.auth.service;

import cn.edu.tju.scs.auth.domain.Permission;
import cn.edu.tju.scs.auth.domain.Role;

import java.util.Set;

/**
 * Created by jack on 2016/5/29.
 */
public interface RoleService {

    public Set<Permission> findAllPermissions(Set<Role> roles);

    public void addRole(Role role);

    public Role getRoleById(int id);
}

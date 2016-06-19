package cn.edu.tju.scs.auth.domain;

import java.util.Set;

/**
 * Created by jack on 2016/5/29.
 */
public class Role {
    // 角色id
    private int roleId;

    // 角色名称
    private String roleName;

    // 角色描述
    private String roleDescription;

    // 角色列表
    Set<Permission> permissions;

    // 是否可用
    private int available;

    public Role() {
    }

    public Role(String roleName, String roleDescription, Set<Permission> permissions, int available) {
        this.roleName = roleName;
        this.roleDescription = roleDescription;
        this.permissions = permissions;
        this.available = available;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDescription() {
        return roleDescription;
    }

    public void setRoleDescription(String roleDescription) {
        this.roleDescription = roleDescription;
    }

    public Set<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(Set<Permission> permissions) {
        this.permissions = permissions;
    }

    public int getAvailable() {
        return available;
    }

    public void setAvailable(int available) {
        this.available = available;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Role)) return false;

        Role role = (Role) o;

        if (available != role.available) return false;
        if (roleId != role.roleId) return false;
        if (!permissions.equals(role.permissions)) return false;
        if (!roleDescription.equals(role.roleDescription)) return false;
        if (!roleName.equals(role.roleName)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = roleId;
        result = 31 * result + roleName.hashCode();
        result = 31 * result + roleDescription.hashCode();
        result = 31 * result + permissions.hashCode();
        result = 31 * result + available;
        return result;
    }


    @Override
    public String toString() {
        return "Role{" +
                "roleId=" + roleId +
                ", roleName='" + roleName + '\'' +
                ", roleDescription='" + roleDescription + '\'' +
                ", permissions=" + permissions +
                ", available=" + available +
                '}';
    }
}

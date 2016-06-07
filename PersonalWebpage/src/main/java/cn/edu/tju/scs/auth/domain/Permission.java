package cn.edu.tju.scs.auth.domain;

/**
 * Created by jack on 2016/5/29.
 */
public class Permission {

    // 角色 id
    private int permissionId;

    // 权限名称
    private String permissionName;

    // 权限
    private String permission;

    // 是否可用 1:可用 -1:不可用
    private int available;

    public Permission() {
    }

    public Permission( String permissionName, String permission, int available) {
        this.permissionName = permissionName;
        this.permission = permission;
        this.available = available;
    }

    public int getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(int permissionId) {
        this.permissionId = permissionId;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
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
        if (!(o instanceof Permission)) return false;

        Permission that = (Permission) o;

        if (available != that.available) return false;
        if (permissionId != that.permissionId) return false;
        if (!permission.equals(that.permission)) return false;
        if (!permissionName.equals(that.permissionName)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = permissionId;
        result = 31 * result + permissionName.hashCode();
        result = 31 * result + permission.hashCode();
        result = 31 * result + available;
        return result;
    }

    @Override
    public String toString() {
        return "Permission{" +
                "permissionId=" + permissionId +
                ", permissionName='" + permissionName + '\'' +
                ", permission='" + permission + '\'' +
                ", available=" + available +
                '}';
    }
}

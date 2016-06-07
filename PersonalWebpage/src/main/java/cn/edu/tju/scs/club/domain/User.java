package cn.edu.tju.scs.club.domain;

import cn.edu.tju.scs.admin.common.CustomDateSerializer;
import cn.edu.tju.scs.auth.domain.Role;
import cn.edu.tju.scs.club.domain.base.BaseDomain;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.sql.Timestamp;
import java.util.Set;

/**
 * User domain
 * Created by jack on 2016/1/1.
 */
public class User extends BaseDomain {

    // user id
    private int userId;
    // 账号
    private String account;
    // 密码
    private String password;

    // 上次登录 IP
    private String lastIp;

    @JsonSerialize(using = CustomDateSerializer.class)
    private Timestamp createtime;
    // 更改时间
    @JsonSerialize(using = CustomDateSerializer.class)
    private Timestamp updatetime;

    // 对应社团
    private Club club;

    // 用户状态 0 正常， -1 禁用
    private int state;

    private String salt; //加密密码的盐

    private Set<Role> roles;


    public User(){

    }

    public User(int userId, String account, String password, String lastIp, Timestamp createtime, Timestamp updatetime, Club club, int state) {
        this.userId = userId;
        this.account = account;
        this.password = password;
        this.lastIp = lastIp;
        this.createtime = createtime;
        this.updatetime = updatetime;
        this.club = club;
        this.state = state;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLastIp() {
        return lastIp;
    }

    public void setLastIp(String lastIp) {
        this.lastIp = lastIp;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public Timestamp getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Timestamp updatetime) {
        this.updatetime = updatetime;
    }

    public Club getClub() {
        return club;
    }

    public void setClub(Club club) {
        this.club = club;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }


    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", lastIp='" + lastIp + '\'' +
                ", createtime=" + createtime +
                ", updatetime=" + updatetime +
                ", club=" + club +
                ", state=" + state +
                ", salt='" + salt + '\'' +
                ", roles=" + roles +
                '}';
    }
}

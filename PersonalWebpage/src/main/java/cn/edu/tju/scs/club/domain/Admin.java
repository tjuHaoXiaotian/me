package cn.edu.tju.scs.club.domain;

import cn.edu.tju.scs.club.domain.base.BaseDomain;

import java.sql.Timestamp;

/**
 * Admin domain
 * Created by jack on 2016/1/1.
 */
public class Admin extends BaseDomain {

    private Integer adminId;
    private String adminName;
    private String password;

    private Timestamp createtime;
    private Timestamp updatetime;

    public Admin(){

    }

    public Admin(String adminName,String password){
        this.adminName = adminName;
        this.password = password;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

}

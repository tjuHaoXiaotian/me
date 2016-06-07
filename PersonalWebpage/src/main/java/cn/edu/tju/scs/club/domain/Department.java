package cn.edu.tju.scs.club.domain;

import cn.edu.tju.scs.admin.common.CustomDateSerializer;
import cn.edu.tju.scs.club.domain.base.BaseDomain;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.sql.Timestamp;

/**
* 社团部门表
* Created by jack on 2016/3/25.
*/
public class Department extends BaseDomain {

    // 部门 id
    private int depId;

    // 部门名
    private String depName;

    // 部门联系电话
    private String tel;

    // 负责人邮箱
    private String email;

    // 部门联系人/负责人 姓名
    private String responsiblePerson;

    // 部门介绍（富文本）
    private String introduction;

    // 部门简介
    private String briefIntroduction;

    // 对应社团
    private Club club;

    @JsonSerialize(using = CustomDateSerializer.class)
    private Timestamp createtime;

    @JsonSerialize(using = CustomDateSerializer.class)
    private Timestamp updatetime;

    public int getDepId() {
        return depId;
    }

    public void setDepId(int depId) {
        this.depId = depId;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getResponsiblePerson() {
        return responsiblePerson;
    }

    public void setResponsiblePerson(String responsiblePerson) {
        this.responsiblePerson = responsiblePerson;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getBriefIntroduction() {
        return briefIntroduction;
    }

    public void setBriefIntroduction(String briefIntroduction) {
        this.briefIntroduction = briefIntroduction;
    }

    public Club getClub() {
        return club;
    }

    public void setClub(Club club) {
        this.club = club;
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

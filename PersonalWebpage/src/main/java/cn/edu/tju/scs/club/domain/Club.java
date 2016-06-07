package cn.edu.tju.scs.club.domain;

import cn.edu.tju.scs.admin.common.CustomDateSerializer;
import cn.edu.tju.scs.club.domain.base.BaseDomain;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.sql.Timestamp;

/**
 * 社团信息
 * Created by jack on 2016/3/25.
 */
public class Club extends BaseDomain {

    // 社团 id
    private int clubId;

    // 社团名
    private String name;

    // 社团电话
    private String tel;

    // 社团联系人邮箱
    private String email;

    // 社团联系人/负责人 姓名
    private String responsiblePerson;

    // 社团介绍（富文本）
    private String introduction;

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    // 社团简介
    private String briefIntroduction;

    // 用户状态 0 正常， -1 禁用
    private int state;

    // 部门数量
    private int depCount;

    //社团类型，0 职能类， 1 兴趣类
    private int type;
    @JsonSerialize(using = CustomDateSerializer.class)
    private Timestamp createtime;

    @JsonSerialize(using = CustomDateSerializer.class)
    private Timestamp updatetime;

    public int getClubId() {
        return clubId;
    }

    public void setClubId(int clubId) {
        this.clubId = clubId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getBriefIntroduction() {
        return briefIntroduction;
    }

    public void setBriefIntroduction(String briefIntroduction) {
        this.briefIntroduction = briefIntroduction;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getDepCount() {
        return depCount;
    }

    public void setDepCount(int depCount) {
        this.depCount = depCount;
    }
}


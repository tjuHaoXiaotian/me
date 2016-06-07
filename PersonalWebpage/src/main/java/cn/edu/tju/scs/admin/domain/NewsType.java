package cn.edu.tju.scs.admin.domain;

import cn.edu.tju.scs.admin.domain.base.BaseDomain;

/**
 * Created by jack on 2016/5/10.
 */
public class NewsType extends BaseDomain{
    private int id;
    private String classDescription;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClassDescription() {
        return classDescription;
    }

    public void setClassDescription(String classDescription) {
        this.classDescription = classDescription;
    }
}

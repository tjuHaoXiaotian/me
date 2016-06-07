package cn.edu.tju.scs.admin.common;

/**
 * Created by jack on 2016/5/18.
 */
public enum  NewsStatusCode {

    // 未审查
    SUBMITTED(0),
    // 已采纳
    PASSED(1),
    // 已拒绝
    REJECTED(2),
    // 已发布
    PUBLISHED(3)

    ;




    private int status;
    private NewsStatusCode(int status){
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}

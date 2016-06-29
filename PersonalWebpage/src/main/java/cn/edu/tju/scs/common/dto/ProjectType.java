package cn.edu.tju.scs.common.dto;

/**
 * Created by haoxiaotian on 2016/6/27 23:02.
 */
public enum  ProjectType {
    Visualization("可视化","")
    ;


    private String description;
    private String type;

    private ProjectType(String description,String type){
        this.description = description;
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}

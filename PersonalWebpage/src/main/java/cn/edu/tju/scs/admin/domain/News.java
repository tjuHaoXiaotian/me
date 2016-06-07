package cn.edu.tju.scs.admin.domain;

import cn.edu.tju.scs.admin.common.CustomDateSerializer;
import cn.edu.tju.scs.admin.domain.base.BaseDomain;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.sql.Timestamp;
import java.util.Date;

/**
 * 新闻描述类
 * Created by jack on 2016/5/10.
 */
public class News extends BaseDomain {

    // 文章id
    private int id;
    // 文章 标题
    private String title;
    // 关键字
    private String keyWords;
    // 文章类型
    private NewsType type;
    // 内容
    private String content;
    // 内容概要
    private String briefContent;
    // 访问次数
    private int visitedTimes;
    // 创建时间
    @JsonSerialize(using = CustomDateSerializer.class)
    private Timestamp createTime;
    // 更新时间
    @JsonSerialize(using = CustomDateSerializer.class)
    private Timestamp updateTime;
    // 审查时间
    @JsonSerialize(using = CustomDateSerializer.class)
    private Timestamp checkTime;


    // 权重（1：置顶，0：不置顶）
    private int weight;
    // 状态  0:： 待审核  1：已通过 2：未通过 3：已发布,-1 已删除
    private int status;

    private String fromUser;

    private String checkUser;

    // 如果有图片，添加一条路径
    private String imageUrl;




    public News() {
    }


    public News(int id, String title, String keyWords, String briefContent,String fromUser, int visitedTimes,int status,Date createTime,Date updateTime, Date checkTime,String imageUrl, NewsType type) {
        this.id = id;
        this.title = title;
        this.keyWords = keyWords;
        this.briefContent = briefContent;
        this.fromUser = fromUser;
        this.visitedTimes = visitedTimes;
        this.createTime = (Timestamp) createTime;
        this.updateTime = (Timestamp) updateTime;
        this.checkTime = (Timestamp)checkTime;
        this.status = status;
        this.imageUrl = imageUrl;
        this.type = type;

    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        System.out.println("调用了get title");
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getKeyWords() {
        return keyWords;
    }

    public void setKeyWords(String keyWords) {
        this.keyWords = keyWords;
    }

    public NewsType getType() {
        return type;
    }

    public void setType(NewsType type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public int getVisitedTimes() {
        return visitedTimes;
    }

    public void setVisitedTimes(int visitedTimes) {
        this.visitedTimes = visitedTimes;
    }

    public String getBriefContent() {
        return briefContent;
    }

    public void setBriefContent(String briefContent) {
        this.briefContent = briefContent;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Timestamp getCheckTime() {
        System.out.println("调用了get checkTime");
        return checkTime;
    }

    public void setCheckTime(Timestamp checkTime) {
        this.checkTime = checkTime;
    }

    public String getFromUser() {
        return fromUser;
    }

    public void setFromUser(String fromUser) {
        this.fromUser = fromUser;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getCheckUser() {
        return checkUser;
    }

    public void setCheckUser(String checkUser) {
        this.checkUser = checkUser;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", keyWords='" + keyWords + '\'' +
                ", type=" + type +
                ", content='" + content + '\'' +
                ", briefContent='" + briefContent + '\'' +
                ", visitedTimes=" + visitedTimes +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", checkTime=" + checkTime +
                ", weight=" + weight +
                ", status=" + status +
                ", fromUser='" + fromUser + '\'' +
                ", imageUrl='" + imageUrl + '\'' +
                '}';
    }
}

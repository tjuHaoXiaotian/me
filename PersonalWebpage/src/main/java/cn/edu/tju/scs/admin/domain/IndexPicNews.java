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
public class IndexPicNews extends BaseDomain {

    // 文章id
    private int id;
    // 文章 标题
    private String title;
    // 关键字
    private String keyWords;
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

    private String checkTime;

    private String fromUser;

    // 图片，添加一条路径
    private String imageUrl;




    public IndexPicNews() {
    }


    public IndexPicNews(int id, String title, String keyWords, String briefContent, String fromUser, int visitedTimes,  Date createTime, Date updateTime, String imageUrl) {
        this.id = id;
        this.title = title;
        this.keyWords = keyWords;
        this.briefContent = briefContent;
        this.fromUser = fromUser;
        this.visitedTimes = visitedTimes;
        this.createTime = (Timestamp) createTime;
        this.updateTime = (Timestamp) updateTime;
        this.imageUrl = imageUrl;
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

    public String getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(String checkTime) {
        this.checkTime = checkTime;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", keyWords='" + keyWords + '\'' +
                ", content='" + content + '\'' +
                ", briefContent='" + briefContent + '\'' +
                ", visitedTimes=" + visitedTimes +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", fromUser='" + fromUser + '\'' +
                ", imageUrl='" + imageUrl + '\'' +
                '}';
    }
}

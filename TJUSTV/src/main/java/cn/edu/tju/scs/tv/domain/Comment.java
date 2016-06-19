package cn.edu.tju.scs.tv.domain;


import cn.edu.tju.scs.common.CustomDateSerializer;
import cn.edu.tju.scs.tv.domain.base.BaseDomain;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.sql.Timestamp;

/**
 * 评论
 * Created by jack on 2016/3/28.
 */
public class Comment extends BaseDomain {

    private int commentId;

    // 评论内容
    private String content;

    // 用户创建时间
    @JsonSerialize(using = CustomDateSerializer.class)
    private Timestamp createtime;

    // 用户
    private User user;

    private int videoId;

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }
}

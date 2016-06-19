package cn.edu.tju.scs.tv.domain;


import cn.edu.tju.scs.tv.domain.base.BaseDomain;

/**
 * 用户收藏
 * Created by jack on 2016/3/28.
 */
public class Collection extends BaseDomain {
    private int collectionId;

    private int userId;

    private Video video;

    public Collection(){

    }

    public Collection(int userId,Video video){
        this.userId = userId;
        this.video = video;
    }

    public int getCollectionId() {
        return collectionId;
    }

    public void setCollectionId(int collectionId) {
        this.collectionId = collectionId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }
}

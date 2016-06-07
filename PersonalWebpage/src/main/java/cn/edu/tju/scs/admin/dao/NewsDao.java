package cn.edu.tju.scs.admin.dao;

import cn.edu.tju.scs.common.dao.base.BaseDao;
import cn.edu.tju.scs.common.dao.base.PageResults;
import cn.edu.tju.scs.admin.domain.News;

import java.util.List;

/**
 * Video Dao
 * Created by jack on 2016/3/16.
 */
public class NewsDao extends BaseDao<News,Integer> {

    /**
     * 根据类型查询所有新闻（已发布）
     * @param typeId
     * @return
     */
    public List<News> getAllByType(int typeId){
        String hql = "select new News(id, title, keyWords, briefContent,fromUser, visitedTimes,status,createTime,updateTime,checkTime,imageUrl,type) from News news where news.status = 3 and news.type.id = ?";
        return this.getListByHQL(hql,typeId);
    }

    /**
     * 将编号为id的新闻置顶
     * @param id
     */
    public void setNewsTop(int id){
        String sql = "update news news set news.WEIGHT = 1,news.UPDATE_TIME = now() where news.id = ?";
        this.querySql(sql,id);
    }

    /**
     * 新闻浏览页面，根据排序，列出所有新闻
     * @return
     */
    public List<News> getAllFromTopToBottom(){
        String hql = "from News news where news.status = 3 order by news.weight desc , news.updateTime desc";
        return this.getListByHQL(hql);
    }

    /**
     * 新闻浏览页面，根据类别，并排序，列出所有新闻
     * @return
     */
    public List<News> getAllFromTopToBottomByType(int typeId){
        String hql = "from News news where news.status = 3 and news.type.id = ? order by news.weight desc , news.updateTime desc";
        return this.getListByHQL(hql,typeId);
    }

    /**
     * 新闻浏览页面，根据类别，并排序，列出部分新闻新闻，limit from，length
     * @return
     */
    public PageResults<News> getPartFromTopToBottomByType(int typeId,int pageNum,int pageSize){
//        String hql = "from News news where news.status = 3 and news.type.id = ? order by news.weight desc , news.updateTime desc";
        String hql = "select new News(id, title, keyWords, briefContent,fromUser, visitedTimes,status,createTime,updateTime,checkTime,imageUrl,type) from News news where news.status = 3 and news.type.id = ? order by news.weight desc , news.updateTime desc";
        return this.findPageByFetchedHql(hql, null, pageNum, pageSize, typeId);
    }

    /**
     * 查看所有已发布新闻（包括删除）
     * @return
     */
    public List<News> getAllBriefInfo(){
        String hql = "select new News(id, title, keyWords, briefContent,fromUser, visitedTimes,status,createTime,updateTime,checkTime,imageUrl,type) from News news order by news.id desc";
        return this.getListByHQL(hql);
    }

    /**
     * 查看所有已发布新闻(不包括删除的)
     * @return
     */
    public List<News> getAllPublishedBriefInfo(Integer typeId){
        String hql = null;
        if(typeId == null){
            hql = "select new News(id, title, keyWords, briefContent,fromUser, visitedTimes,status,createTime,updateTime,checkTime,imageUrl,type) from News news where news.status = 3 order by news.id desc";
            return this.getListByHQL(hql);
        }else{
            hql = "select new News(id, title, keyWords, briefContent,fromUser, visitedTimes,status,createTime,updateTime,checkTime,imageUrl,type) from News news where news.status = 3 and news.type.id = ? order by news.id desc";
            return this.getListByHQL(hql,typeId);
        }
    }

    /**
     * 查看所有来稿
     * @return
     */
    public List<News> getAllBriefDrafts(){
        String hql = "select new News(id, title, keyWords, briefContent,fromUser, visitedTimes,status,createTime,updateTime,checkTime,imageUrl,type) from News where status != 3";
        return this.getListByHQL(hql);
    }

    /**
     * 根据status查看所有来稿
     * @return
     */
    public List<News> getAllBriefDraftsByStatus(int status){
        String hql = "select new News(id, title, keyWords, briefContent,fromUser, visitedTimes,status,createTime,updateTime,checkTime,imageUrl,type) from News where status = ?";
        return this.getListByHQL(hql,status);
    }

    /**
     * 根据投稿人查看所有来稿
     * @return
     */
    public List<News> getAllBriefDraftsByFromUser(String fromUser){
        System.out.println("fromUser" + fromUser);
//        String hql = "from News where fromUser = ?";
        String hql = "select new News(id, title, keyWords, briefContent,fromUser, visitedTimes,status,createTime,updateTime,checkTime,imageUrl,type) from News news where news.fromUser = ?";

//        String hql = "select new News(id, title, keyWords, briefContent, fromUser, visitedTimes, status, createTime, updateTime, checkTime, imageUrl,type) from News where fromUser = ?";
        return this.getListByHQL(hql,fromUser);
    }


    /**
     * 更新编号 id 新闻的状态
     * @param status 状态
     * @param newsId news id
     */
    public void updateNewsStatus(int status,int newsId){
        String sql = "update news news set news.status = ? where news.id = ?";
        this.querySql(sql,status,newsId);
    }

}

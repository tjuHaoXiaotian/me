package cn.edu.tju.scs.admin.service;

import cn.edu.tju.scs.common.dao.base.PageResults;
import cn.edu.tju.scs.admin.domain.News;

import java.util.List;

/**
 * Created by jack on 2016/5/10.
 */
public interface NewsService {


    /**
     * 查看所有已发布新闻
     * @return
     */
    public List<News> getAll();


    /**
     * 查看所有来稿
     * @return
     */
    public List<News> getAllDrafts();

    /**
     * 根据状态status查看所有来稿
     * @return
     */
    public List<News> getAllDraftsByStatus(int status);

    /**
     * 根据类型查询所有新闻(包括删除的)
     * @param typeId
     * @return
     */
    public List<News> getAll(int typeId);

    /**
     * 根据类型查询所有新闻(不包括删除的)
     * @param typeId
     * @return
     */
    public List<News> getAllPublished(Integer typeId);

    public News getNews(int id);

    public void saveNews(News news);

    public void updateNews(News news);

    public void deleteNews(int id);

    /**
     * 将编号为id的新闻置顶
     * @param id
     */
    public void setNewsTop(int id);

    /**
     * 新闻浏览页面，根据排序，列出所有新闻
     * @return
     */
    public List<News> getAllFromTopToEnd();

    /**
     * 新闻浏览页面，根据类别，并排序，列出所有新闻
     * @return
     */
    public List<News> getAllFromTopToEndByType(int typeId);


    /**
     * 新闻浏览页面，根据类别，并排序，列出部分新闻新闻，limit from，length
     * @return
     */
    public PageResults<News> getPartsFromTopToEndByType(int typeId,int pageNum,int pageSize);


    /**
     * 更新编号 id 新闻的状态
     * @param status
     * @param newsId
     */
    public void updateStatus(int status, int newsId);

    public List<News> getAllDraftsByFromUser(String fromUser);

    public void deleteNewsByStatus(int id);

    public List<News> getRecentNews();
}

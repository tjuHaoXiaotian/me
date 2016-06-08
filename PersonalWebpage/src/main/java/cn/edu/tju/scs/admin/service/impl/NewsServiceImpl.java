package cn.edu.tju.scs.admin.service.impl;

import cn.edu.tju.scs.common.dao.base.PageResults;
import cn.edu.tju.scs.admin.dao.NewsDao;
import cn.edu.tju.scs.admin.domain.News;
import cn.edu.tju.scs.admin.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * NewsServiceImpl
 * Created by jack on 2016/5/10.
 */

@Service("newsService")
public class NewsServiceImpl implements NewsService{

    @Autowired
    NewsDao newsDao;

    @Override
    public List<News> getAll() {
        return newsDao.getAllBriefInfo();
    }

    /**
     * 根据类型查询所有新闻(不包括删除的)
     * @param typeId
     * @return
     */
    @Override
    public List<News> getAllPublished(Integer typeId){
        return newsDao.getAllPublishedBriefInfo(typeId);
    }

    @Override
    public List<News> getAllDrafts() {
        return newsDao.getAllBriefDrafts();
    }

    @Override
    public List<News> getAllDraftsByStatus(int status) {
        return newsDao.getAllBriefDraftsByStatus(status);
    }

    @Override
    public List<News> getAllDraftsByFromUser(String fromUser) {
        return newsDao.getAllBriefDraftsByFromUser(fromUser);
    }

    @Override
    public void deleteNewsByStatus(int id) {
        newsDao.updateNewsStatus(-1,id);
    }

    @Override
    public List<News> getRecentNews() {
        return newsDao.getRecentNews();
    }

    @Override
    public List<News> getAll(int typeId) {
        return newsDao.getAllByType(typeId);
    }

    @Override
    public News getNews(int id) {
        return newsDao.get(id);
    }

    @Override
    public void saveNews(News news) {
        newsDao.save(news);
    }

    @Override
    public void updateNews(News news) {
        newsDao.update(news);
    }

    @Override
    public void deleteNews(int id) {
        newsDao.deleteById(id);
    }

    @Override
    public void setNewsTop(int id) {
        newsDao.setNewsTop(id);
    }

    @Override
    public List<News> getAllFromTopToEnd() {
        return newsDao.getAllFromTopToBottom();
    }

    @Override
    public List<News> getAllFromTopToEndByType(int typeId) {
        return newsDao.getAllFromTopToBottomByType(typeId);
    }

    @Override
    public void updateStatus(int status, int newsId) {
        newsDao.updateNewsStatus(status,newsId);
    }



    @Override
    public PageResults<News> getPartsFromTopToEndByType(int typeId,int pageNum,int pageSize) {
        return newsDao.getPartFromTopToBottomByType(typeId,pageNum,pageSize);
    }
}

package cn.edu.tju.scs.admin.service.impl;

import cn.edu.tju.scs.admin.dao.NewsTypeDao;
import cn.edu.tju.scs.admin.domain.NewsType;
import cn.edu.tju.scs.admin.service.NewsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jack on 2016/5/10.
 */

@Service("newsTypeService")
public class NewsTypeServiceImpl implements NewsTypeService{

    @Autowired
    NewsTypeDao newsTypeDao;

    @Override
    public List<NewsType> getAll() {
        return newsTypeDao.getAll();
    }

    @Override
    public NewsType getNewsType(int id) {
        return newsTypeDao.get(id);
    }

    @Override
    public void saveNewsType(NewsType newsType) {
        newsTypeDao.save(newsType);
    }

    @Override
    public void updateNewsType(NewsType newsType) {
        newsTypeDao.update(newsType);
    }

    @Override
    public void deleteNewsType(int id) {
        newsTypeDao.deleteById(id);
    }
}

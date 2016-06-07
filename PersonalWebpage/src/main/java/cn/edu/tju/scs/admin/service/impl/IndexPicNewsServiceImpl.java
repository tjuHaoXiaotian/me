package cn.edu.tju.scs.admin.service.impl;

import cn.edu.tju.scs.admin.dao.IndexPicNewsDao;
import cn.edu.tju.scs.admin.domain.IndexPicNews;
import cn.edu.tju.scs.admin.service.IndexPicNewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jack on 2016/5/20.
 */
@Service("indexPicNewsService")
public class IndexPicNewsServiceImpl implements IndexPicNewsService {

    @Autowired
    IndexPicNewsDao indexPicNewsDao;

    @Override
    public void addIndexPicNews(IndexPicNews indexPicNews) {
        indexPicNewsDao.save(indexPicNews);
    }

    @Override
    public void updateIndexPicNews(IndexPicNews indexPicNews) {
        indexPicNewsDao.update(indexPicNews);
    }

    @Override
    public void deleteIndexPicNews(int id) {
        indexPicNewsDao.deleteById(id);
    }

    @Override
    public List<IndexPicNews> getAllIndexPicNews() {
        return indexPicNewsDao.getAll();
    }

    @Override
    public IndexPicNews getOne(int id) {
        return indexPicNewsDao.get(id);
    }
}

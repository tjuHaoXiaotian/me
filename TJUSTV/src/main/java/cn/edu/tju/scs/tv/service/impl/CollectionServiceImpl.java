package cn.edu.tju.scs.tv.service.impl;

import cn.edu.tju.scs.tv.dao.CollectionDao;
import cn.edu.tju.scs.tv.dao.VideoDao;
import cn.edu.tju.scs.tv.domain.Collection;
import cn.edu.tju.scs.tv.domain.Video;
import cn.edu.tju.scs.tv.service.CollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 收藏 ServiceImpl
 * Created by jack on 2016/4/17.
 */

@Service("collectionService")
public class CollectionServiceImpl implements CollectionService {
    @Autowired
    CollectionDao collectionDao;
    @Autowired
    VideoDao videoDao;

    @Override
    public int collect(int userId, int videoId) {
        Video video = videoDao.get(videoId);
        Collection collection = new Collection(userId,video);
        collectionDao.save(collection);
        return collection.getCollectionId();
    }


    @Override
    public void deCollect(int collectionId) {
        collectionDao.deleteById(collectionId);
    }

    @Override
    public List<Collection> getAllCollection(int userId) {
        return collectionDao.getListByHQL("from Collection where userId = ?", userId);
    }

}

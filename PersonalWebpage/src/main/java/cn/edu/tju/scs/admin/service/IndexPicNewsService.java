package cn.edu.tju.scs.admin.service;

import cn.edu.tju.scs.admin.domain.IndexPicNews;

import java.util.List;

/**
 * Created by jack on 2016/5/20.
 */
public interface IndexPicNewsService {


    public void addIndexPicNews(IndexPicNews indexPicNews);

    public void updateIndexPicNews(IndexPicNews indexPicNews);

    public void deleteIndexPicNews(int id);

    public List<IndexPicNews> getAllIndexPicNews();

    public IndexPicNews getOne(int id);

}

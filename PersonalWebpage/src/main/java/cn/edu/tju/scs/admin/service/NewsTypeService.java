package cn.edu.tju.scs.admin.service;

import cn.edu.tju.scs.admin.domain.NewsType;

import java.util.List;

/**
 * Created by jack on 2016/5/10.
 */
public interface NewsTypeService {

    public List<NewsType> getAll();

    public NewsType getNewsType(int id);

    public void saveNewsType(NewsType newsType);

    public void updateNewsType(NewsType newsType);

    public void deleteNewsType(int id);
}

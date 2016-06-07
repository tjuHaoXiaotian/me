package cn.edu.tju.scs.club.service.impl;

import cn.edu.tju.scs.admin.util.FileUtil;
import cn.edu.tju.scs.admin.util.PathUtil;
import cn.edu.tju.scs.club.dao.ClubDao;
import cn.edu.tju.scs.club.domain.Club;
import cn.edu.tju.scs.club.domain.User;
import cn.edu.tju.scs.club.service.ClubService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * ClubServiceImpl
 * Created by jack on 2016/3/26.
 */

@Service(value = "clubService")
public class ClubServiceImpl implements ClubService {

    @Autowired
    ClubDao clubDao;

    @Override
    public List<Club> getAllClub(){
        return clubDao.getAll();
    }

    @Override
    public void addClub(Club club) {
        clubDao.save(club);
    }

    @Override
    public Club findClubByUser(User user) {
        String query = "from Club where ref_user_id = ?";
        return clubDao.getByHQL(query,user.getUserId());
    }

    @Override
    public void updateClub(Club club) {
        clubDao.update(club);
    }

    @Override
    public Club getClub(int id) {
        return clubDao.get(id);
    }

    @Override
    public void deleteById(int clubId) {
        Club club = getClub(clubId);

        // 删除图片
        Set<String> imageUrls = new HashSet<String>();
        String content = club.getIntroduction();
        while (content.contains("<img")){
            int index = content.indexOf("<img");
            int endIndex = content.indexOf("/>",index) + 2;
            String imgBlock = content.substring(index, endIndex);
            imageUrls.add(imgBlock);
//            System.out.println(imgBlock);
            content = content.substring(endIndex);
        }

        Iterator<String> imageIterator = imageUrls.iterator();
        while (imageIterator.hasNext()){
            String imgBlock = imageIterator.next();
//            System.out.println("-----------------------------\n" + imgBlock);
            int srcIndex = imgBlock.indexOf("src") + 5;
            int srcEndIndex = imgBlock.indexOf('\"',srcIndex);
            String url = imgBlock.substring(srcIndex, srcEndIndex);

            url = (PathUtil.BASE_FILE_PATH+url).replace("/", File.separator);

            FileUtil.deleteFile(url);
        }

        // 删除实体
        clubDao.deleteById(clubId);
    }

    @Override
    public List<Club> getAllClubType(Integer type) {
        String hql = "from Club where type = ?";
        return clubDao.getListByHQL(hql,type);
    }
}

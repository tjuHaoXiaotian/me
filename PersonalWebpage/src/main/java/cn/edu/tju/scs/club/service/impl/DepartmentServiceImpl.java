package cn.edu.tju.scs.club.service.impl;

import cn.edu.tju.scs.admin.util.FileUtil;
import cn.edu.tju.scs.admin.util.PathUtil;
import cn.edu.tju.scs.club.dao.ClubDao;
import cn.edu.tju.scs.club.dao.DepartmentDao;
import cn.edu.tju.scs.club.domain.Club;
import cn.edu.tju.scs.club.domain.Department;
import cn.edu.tju.scs.club.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * DepartmentServiceImpl
 * Created by jack on 2016/3/26.
 */
@Service(value = "departmentService")
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    DepartmentDao departmentDao;

    @Autowired
    ClubDao clubDao;

    @Override
    public void addDepartment(Department department) {
        departmentDao.save(department);
    }

    @Override
    public List<Department> getDepartments(String type) {
        String query = "from User where account = ?";
        return departmentDao.getListByHQL(query,type);

    }

    @Override
    public List<Department> getAllDepartments(int refClubId) {

        String query = "from Department where club.clubId = ?";
        return departmentDao.getListByHQL(query,refClubId);
    }

    @Override
    public Department getDepartmentById(int id) {
        return departmentDao.get(id);
    }

    @Override
    public void updateDep(Department department) {
        departmentDao.update(department);
    }





    @Override
    public boolean deleteDepById(int clubId,int depId) {

        Department department = getDepartmentById(depId);

        if(department == null){
            return false;
        }else if(clubId != department.getClub().getClubId()){
            return false;
        }else{
            // 数量减一
            Club club = department.getClub();
            club.setDepCount(club.getDepCount() > 0?club.getDepCount()-1:0);
            clubDao.update(club);

            // 删除图片
            Set<String> imageUrls = new HashSet<String>();
            String content = department.getIntroduction();
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
            departmentDao.deleteById(depId);
            return true;
        }


    }



    @Override
    public void deleteDepByClubId(int clubId) {
        List<Department> departments =  getAllDepartments(clubId);
        if(departments!=null && departments.size() > 0){
            for(Department department:departments){
                // 删除图片
                Set<String> imageUrls = new HashSet<String>();
                String content = department.getIntroduction();
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
                departmentDao.deleteById(department.getDepId());
            }
        }
    }
}

package cn.edu.tju.scs.club.service;

import cn.edu.tju.scs.club.domain.Department;

import java.util.List;

/**
* DepartmentService
* Created by jack on 2016/3/26.
*/
public interface DepartmentService {
    public void addDepartment(Department department);

    public List<Department> getDepartments(String type);

    public List<Department> getAllDepartments(int refClubId);

    public Department getDepartmentById(int id);

    public void updateDep(Department department);

    public boolean deleteDepById(int clubId,int depId);

    public void deleteDepByClubId(int clubId);

}

package cn.edu.tju.scs.club.web.controller;

import cn.edu.tju.scs.admin.util.FileUtil;
import cn.edu.tju.scs.admin.util.PathUtil;
import cn.edu.tju.scs.club.domain.Club;
import cn.edu.tju.scs.club.domain.Department;
import cn.edu.tju.scs.club.domain.User;
import cn.edu.tju.scs.club.service.ClubService;
import cn.edu.tju.scs.club.service.DepartmentService;
import cn.edu.tju.scs.club.service.UserService;
import cn.edu.tju.scs.club.util.GetIP;
import cn.edu.tju.scs.club.web.controller.base.BaseController;
import cn.edu.tju.scs.common.dto.BizCode;
import cn.edu.tju.scs.common.dto.ErrorInfo;
import cn.edu.tju.scs.common.dto.StateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.net.SocketException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * /club
 * Created by Takahashi on 2016/3/26.
 */

@Controller
@RequestMapping(value ="/clubs")
public class ClubController extends BaseController {

    @Autowired
    ClubService clubService;

    @Autowired
    UserService userService;

    @Autowired
    DepartmentService departmentService;

    /**
     * 社团相关******************************************************************************************************
     */

    /**
     * 管理员新建社团
     * 获取页面
     * @return
     */
    @RequestMapping(value = "/new.html",method = RequestMethod.GET)
    public String newClubPage(){
        return "/admin/admin-club-new";
    }


    /**
     * 添加社团 post json
     * @param user
     * @return
     */
    @RequestMapping(method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    public @ResponseBody StateCode newClubAction(@RequestBody User user,HttpServletRequest request) throws SocketException {
        // 保存User
        user.setState(0);
        user.setLastIp(GetIP.getIpAddr(request));
        user.getClub().setState(0);
        userService.saveUser(user);
        StateCode stateCode = StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("user",user);
        System.out.println("remote Address 1:" + GetIP.getRemortIP(request));
        System.out.println("remote Address 2:" + GetIP.getIpAddr(request));
        System.out.println("remote Address 3:" + GetIP.getRealIp());


        return stateCode;
    }

    /**
     * 获取社团列表页
     * @return
     */
    @RequestMapping(value = "/list.html",method = RequestMethod.GET)
    public String listPage(){
        return "admin/admin-clubs";
    }

    /**
     * 获取所有社团 json
     * @return
     */
    @RequestMapping(method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
    public @ResponseBody StateCode listPageAction(@RequestParam(value = "type",required = false) Integer type){
        StateCode stateCode = StateCode.buildCode(BizCode.SUCCESS);

        if(type != null){
            stateCode.addData("clubs",clubService.getAllClubType(type));
        }else{
            stateCode.addData("clubs",clubService.getAllClub());
        }
        return stateCode;
    }


    /**
     * 预览某个社团主页
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/club_{id}.html",method = RequestMethod.GET)
    public String clubPage(@PathVariable("id") Integer id,Model model){
        if(id == null || id < 0){
            return "admin/admin-clubs";
        }else{
            model.addAttribute("club",clubService.getClub(id));
            model.addAttribute("departments",departmentService.getAllDepartments(id));
            return "client/client-club";
        }
    }

    /**
     * 编辑社团页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/{id}/edit.html")
    public String editPage(@PathVariable("id") Integer id,Model model){
        if(id == null || id < 0){
            return "admin/admin-clubs";
        }else{
//            User user = userService.findUserByClubId(id);
//            model.addAttribute("userId",user.getUserId());
            model.addAttribute("clubId",id);
            return "admin/admin-club-edit";
        }
    }

    /**
     * 根据 clubId 查询 user
     * @param id
     * @return
     */
    @RequestMapping(value = "/{clubId}",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public @ResponseBody StateCode getClubAction(@PathVariable ("clubId") Integer id){
        User user = userService.findUserByClubId(id);
        StateCode stateCode = StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("user",user);
        return stateCode;
    }


    /**
     * 更新用户 put json
     * @param user
     * @param request
     * @return
     */
    @RequestMapping(value = "{userId}",method = RequestMethod.PUT,produces = {"application/json;charset=utf-8"})
    public @ResponseBody StateCode updateClubAction(@PathVariable("userId") Integer userId,@RequestBody User user,HttpServletRequest request){
        if(userId != user.getUserId()){
            return StateCode.buildCode(BizCode.FAIL);
        }
        User old = userService.findUserById(user.getUserId());

        old.setAccount(user.getAccount());
        old.setPassword(user.getPassword());
        old.setLastIp(GetIP.getIpAddr(request));

        old.getClub().setName(user.getClub().getName());
        old.getClub().setTel(user.getClub().getTel());
        old.getClub().setEmail(user.getClub().getEmail());
        old.getClub().setResponsiblePerson(user.getClub().getResponsiblePerson());
        old.getClub().setIntroduction(user.getClub().getIntroduction());
        old.getClub().setBriefIntroduction(user.getClub().getBriefIntroduction());

        userService.updateUser(old);

        StateCode stateCode = StateCode.buildCode(BizCode.SUCCESS);
//        stateCode.addData("user",user);
        return stateCode;
    }

    /**
     * 删除 club
     * @param clubId
     * @return
     */
    @RequestMapping(value = "/{clubId}",method = RequestMethod.DELETE,produces = {"application/json;charset=utf-8"})
    public @ResponseBody StateCode deleteClubAction(@PathVariable("clubId") Integer clubId){
        // 删除关联用户
        userService.deleteUserByClubId(clubId);

        // 删除关联部门
        departmentService.deleteDepByClubId(clubId);

        // 删除自身
        clubService.deleteById(clubId);
        return StateCode.buildCode(BizCode.SUCCESS);
    }


    /**
     * 部门相关******************************************************************************************************
     */

    /**
     * 添加部门页面
     * @param clubId
     * @param model
     * @return
     */
    @RequestMapping(value = "/{clubId}/departments/new.html",method = RequestMethod.GET)
    public String newDepPage(@PathVariable("clubId") Integer clubId,Model model){
        Club club = clubService.getClub(clubId);
        if(club == null){
            ErrorInfo errorInfo = new ErrorInfo("404","此社团不存在");
            model.addAttribute("error",errorInfo);
            return "/admin/admin-error";
        }
        model.addAttribute("club",club);
        return "/admin/admin-department-new";
    }

    /**
     * 查看社团部门列表页面
     * @param clubId
     * @param model
     * @return
     */
    @RequestMapping(value = "/{clubId}/departments.html",method = RequestMethod.GET)
    public String viewDepsPage(@PathVariable("clubId")Integer clubId,Model model,@RequestParam("club") String club){
        model.addAttribute("clubId",clubId);
        model.addAttribute("club",club);
        return "admin/admin-departments";
    }

    /**
     * 部门信息修改页
     * @param clubId
     * @param depId
     * @param model
     * @return
     */
    @RequestMapping(value = "/{clubId}/departments/edit_{depId}",method = RequestMethod.GET)
    public String editDepsPage(@PathVariable("clubId")Integer clubId,@PathVariable("depId") Integer depId,Model model){
        Club club = clubService.getClub(clubId);
        if(club == null){
            ErrorInfo errorInfo = new ErrorInfo("404","此社团不存在");
            model.addAttribute("error",errorInfo);
            return "/admin/admin-error";
        }
        model.addAttribute("club",club);
        model.addAttribute("depId",depId);
        return "admin/admin-department-edit";
    }

    /**
     * 获取单个部门信息页面
     * @param clubId
     * @param depId
     * @return
     */
    @RequestMapping(value = "/{clubId}/departments/department_{depId}.html",method = RequestMethod.GET)
    public String getDepPage(@PathVariable("clubId") Integer clubId, @PathVariable("depId") Integer depId,Model model){
        Department department = departmentService.getDepartmentById(depId);
        if(department == null || clubId != department.getClub().getClubId()){
            ErrorInfo errorInfo = new ErrorInfo("404","此社团不存在");
            model.addAttribute("error",errorInfo);
            return "client/client-error";
        }else{
            model.addAttribute("department",department);
            model.addAttribute("departments",departmentService.getAllDepartments(clubId));
            return "client/client-department";
        }
    }


    /**
     * 添加部门 post json
     * @param clubId
     * @param department
     * @return
     */
    @RequestMapping(value = "/{clubId}/departments",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    public @ResponseBody StateCode updateDepAction(@PathVariable("clubId") Integer clubId, @RequestBody Department department){
        Club club = clubService.getClub(clubId);
        club.setDepCount(club.getDepCount()+1);
        if(club == null){
           return StateCode.buildCode(BizCode.FAIL);
        }else{
            department.setClub(club);
            departmentService.addDepartment(department);
            clubService.updateClub(club);
            return StateCode.buildCode(BizCode.SUCCESS);
        }
    }



    /**
     * 获取单个部门信息
     * @param clubId
     * @param depId
     * @return
     */
    @RequestMapping(value = "/{clubId}/departments/{depId}",method = RequestMethod.GET,produces = "application/json;charset=utf-8")
    public @ResponseBody StateCode getDepAction(@PathVariable("clubId") Integer clubId, @PathVariable("depId") Integer depId){

        StateCode stateCode = StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("department", departmentService.getDepartmentById(depId));
        return stateCode;
    }

    /**
     * 获取某个社团全部部门信息
     * @param clubId
     * @return
     */
    @RequestMapping(value = "/{clubId}/departments",method = RequestMethod.GET,produces = "application/json;charset=utf-8")
    public @ResponseBody StateCode getAllDepAction(@PathVariable("clubId") Integer clubId){

        StateCode stateCode = StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("departments", departmentService.getAllDepartments(clubId));
        return stateCode;
    }


    /**
     * 更新部门 put json
     * @param clubId
     * @param depId
     * @param department
     * @return
     */
    @RequestMapping(value = "/{clubId}/departments/{depId}",method = RequestMethod.PUT,produces = "application/json;charset=utf-8")
    public @ResponseBody StateCode newDepAction(@PathVariable("clubId") Integer clubId,@PathVariable("depId") Integer depId, @RequestBody Department department){
        Club club = clubService.getClub(clubId);
        Department old = departmentService.getDepartmentById(depId);
        if(club == null || old == null || clubId != old.getClub().getClubId() || depId != department.getDepId()){
            return StateCode.buildCode(BizCode.FAIL);
        }else{
            old.setClub(club);
            old.setBriefIntroduction(department.getBriefIntroduction());
            old.setIntroduction(department.getIntroduction());
            old.setResponsiblePerson(department.getResponsiblePerson());
            old.setDepName(department.getDepName());
            old.setEmail(department.getEmail());
            old.setTel(department.getTel());
            departmentService.updateDep(old);
            return StateCode.buildCode(BizCode.SUCCESS);
        }
    }


    /**
     * 删除部门
     * @param clubId
     * @return
     */
    @RequestMapping(value = "/{clubId}/departments/{depId}",method = RequestMethod.DELETE,produces = {"application/json;charset=utf-8"})
    public @ResponseBody StateCode deleteClubAction(@PathVariable("clubId") Integer clubId,@PathVariable("depId") Integer depId){
        if(departmentService.deleteDepById(clubId,depId)){
            return StateCode.buildCode(BizCode.SUCCESS);
        }else {
            return StateCode.buildCode(BizCode.FAIL);
        }
    }


}

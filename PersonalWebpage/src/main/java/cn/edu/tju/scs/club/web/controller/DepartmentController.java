package cn.edu.tju.scs.club.web.controller;

import cn.edu.tju.scs.common.dto.BizCode;
import cn.edu.tju.scs.common.dto.StateCode;
import cn.edu.tju.scs.club.service.ClubService;
import cn.edu.tju.scs.club.service.DepartmentService;
import cn.edu.tju.scs.club.web.controller.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Takahashi on 2016/3/27.
 */
@Controller(value = "departmentController")
@RequestMapping(value ={"departments"})
public class DepartmentController extends BaseController {

    @Autowired
    DepartmentService departmentService;

    @Autowired
    ClubService clubService;


    @RequestMapping(method = RequestMethod.GET)
    public @ResponseBody StateCode getDepartments(HttpServletRequest request){
        String type = request.getParameter("type");
        StateCode stateCode = StateCode.buildCode(BizCode.SUCCESS);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("departments", departmentService.getDepartments(type));
        stateCode.setData(map);
        return stateCode;
    }

    @RequestMapping(value ="/{depId}",method = RequestMethod.GET)
    public String getDepartment(@PathVariable int depId,ModelMap map){
        map.put("department",departmentService.getDepartmentById(depId));
        return "client/add-department";
    }


}

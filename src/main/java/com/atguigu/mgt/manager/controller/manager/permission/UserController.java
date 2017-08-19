package com.atguigu.mgt.manager.controller.manager.permission;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.mgt.manager.bean.TRole;
import com.atguigu.mgt.manager.bean.TUsers;
import com.atguigu.mgt.manager.service.xktservice.TRoleService;
import com.atguigu.mgt.manager.service.xktservice.TUserRoleService;
import com.atguigu.mgt.manager.service.xktservice.TUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/permission/user")
public class UserController {
    @Autowired
    TUserService tUserService;
    
    @Autowired
    TUserRoleService tUserRoleService;
    
    @Autowired
    TRoleService tRoleService;
    
    @RequestMapping("/user")
    public String toAssignRolePage(Model model,@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,@RequestParam(value="pageSize",defaultValue="5")Integer pageSize){
        PageHelper.startPage(pageNum, pageSize);
        List<TUsers> list =tUserService.list();
        PageInfo<TUsers> pageInfo = new PageInfo<>(list, 5);
        model.addAttribute("list", list);
        model.addAttribute("pageInfo", pageInfo);
        return "manager/permission/user";
    }
    
    
    @RequestMapping("/assignRole")
    public void assignRole(@RequestParam("uid")Integer uid,HttpServletResponse response) {
        List<TRole> assignRole =tRoleService.getUserRole(uid);
        System.out.println(assignRole);
        List<TRole> allRoles=tRoleService.getRole();
        List<TRole> unRole = new ArrayList<>();
        
        List<Integer> temp = new ArrayList<Integer>();
        for (TRole tRole : assignRole) {
            temp.add(tRole.getId());
        }
        
        for (TRole tRole : allRoles) {
            if(!temp.contains(tRole.getId())){
                unRole.add(tRole);
            }
        }
        System.out.println("-----"+unRole);
        Map<String, List<TRole>> map = new HashMap<String, List<TRole>>();
        map.put("assignRole", assignRole);
        map.put("unRole", unRole);
        
        JSONObject json = JSONObject.fromObject(map);  
        try {
            response.getWriter().print(json.toString());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    @ResponseBody
    @RequestMapping("/saveAssignRole")
    public String saveAssignRole(@RequestParam("uid")Integer uid,@RequestParam("rids")String rids){
        tUserRoleService.del(uid);
        
        tUserRoleService.add(uid,rids);
        
        return null;
    }
    
    @ResponseBody
    @RequestMapping("/toUpdate")
    public TUsers toUpdate(@RequestParam("uid")Integer uid){
        
        return tUserService.getUser(uid);
    }
    
    @ResponseBody
    @RequestMapping("/saveUser")
    public String saveUser(@RequestParam("uid")Integer uid,@RequestParam("userStr")String userStr){
        JSONObject jsonObject=JSONObject.fromObject(userStr);
        TUsers user=(TUsers)JSONObject.toBean(jsonObject, TUsers.class);
        int i = tUserService.update(uid,user);
        if(i==1){
            return null;
        }else{
            return "保存失败";
        }
        
    }
    
    @ResponseBody
    @RequestMapping("/del")
    public String del(@RequestParam("uid")Integer uid){ 
        tUserService.del(uid);
        return null;     
    }
    
}

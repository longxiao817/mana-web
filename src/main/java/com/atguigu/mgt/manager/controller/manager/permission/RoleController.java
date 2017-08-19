package com.atguigu.mgt.manager.controller.manager.permission;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.mgt.manager.bean.TPermission;
import com.atguigu.mgt.manager.bean.TRole;
import com.atguigu.mgt.manager.bean.TRolePermission;
import com.atguigu.mgt.manager.bean.TUsers;
import com.atguigu.mgt.manager.service.xktservice.TPermissionService;
import com.atguigu.mgt.manager.service.xktservice.TRolePermissionService;
import com.atguigu.mgt.manager.service.xktservice.TRoleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/permission/role")
public class RoleController {
    @Autowired
    TRoleService tRoleService;
    
    @Autowired
    TPermissionService tPermissionService;
    
    @Autowired
    TRolePermissionService tRolePermissionService;
    
    @RequestMapping("/role")
    public String list(Model model,@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,@RequestParam(value="pageSize",defaultValue="5")Integer pageSize){
        PageHelper.startPage(pageNum, pageSize);
        List<TRole> list =tRoleService.list();
        PageInfo<TRole> pageInfo = new PageInfo<>(list, 5);
        model.addAttribute("list", list);
        model.addAttribute("pageInfo", pageInfo);
        return "manager/permission/role";
    }
    
    @ResponseBody
    @RequestMapping("/json")
    public List<TPermission> json(){
        return tPermissionService.list();    
    }
    
    @ResponseBody
    @RequestMapping("/perm")
    public List<TPermission> perm(@RequestParam("rid")Integer rid){
        return tPermissionService.getRolePermisson(rid);
    }
    
    @ResponseBody
    @RequestMapping("/update")
    public String update(@RequestParam("pids")String pids,@RequestParam("rid")Integer rid){
        tRolePermissionService.update(pids,rid);
        return null;
    }
    
    @ResponseBody
    @RequestMapping("/toUpdate")
    public TRole toUpdate(@RequestParam("rid")Integer rid){
        
        return tRoleService.singleRole(rid);
    }
    
    @ResponseBody
    @RequestMapping("/saveRole")
    public String saveRole(@RequestParam("rid")Integer rid,@RequestParam("roleStr")String roleStr){
        JSONObject jsonObject=JSONObject.fromObject(roleStr);
        TRole role=(TRole)JSONObject.toBean(jsonObject, TRole.class);
        int i = tRoleService.updateRole(rid,role);
        if(i==1){
            return null;
        }else{
            return "保存失败";
        }
        
    }
    
    @ResponseBody
    @RequestMapping("/del")
    public String del(@RequestParam("rid")Integer rid){ 
        tRoleService.del(rid);
        return null;     
    }
}

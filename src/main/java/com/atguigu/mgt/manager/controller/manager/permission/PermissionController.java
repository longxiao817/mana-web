package com.atguigu.mgt.manager.controller.manager.permission;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.mgt.manager.bean.TPermission;
import com.atguigu.mgt.manager.bean.TRole;
import com.atguigu.mgt.manager.service.xktservice.TPermissionService;

@Controller
@RequestMapping("/permission/permission")
public class PermissionController {
    @Autowired
    TPermissionService tPermissionService;
    
    @RequestMapping("/json")
    @ResponseBody
    public List<TPermission> json(){
        return tPermissionService.list();
    }
    
    @RequestMapping("/list")
    public String list(){
        return "manager/permission/permission";
    }
    
    @ResponseBody
    @RequestMapping("/toUpdate")
    public TPermission toUpdate(@RequestParam("perName")String perName){
        return tPermissionService.getPermission(perName);
    }
    
    @ResponseBody
    @RequestMapping("/savePermission")
    public String savePermission(@RequestParam("perid")Integer perid,@RequestParam("permissionStr")String permissionStr){
        JSONObject jsonObject=JSONObject.fromObject(permissionStr);
        TPermission tPermission=(TPermission)JSONObject.toBean(jsonObject, TPermission.class);
        int i=tPermissionService.update(perid,tPermission);
        if(i!=1){
            return "错误";
        }else{
            return null;
        }
        
    }
    
    @ResponseBody
    @RequestMapping("/del")
    public String del(@RequestParam("perName")String perName){
        tPermissionService.delete(perName);
        return null;
    }
     
}

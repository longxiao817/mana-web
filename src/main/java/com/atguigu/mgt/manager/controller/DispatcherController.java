package com.atguigu.mgt.manager.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.mgt.manager.bean.TPermission;
import com.atguigu.mgt.manager.service.xktservice.TPermissionService;

@Controller

public class DispatcherController {
    @Autowired
    TPermissionService tPermissionService;
    
    @RequestMapping(value="/main.html")
    public String toMainPage(HttpSession session){
        List<TPermission> menu =tPermissionService.getMenu();
        if(menu!=null){
            session.setAttribute("menu", menu);
        }
        
        return "main";
    }
}

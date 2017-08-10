package com.atguigu.mgt.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class DispatcherController {
    
    
    @RequestMapping(value="/main.html")
    public String toMainPage(){
        
        return "main";
    }
}

package com.atguigu.mgt.manager.controller.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.atguigu.mgt.manager.bean.TReply;
import com.atguigu.mgt.manager.service.zqhservice.MessageService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.source.tree.Tree;

@RequestMapping("/manager/message")
@Controller
public class MessageController {
    
    @Autowired
    MessageService messageService;
    
    
    
    
    @RequestMapping("/delete")
    public String deleteReply(@RequestParam("id")Integer id ) throws Exception{
        boolean flag = messageService.delete(id);
        
        return "forward:/manager/message/list";
        
    }
    
    
    @RequestMapping("/list")
    public String getAllByCondition(@RequestParam(value="pn",defaultValue="1")Integer pn,
            @RequestParam(value="ps",defaultValue="5")Integer ps,Model model,
            @RequestParam(value="sp",defaultValue="",required=false)String searchCondition,
            @RequestParam(value="status",defaultValue="",required=false)String status){
        System.out.println("接收到的参数"+ searchCondition);
        System.out.println("接收到的参数"+ status);
        PageHelper.startPage(pn, ps);
        List<TReply> replys = messageService.getAllReply(searchCondition,status);
        PageInfo<TReply> pageInfo = new PageInfo<>(replys, 5);
        model.addAttribute("reply_info", pageInfo);
        model.addAttribute("searchCondition", searchCondition);
        return "manager/serviceman/message";
    }
    
}

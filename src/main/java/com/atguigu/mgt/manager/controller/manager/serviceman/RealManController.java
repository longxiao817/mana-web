package com.atguigu.mgt.manager.controller.manager.serviceman;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.mgt.manager.bean.TUsers;
import com.atguigu.mgt.manager.service.xktservice.RealManService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/serviceman/realname")
public class RealManController {
    @Autowired
    RealManService realManService;
    
    @RequestMapping("/list")
    public String toRealman(Model model,@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,@RequestParam(value="pageSize",defaultValue="5")Integer pageSize){
        PageHelper.startPage(pageNum, pageSize);
        List<TUsers> list =realManService.list();
        PageInfo<TUsers> pageInfo = new PageInfo<>(list, 5);
        model.addAttribute("list", list);
        model.addAttribute("pageInfo", pageInfo);
        return "manager/serviceman/realname";
    }
    
    @ResponseBody
    @RequestMapping("/toUpdate")
    public TUsers toUpdate(@RequestParam("uid")Integer uid){
        
        return realManService.getUser(uid);
    }
    
    @ResponseBody
    @RequestMapping("/saveUser")
    public String saveUser(@RequestParam("uid")Integer uid,@RequestParam("userStr")String userStr){
        JSONObject jsonObject=JSONObject.fromObject(userStr);
        TUsers user=(TUsers)JSONObject.toBean(jsonObject, TUsers.class);
        int i = realManService.update(uid,user);
        if(i==1){
            return null;
        }else{
            return "保存失败";
        }
        
    }
}

package com.atguigu.mgt.manager.controller.manager;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.mgt.manager.bean.TGames;
import com.atguigu.mgt.manager.bean.TGamesExample;
import com.atguigu.mgt.manager.bean.TGamesExample.Criteria;
import com.atguigu.mgt.manager.service.zqhservice.gameService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RequestMapping("/manager/game")
@Controller
public class GameController {
   
    @Autowired
    gameService gameService;
    
    
    
    @ResponseBody
    @RequestMapping("/getGame")
    public TGames getGame(@RequestParam("id")Integer id,Model model){
        System.out.println("ajax查询游戏");
        TGames game = gameService.getGame(id);
        System.out.println(game.toString());
        model.addAttribute("game_info",game);
        return game;
    }
    
    //public String 
    
    @ResponseBody
    @RequestMapping("/updateStatus")
    public String updateStatus(@RequestParam("id")Integer id,@RequestParam("status")String status,Model model){
        
        System.out.println("接收到的状态是：" + status);
        boolean flag = gameService.changeStatus(id,status);
        boolean flag2 = gameService.checkStatus(id);
        System.out.println(flag2);
        if(flag2){
           model.addAttribute("gameStatus", "审核通过");
        }else{
            model.addAttribute("gameStatus", "审核不通过");
        }
        return "manager/serviceman/game";
    }
    

    // 返回所有广告的json数据
    @ResponseBody
    @RequestMapping("/json")
    public PageInfo<TGames> getGaJson(@RequestParam(value="pn",defaultValue="1")Integer pn,@RequestParam(value="sp",required=false,defaultValue="")String searchCondition ){
        
        TGamesExample example = new TGamesExample();
        Criteria criteria = example.createCriteria();
        criteria.andNameLike("%"+searchCondition+"%");
        PageHelper.startPage(pn,3);
        List< TGames> games = gameService.getAll(example);
        PageInfo<TGames> info = new PageInfo<>(games,3);
        System.out.println("ajax方式刷新list页面");
        
        return info;
    }

    
    @RequestMapping("/list")
    public String list() {
       
        return "manager/serviceman/game";
        
    }
    
    
   
    /**
     * 游戏删除
     * @Description (TODO这里用一句话描述这个方法的作用)
     * @param id
     * @return
     */
     
    @RequestMapping("/delete")
    public String gameDelete(@RequestParam(value="id",defaultValue="")Integer id){
        
        
        gameService.gameDelete(id);
        
        return "redirect:/manager/game/list";
    }
    
   
    
}

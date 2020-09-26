package com.huguigu.controller;


import com.huguigu.service.UserInfoService;
import com.huguigu.vo.PageVo;
import com.huguigu.vo.User;
import com.huguigu.vo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserInfoAction {
    @Autowired
    UserInfoService userInfoService;
    @RequestMapping( value ="/qurryUser.action",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public List<UserInfo> qurryUser(UserInfo userInfo){
        System.out.println(userInfo);
        return userInfoService.qurryUser();

    }
    @RequestMapping( value ="/qurryUser22.action")
    @ResponseBody
    public PageVo<UserInfo> qurryUser22(String name,
                                       @RequestParam(value = "page",defaultValue = "1")int page,
                                       @RequestParam(value = "rows",defaultValue = "3")int rows){
        System.out.println(page);
        System.out.println(rows);
        System.out.println(name);
        PageVo<UserInfo> userInfoPageVo = userInfoService.qurryUserbyCond(page, rows);
        System.out.println(userInfoPageVo.getRows());
        return userInfoPageVo;

    }
    @RequestMapping( value ="/addUserInfo.action",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String addUserInfo(UserInfo userInfo){

        int i = userInfoService.addUserInfo(userInfo);
        if (i>0) {
            return "添加成功";
        }
        return "添加失败";
    }
    @RequestMapping("/deleUserInfo.action")
    @ResponseBody
    public Map deleUserInfo(String ids){

        Map<String,String> map =new HashMap<String,String>();
        int i = userInfoService.deleUserInfo(ids);
        if (i > 0) {
            map.put("msg","删除成功");
        }else {
            map.put("msg","删除失败");
        }
        return map;
    }
    @RequestMapping( value ="/updateUserInfo.action",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String updateUserInfo(UserInfo userInfo){

        int i = userInfoService.updateUserInfo(userInfo);
        if (i>0) {
            return "编辑成功";
        }
        return "编辑失败";
    }
}

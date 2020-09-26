package com.huguigu.service;

import com.huguigu.vo.PageVo;
import com.huguigu.vo.UserInfo;

import java.util.List;

public interface UserInfoService {
    public List<UserInfo> qurryUser();
    public PageVo<UserInfo> qurryUserbyCond(int page, int rows);
    public int addUserInfo(UserInfo userInfo);
    public int deleUserInfo(String ids);
    public int updateUserInfo(UserInfo userInfo);
}

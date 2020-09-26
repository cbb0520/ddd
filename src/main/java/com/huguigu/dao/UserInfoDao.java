package com.huguigu.dao;


import com.huguigu.vo.PageVo;
import com.huguigu.vo.User;
import com.huguigu.vo.UserInfo;

import java.util.List;

public interface UserInfoDao {
    public List<UserInfo> qurryUser();
    public int qurryUsercont();
    public int addUserInfo(UserInfo userInfo);
    public int deleUserInfo(int[] id);
    public int updateUserInfo(UserInfo userInfo);
}

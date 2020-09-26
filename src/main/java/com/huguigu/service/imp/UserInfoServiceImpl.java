package com.huguigu.service.imp;

import com.github.pagehelper.PageHelper;
import com.huguigu.dao.UserInfoDao;
import com.huguigu.service.UserInfoService;
import com.huguigu.vo.PageVo;
import com.huguigu.vo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserInfoServiceImpl implements UserInfoService {
    @Autowired
    UserInfoDao userInfoDao;
    @Override
    public PageVo<UserInfo> qurryUserbyCond(int page, int rows) {
        PageVo<UserInfo> pageVo = new PageVo<>();
        PageHelper.startPage(page,rows);
        pageVo.setRows(userInfoDao.qurryUser());
        pageVo.setTotal(userInfoDao.qurryUsercont());
        return pageVo;
    }

    @Override
    public int addUserInfo(UserInfo userInfo) {
        return userInfoDao.addUserInfo(userInfo);
    }

    @Override
    public int deleUserInfo(String ids) {
        String[] arr = ids.split(",");
        int[] ints = new int[arr.length];

        for(int i=0;i<arr.length;i++){

            ints[i] = Integer.parseInt(arr[i]);

        }

        return userInfoDao.deleUserInfo(ints);
    }

    @Override
    public int updateUserInfo(UserInfo userInfo) {
        return userInfoDao.updateUserInfo(userInfo);
    }

    @Override
    public List<UserInfo> qurryUser() {
        return userInfoDao.qurryUser();
    }


}

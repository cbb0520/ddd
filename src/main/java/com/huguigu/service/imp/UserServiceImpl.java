package com.huguigu.service.imp;

import com.huguigu.dao.UserDao;
import com.huguigu.service.UserService;
import com.huguigu.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    @Override
    public User userlongin(User user) {
        return userDao.userlongin(user);
    }

    @Override
    public int adduser(User user) {
        return userDao.adduser(user);
    }

    @Override
    public List<User> queryuser() {
        return userDao.queryuser();
    }
}

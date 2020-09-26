package com.huguigu.dao;

import com.huguigu.vo.User;

import java.util.List;

public interface UserDao {
    public User userlongin(User user);
    public List<User> queryuser();
    public int adduser(User user);
}

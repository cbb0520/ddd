package com.huguigu.service;

import com.huguigu.vo.User;

import java.util.List;

public interface UserService {
    public User userlongin(User suer);
    public int adduser(User user);
    public List<User> queryuser();
}

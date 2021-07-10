package com.haley.demo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haley.demo.dao.UserDao;
import com.haley.demo.entity.UserEntity;
import com.haley.demo.service.UserService;
import org.springframework.stereotype.Service;

/**
 * @program: demo
 * @description: 用户ServiceImpl
 * @author: haley
 * @create: 2021-07-09 19:11
 **/
@Service
public class UserServiceImpl extends ServiceImpl<UserDao, UserEntity> implements UserService{

    @Override
    public UserEntity queryById(String id) {
        return this.getById(id);
    }
}

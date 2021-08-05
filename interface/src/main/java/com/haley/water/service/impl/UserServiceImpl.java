package com.haley.water.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haley.water.entity.User;
import com.haley.water.mapper.UserMapper;
import com.haley.water.service.IUserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/4 20:37
 **/
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserServiceImpl {

    @Autowired
    UserMapper userMapper;

    /**
     * 根据phone查找用户信息
     * @param phone
     * @return
     */
    @Override
    public User queryByPhone(String phone) {
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq("phone",phone);
        return userMapper.selectOne(wrapper);
    }
}

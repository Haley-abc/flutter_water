package com.haley.demo.service;

import com.haley.demo.entity.UserEntity;

/**
 * @program: demo
 * @description: 用户Service
 * @author: haley
 * @create: 2021-07-09 19:09
 **/
public interface UserService {
    /**
     * @param id
     * @return 用户信息
     * @description: 根据id查找用户信息
     */
    UserEntity queryById(String id);
}

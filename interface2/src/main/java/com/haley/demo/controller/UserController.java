package com.haley.demo.controller;

import com.haley.demo.entity.UserEntity;
import com.haley.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: demo
 * @description: 用户控制层
 * @author: haley
 * @create: 2021-07-09 19:14
 **/
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * @param id
     * @return 用户信息
     */
    @GetMapping("/queryById")
    public UserEntity queryById(String id){
        return userService.queryById(id);
    }
}

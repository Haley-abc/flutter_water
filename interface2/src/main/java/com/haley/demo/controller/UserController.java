package com.haley.demo.controller;

import com.haley.demo.entity.UserEntity;
import com.haley.demo.service.UserService;
import com.haley.demo.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    public UserEntity queryById(int id){
        return userService.queryById(id);
    }

    @GetMapping("/queryByPhone")
    public UserEntity queryByPhone(String phone){
        return userService.queryByPhone(phone);
    }

    @PostMapping("/saveOne")
    public Result saveone(@RequestBody UserEntity userEntity){
        userService.save(userEntity);
        return Result.ok("保存成功");
    }
}

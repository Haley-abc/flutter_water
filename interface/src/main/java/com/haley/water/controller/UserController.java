package com.haley.water.controller;

import com.haley.water.dto.LoginDto;
import com.haley.water.entity.User;
import com.haley.water.service.IUserServiceImpl;
import com.haley.water.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/4 20:07
 **/
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserServiceImpl iUserService;

    @PostMapping("/login")
    public Result login(@Validated @RequestBody LoginDto loginDto) {

        User user = iUserService.queryByPhone(loginDto.getPhone());
        if (user == null) {
            return Result.error("用户不存在");
        }
        if(!user.getPassword().equals(loginDto.getPassword())){
            return Result.error("密码错误");
        }
        if(user.getPassword().equals(loginDto.getPassword())){
            return Result.ok(user,"密码正确");
        }
        return Result.ok("登录失败");
    }

    @PostMapping("/registe")
    public Result registe(@Validated @RequestBody User user){
        User user2 = iUserService.queryByPhone(user.getPhone());
        boolean result=false;
        if (user2 != null) {
            return Result.error("用户已存在");
        }else{
            result=iUserService.save(user);
        }
        if(result==false){
            return Result.error("注册失败");
        }else{
            return Result.ok("注册成功");
        }
    }

}

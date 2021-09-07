package com.haley.water.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haley.water.entity.User;

public interface IUserServiceImpl extends IService<User> {
    /**
     * 根据phone查找用户信息
     * @param phone
     * @return
     */
    User queryByPhone(String phone);

    boolean add(User user);
}

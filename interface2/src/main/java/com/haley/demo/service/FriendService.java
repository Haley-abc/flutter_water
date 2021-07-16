package com.haley.demo.service;

import com.haley.demo.entity.UserEntity;

import java.util.List;

/**
 * @description: 好友Service
 * @author: haley
 * @create: 2021-07-16 11:26
 **/
public interface FriendService {
    /**
     * @param id
     * @return 用户信息
     * @description: 根据id查找用户信息
     */
    List<UserEntity> queryFriends(int id);

}

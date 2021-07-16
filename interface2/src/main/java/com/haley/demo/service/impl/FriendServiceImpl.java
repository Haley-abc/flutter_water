package com.haley.demo.service.impl;

import com.haley.demo.dao.FriendDao;
import com.haley.demo.entity.FriendEntity;
import com.haley.demo.entity.UserEntity;
import com.haley.demo.service.FriendService;
import com.haley.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @description: 好友ServiceImpl
 * @author: haley
 * @create: 2021-07-16 11:28
 **/
@Service
public class FriendServiceImpl implements FriendService {

    @Autowired
    private FriendDao friendDao;

    @Autowired
    private UserService userService;

    @Override
    public List<UserEntity> queryFriends(int id) {
        List<Integer> ids=friendDao.queryFriendId(id);
        List<UserEntity> friends=userService.queryFriends(ids);
        return friends;
    }
}

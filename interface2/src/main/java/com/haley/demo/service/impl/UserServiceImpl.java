package com.haley.demo.service.impl;

import com.haley.demo.dao.UserDao;
import com.haley.demo.entity.UserEntity;
import com.haley.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @program: demo
 * @description: 用户ServiceImpl
 * @author: haley
 * @create: 2021-07-09 19:11
 **/
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    @Override
    public UserEntity queryById(int id) {
        UserEntity userEntity=userDao.queryById(id);
        return userEntity;
    }

    @Override
    public void save(UserEntity userEntity) {
        userDao.save(userEntity);
    }

    @Override
    public UserEntity queryByPhone(String phone) {
        return userDao.queryByPhone(phone);
    }

    @Override
    public List<UserEntity> queryFriends(List<Integer> friendIds) {
        List<UserEntity> friendList=new ArrayList<UserEntity>();
        for(int i=0;i<friendIds.size();i++){
            friendList.add(userDao.queryById(friendIds.get(i)));
        }
        return friendList;
    }
}

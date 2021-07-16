package com.haley.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: demo
 * @description: 好友dao
 * @author: haley
 * @create: 2021-07-16 11:07
 **/
@Mapper
public interface FriendDao {

    List<Integer> queryFriendId(int id);

}

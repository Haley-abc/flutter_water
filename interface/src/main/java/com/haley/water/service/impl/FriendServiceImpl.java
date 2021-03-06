package com.haley.water.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haley.water.dto.FriendDto;
import com.haley.water.dto.SearchFriendDto;
import com.haley.water.entity.Friend;
import com.haley.water.entity.User;
import com.haley.water.mapper.AddFriendMapper;
import com.haley.water.mapper.FriendMapper;
import com.haley.water.service.IFriendServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/4 20:37
 **/
@Service
public class FriendServiceImpl extends ServiceImpl<FriendMapper, Friend> implements IFriendServiceImpl {

    @Autowired
    FriendMapper friendMapper;

    @Autowired
    AddFriendMapper addFriendMapper;

    /**
     * 根据用户id查找好友列表
     * @param userId
     * @return
     */
    @Override
    public List<FriendDto> selectFriendList(int userId) {
        List<FriendDto> friendDtoList = friendMapper.selectFriendList(userId);
        return friendDtoList;
    }

    @Override
    public FriendDto searchUser(String phone) {
        return friendMapper.searchUser(phone);
    }

    @Override
    public Friend searchFriend(SearchFriendDto searchFriendDto) {
        return friendMapper.searchFriend(searchFriendDto);
    }

    @Override
    public boolean addFriend(Friend friend) {
        return this.save(friend);
    }
}

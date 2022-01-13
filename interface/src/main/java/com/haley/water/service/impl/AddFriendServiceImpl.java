package com.haley.water.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haley.water.dto.AddFriendDto;
import com.haley.water.dto.SearchFriendDto;
import com.haley.water.entity.AddFriend;
import com.haley.water.mapper.AddFriendMapper;
import com.haley.water.service.IAddFriendServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/4 20:37
 **/
@Service
public class AddFriendServiceImpl extends ServiceImpl<AddFriendMapper, AddFriend> implements IAddFriendServiceImpl {

    @Autowired
    AddFriendMapper addFriendMapper;

    @Override
    public boolean addFriend(AddFriend addFriend) {
        return this.save(addFriend);
    }

    @Override
    public List<AddFriendDto> getAddFriendList(int userId) {
        return addFriendMapper.getAddFriendList(userId);
    }

    @Override
    public AddFriend getAddFriend(SearchFriendDto searchFriendDto) {
        return addFriendMapper.getAddFriend(searchFriendDto);
    }

    @Override
    public void updateState(int userId, int friendId, int state) {
        UpdateWrapper<AddFriend> updateWrapper = new UpdateWrapper<>();
        updateWrapper.and(wq -> wq
                .eq("user_id", userId)
                .eq("friend_id", friendId));
        AddFriend addFriend = new AddFriend();
        addFriend.setState(state);
        addFriendMapper.update(addFriend,updateWrapper);
    }

    @Override
    public int getState(int userId, int friendId) {
        QueryWrapper<AddFriend> wrapper = new QueryWrapper<>();
        wrapper.and(wq -> wq
                .eq("user_id", userId)
                .eq("friend_id", friendId));
        return addFriendMapper.selectOne(wrapper).getState();
    }
}

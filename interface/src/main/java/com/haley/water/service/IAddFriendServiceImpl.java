package com.haley.water.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haley.water.dto.AddFriendDto;
import com.haley.water.dto.SearchFriendDto;
import com.haley.water.entity.AddFriend;

import java.util.List;

public interface IAddFriendServiceImpl extends IService<AddFriend> {

    boolean addFriend(AddFriend addFriend);

    List<AddFriendDto> getAddFriendList(int userId);

    AddFriend getAddFriend(SearchFriendDto searchFriendDto);

    void updateState(int userId,int friendId,int state);

    int getState(int userId,int friendId);
}

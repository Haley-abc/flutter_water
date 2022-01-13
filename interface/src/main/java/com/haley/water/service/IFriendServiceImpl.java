package com.haley.water.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haley.water.dto.FriendDto;
import com.haley.water.dto.SearchFriendDto;
import com.haley.water.entity.Friend;
import com.haley.water.entity.User;

import java.util.List;

public interface IFriendServiceImpl extends IService<Friend> {
    /**
     * 根据用户id查找好友列表
     * @param userId
     * @return
     */
    List<FriendDto> selectFriendList(int userId);

    FriendDto searchUser(String phone);

    Friend searchFriend(SearchFriendDto searchFriendDto);

    boolean addFriend(Friend friend);
}

package com.haley.water.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haley.water.dto.FriendDto;
import com.haley.water.entity.Friend;
import com.haley.water.entity.User;

import java.util.List;

public interface IFriendServiceImpl extends IService<Friend> {
    /**
     * 根据用户id查找好友列表
     * @param userId
     * @return
     */
    List<FriendDto> selectFriend(int userId);

    FriendDto searchFriend(String phone);
}

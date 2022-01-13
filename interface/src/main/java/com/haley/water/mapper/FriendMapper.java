package com.haley.water.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haley.water.dto.FriendDto;
import com.haley.water.dto.SearchFriendDto;
import com.haley.water.entity.Friend;
import com.haley.water.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FriendMapper extends BaseMapper<Friend> {
    /**
     * 根据用户id查找好友列表
     * @param userId
     * @return
     */
    List<FriendDto> selectFriendList(int userId);

    FriendDto searchUser(String phone);

    Friend searchFriend(SearchFriendDto searchFriendDto);
}

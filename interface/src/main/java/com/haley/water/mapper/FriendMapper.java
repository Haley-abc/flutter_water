package com.haley.water.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haley.water.dto.FriendDto;
import com.haley.water.entity.Friend;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FriendMapper extends BaseMapper<Friend> {
    /**
     * 根据用户id查找好友列表
     * @param userId
     * @return
     */
    List<FriendDto> selectFriend(int userId);
}

package com.haley.water.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haley.water.dto.FriendDto;
import com.haley.water.entity.Friend;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FriendMapper extends BaseMapper<Friend> {
    List<FriendDto> selectFriend(int userId);
}

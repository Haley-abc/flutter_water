package com.haley.water.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haley.water.dto.AddFriendDto;
import com.haley.water.dto.SearchFriendDto;
import com.haley.water.entity.AddFriend;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AddFriendMapper extends BaseMapper<AddFriend> {
    List<AddFriendDto> getAddFriendList(int userId);

    AddFriend getAddFriend(SearchFriendDto searchFriendDto);
}

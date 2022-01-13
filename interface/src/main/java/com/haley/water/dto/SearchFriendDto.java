package com.haley.water.dto;

import lombok.Data;

/**
 * @description:
 * @author: haley
 * @create: 2022/1/12 10:46
 **/
@Data
public class SearchFriendDto {
    /**
     * 用户id
     */
    private Integer userId;
    /**
     * 好友id
     */
    private Integer friendId;
}

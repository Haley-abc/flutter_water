package com.haley.water.dto;

import lombok.Data;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/10 14:59
 **/
@Data
public class AddFriendDto {
    /**
     * 好友id
     */
    private Integer id;
    /**
     * 好友名字
     */
    private String name;
    /**
     * 好友头像
     */
    private String head;
    /**
     * 好友状态
     */
    private Integer state;
}

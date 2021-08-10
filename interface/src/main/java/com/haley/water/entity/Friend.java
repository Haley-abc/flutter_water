package com.haley.water.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/10 14:52
 **/
@Data
@Accessors(chain = true)
@TableName("friend")
public class Friend {
    /**
     * 字段id
     */
    private Integer id;
    /**
     * 用户id
     */
    private Integer userId;
    /**
     * 好友id
     */
    private Integer friendId;
}

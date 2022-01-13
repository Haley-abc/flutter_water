package com.haley.water.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @description:
 * @author: haley
 * @create: 2022/1/12 16:06
 **/
@Data
@Accessors(chain = true)
@TableName("add_friend")
public class AddFriend {
    /**
     * 字段id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 用户id
     */
    private Integer userId;
    /**
     * 好友id
     */
    private Integer friendId;
    /**
     * 好友状态
     */
    private Integer state;

}

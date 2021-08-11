package com.haley.water.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/4 20:16
 **/
@Data
@Accessors(chain = true)
@TableName("user")
public class User {
    /**
     * 用户id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 用户姓名
     */
    private String name;
    /**
     * 用户手机号
     */
    private String phone;
    /**
     * 用户密码
     */
    private String password;
    /**
     * 用户性别
     */
    private String sex;
    /**
     * 用户头像
     */
    private String head;
}

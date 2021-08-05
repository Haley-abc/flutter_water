package com.haley.demo.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @description:
 * @author: haley
 * @create: 2021/7/16 11:01
 **/
@Data
@Accessors(chain = true)
@TableName("friend")
public class FriendEntity {
    /**
     * 用户id
     */
    private int id;
    /**
     * 用户信息
     */
    private UserEntity userEntity;
    /**
     * 好友列表
     */
    private UserEntity friendList;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    public UserEntity getFriendList() {
        return friendList;
    }

    public void setFriendList(UserEntity friendList) {
        this.friendList = friendList;
    }
}

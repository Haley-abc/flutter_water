package com.haley.demo.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.sql.Date;

/**
 * @description:
 * @author: haley
 * @create: 2021/7/16 16:48
 **/
@Data
@Accessors(chain = true)
@TableName("article")
public class ArticleEntity {
    /**
     * 文章id
     */
    private int id;
    /**
     * 对应用户信息
     */
    private UserEntity userEntity;
    /**
     * 文章内容
     */
    private String content;
    /**
     * 文章创建时间
     */
    private Date atricleDate;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAtricleDate() {
        return atricleDate;
    }

    public void setAtricleDate(Date atricleDate) {
        this.atricleDate = atricleDate;
    }
}

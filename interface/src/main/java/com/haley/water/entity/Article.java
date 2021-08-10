package com.haley.water.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/10 20:09
 **/
@Data
@Accessors(chain = true)
@TableName("article")
public class Article {
    /**
     * 文章id
     */
    private Integer id;
    /**
     * 对应用户id
     */
    private Integer userId;
    /**
     * 文章内容
     */
    private String content;
    /**
     * 文章发表时间
     */
    private Date articleDate;
    /**
     * 照片
     */
    private String image;
}

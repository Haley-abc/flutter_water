package com.haley.water.dto;

import lombok.Data;

import java.util.Date;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/10 20:14
 **/
@Data
public class ArticleDto {

    /**
     * 文章id
     */
    private Integer id;

    /**
     * 发表者id
     */
    private Integer userId;

    /**
     *发表者名字
     */
    private String name;

    /**
     *发表者头像
     */
    private String head;

    /**
     *文章内容
     */
    private String content;

    /**
     *发表时间
     */
    private Date articleDate;

    /**
     *文章图片
     */
    private String image;
}

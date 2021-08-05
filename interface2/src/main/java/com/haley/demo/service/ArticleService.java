package com.haley.demo.service;

import com.haley.demo.entity.ArticleEntity;
import com.haley.demo.entity.UserEntity;

import java.util.List;

/**
 * @description: 文章Service
 * @author: haley
 * @create: 2021-07-16 17:02
 **/
public interface ArticleService {
    /**
     * @return 文章信息
     * @description: 返回全部文章
     */
    List<ArticleEntity> queryArticles();

    void save(ArticleEntity articleEntity);

}

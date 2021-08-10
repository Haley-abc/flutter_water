package com.haley.water.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haley.water.dto.ArticleDto;
import com.haley.water.entity.Article;

import java.util.List;

public interface IArticleServiceImpl extends IService<Article> {

    /**
     * 查找所有文章
     * @return
     */
    List<ArticleDto> selectAllArticle();
}

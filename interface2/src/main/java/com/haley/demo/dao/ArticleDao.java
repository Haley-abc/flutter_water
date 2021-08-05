package com.haley.demo.dao;

import com.haley.demo.entity.ArticleEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ArticleDao {
    List<ArticleEntity> queryArticles();

    int save(ArticleEntity articleEntity);
}

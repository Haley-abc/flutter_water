package com.haley.water.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haley.water.dto.ArticleDto;
import com.haley.water.entity.Article;
import com.haley.water.mapper.ArticleMapper;
import com.haley.water.service.IArticleServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/10 20:31
 **/
@Service
public class AricleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements IArticleServiceImpl {

    @Autowired
    ArticleMapper articleMapper;

    @Override
    public List<ArticleDto> selectAllArticle() {
        List<ArticleDto> articleDtoList = articleMapper.selectAllArticle();
        return articleDtoList;
    }
}

package com.haley.demo.service.impl;

import com.haley.demo.dao.ArticleDao;
import com.haley.demo.entity.ArticleEntity;
import com.haley.demo.service.ArticleService;
import com.haley.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: haley
 * @create: 2021/7/16 17:03
 **/
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;

    @Autowired
    private UserService userService;

    @Override
    public List<ArticleEntity> queryArticles() {
        List<ArticleEntity> articles=articleDao.queryArticles();
        for(int i=0;i<articles.size();i++){
            articles.get(i).setUserEntity(userService.queryById(articles.get(i).getUserEntity().getId()));
        }
        return articles;
    }

    @Override
    public void save(ArticleEntity articleEntity) {
        articleDao.save(articleEntity);
    }
}

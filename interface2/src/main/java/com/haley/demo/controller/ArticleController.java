package com.haley.demo.controller;

import com.haley.demo.entity.ArticleEntity;
import com.haley.demo.entity.UserEntity;
import com.haley.demo.service.ArticleService;
import com.haley.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @description:
 * @author: haley
 * @create: 2021/7/16 16:51
 **/
@RestController
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @GetMapping("/queryArticles")
    public List<ArticleEntity> queryArticles(){
        return articleService.queryArticles();
    }

}

package com.haley.demo.controller;

import com.haley.demo.entity.ArticleEntity;
import com.haley.demo.entity.UserEntity;
import com.haley.demo.service.ArticleService;
import com.haley.demo.service.UserService;
import com.haley.demo.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/saveOne")
    public Result saveone(@RequestBody ArticleEntity articleEntity){
        articleService.save(articleEntity);
        return Result.ok("保存成功");
    }

}

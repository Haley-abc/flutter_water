package com.haley.water.controller;

import com.haley.water.dto.ArticleDto;
import com.haley.water.service.IArticleServiceImpl;
import com.haley.water.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/4 20:07
 **/
@RestController
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private IArticleServiceImpl iArticleService;

    @GetMapping("/selectAllArticle")
    public Result selectAllArticle() {
        List<ArticleDto> articleDtoList = iArticleService.selectAllArticle();
        return Result.ok(articleDtoList);
    }
}

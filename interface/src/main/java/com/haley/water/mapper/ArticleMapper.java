package com.haley.water.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haley.water.dto.ArticleDto;
import com.haley.water.entity.Article;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ArticleMapper extends BaseMapper<Article> {

    /**
     * 查找所有文章
     * @return
     */
    List<ArticleDto> selectAllArticle();
}

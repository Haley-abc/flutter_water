package com.haley.water.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haley.water.dto.ArticleDto;
import com.haley.water.dto.DailyDto;
import com.haley.water.dto.RankingListDto;
import com.haley.water.entity.WaterConsumption;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface WaterConsumptionMapper extends BaseMapper<WaterConsumption> {

    /**
     * 日榜
     * @param dailyDto
     * @return
     */
    List<RankingListDto> dailyList(DailyDto dailyDto);
}

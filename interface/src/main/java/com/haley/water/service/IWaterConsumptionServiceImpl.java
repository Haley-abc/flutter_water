package com.haley.water.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haley.water.dto.DailyDto;
import com.haley.water.dto.RankingListDto;
import com.haley.water.entity.WaterConsumption;

import java.util.Date;
import java.util.List;

public interface IWaterConsumptionServiceImpl extends IService<WaterConsumption> {

    /**
     * 日榜
     * @param dailyDto
     * @return
     */
    List<RankingListDto> dailyList(DailyDto dailyDto);
}

package com.haley.water.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haley.water.dto.DailyDto;
import com.haley.water.dto.RankingListDto;
import com.haley.water.entity.WaterConsumption;
import com.haley.water.mapper.WaterConsumptionMapper;
import com.haley.water.service.IWaterConsumptionServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/10 20:31
 **/
@Service
public class WaterConsumptionServiceImpl extends ServiceImpl<WaterConsumptionMapper, WaterConsumption> implements IWaterConsumptionServiceImpl {

    @Autowired
    WaterConsumptionMapper waterConsumptionMapper;

    @Override
    public List<RankingListDto> dailyList(DailyDto dailyDto) {
        return waterConsumptionMapper.dailyList(dailyDto);
    }
}

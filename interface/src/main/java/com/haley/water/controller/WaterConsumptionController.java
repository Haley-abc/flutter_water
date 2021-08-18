package com.haley.water.controller;

import com.haley.water.dto.DailyDto;
import com.haley.water.dto.RankingListDto;
import com.haley.water.service.IWaterConsumptionServiceImpl;
import com.haley.water.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/4 20:07
 **/
@RestController
@RequestMapping("/waterConsumption")
public class WaterConsumptionController {

    @Autowired
    private IWaterConsumptionServiceImpl iWaterConsumptionService;

    @PostMapping("/dailyList")
    public Result dailyList(@Validated @RequestBody DailyDto dailyDto) {
        List<RankingListDto> rankingListDtos = iWaterConsumptionService.dailyList(dailyDto);
        return Result.ok(rankingListDtos);
    }
}

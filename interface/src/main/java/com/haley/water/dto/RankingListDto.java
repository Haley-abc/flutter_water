package com.haley.water.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/10 20:14
 **/
@Data
public class RankingListDto {

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 用户姓名
     */
    private String name;

    /**
     * 用户头像
     */
    private String head;

    /**
     * 用水量
     */
    private Integer waterConsumption;

}

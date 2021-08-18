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
public class DailyDto {

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 日期
     */
    private String waterDate;
}

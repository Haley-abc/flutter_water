package com.haley.water.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/16 20:18
 **/
@Data
@Accessors(chain = true)
@TableName("waterCon")
public class WaterConsumption {
    /**
     * 用水id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 对应用户id
     */
    private Integer userId;
    /**
     * 文章发表时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date waterDate;
    /**
     * 用水量
     */
    private Integer waterConsumption;
}

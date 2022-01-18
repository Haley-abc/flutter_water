package com.haley.water.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @description:
 * @author: haley
 * @create: 2022/1/18 10:25
 **/
@Data
@Accessors(chain = true)
@TableName("problem")
public class Problem {
    /**
     * 字段id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 题目
     */
    private String content;
    /**
     * a选项
     */
    private String a;
    /**
     * b选项
     */
    private String b;
    /**
     * c选项
     */
    private String c;
    /**
     * d选项
     */
    private String d;
    /**
     * 答案
     */
    private String answer;
}

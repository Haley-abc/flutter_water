package com.haley.demo.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haley.demo.entity.UserEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * @program: demo
 * @description: 用户dao
 * @author: haley
 * @create: 2021-07-09 19:07
 **/
@Mapper
public interface UserDao extends BaseMapper<UserEntity> {
}

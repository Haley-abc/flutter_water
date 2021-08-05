package com.haley.water.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/4 20:19
 **/
@Data
public class LoginDto {
    @NotBlank(message = "手机不能为空")
    private String phone;

    @NotBlank(message = "密码不能为空")
    private String password;
}

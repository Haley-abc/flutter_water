package com.haley.water.controller;

import com.haley.water.dto.FriendDto;
import com.haley.water.dto.LoginDto;
import com.haley.water.entity.User;
import com.haley.water.service.IFriendServiceImpl;
import com.haley.water.service.IUserServiceImpl;
import com.haley.water.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @description:
 * @author: haley
 * @create: 2021/8/4 20:07
 **/
@RestController
@RequestMapping("/friend")
public class FriendController {

    @Autowired
    private IFriendServiceImpl iFriendService;

    @GetMapping("/selectFriend")
    public Result selectFriend(int userId) {
        List<FriendDto> friendDtoList = iFriendService.selectFriend(userId);
        return Result.ok(friendDtoList);
    }

}

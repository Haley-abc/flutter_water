package com.haley.water.controller;

import com.haley.water.dto.AddFriendDto;
import com.haley.water.dto.FriendDto;
import com.haley.water.dto.SearchFriendDto;
import com.haley.water.entity.AddFriend;
import com.haley.water.entity.Friend;
import com.haley.water.service.IAddFriendServiceImpl;
import com.haley.water.service.IFriendServiceImpl;
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
@RequestMapping("/addFriend")
public class AddFriendController {

    @Autowired
    private IAddFriendServiceImpl iAddFriendService;

    @GetMapping("/getAddFriendList")
    public Result getAddFriendList(int userId) {
        List<AddFriendDto> addFriendDtoList = iAddFriendService.getAddFriendList(userId);
        return Result.ok(addFriendDtoList);
    }

    @PostMapping("/addFriendRequest")
    public Result addFriendRequest(@Validated @RequestBody AddFriend addFriend){
        boolean result = false;
        SearchFriendDto searchFriendDto = new SearchFriendDto();
        searchFriendDto.setUserId(addFriend.getUserId());
        searchFriendDto.setFriendId(addFriend.getFriendId());
        AddFriend addFriend1 = iAddFriendService.getAddFriend(searchFriendDto);
        if(addFriend1!=null){
            return Result.error("已发送好友请求");
        }else{
            result=iAddFriendService.addFriend(addFriend);
            if(result==true){
                return Result.ok("发送好友请求成功");
            }else{
                return Result.error("发送好友请求失败");
            }
        }
    }

    @GetMapping("/updateState")
    public Result updateState(int userId,int friendId,int state) {
        iAddFriendService.updateState(userId,friendId,state);
        if(state==0){
            return Result.ok("发送好友请求成功");
        }else if(state==1){
            return Result.ok("已同意");
        }else{
            return Result.ok("已拒绝");
        }
    }

}

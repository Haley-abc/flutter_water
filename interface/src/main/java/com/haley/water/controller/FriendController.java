package com.haley.water.controller;

import com.haley.water.dto.FriendDto;
import com.haley.water.dto.SearchFriendDto;
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
@RequestMapping("/friend")
public class FriendController {

    @Autowired
    private IFriendServiceImpl iFriendService;

    @Autowired
    private IAddFriendServiceImpl iAddFriendService;

    @GetMapping("/selectFriend")
    public Result selectFriend(int userId) {
        List<FriendDto> friendDtoList = iFriendService.selectFriendList(userId);
        return Result.ok(friendDtoList);
    }

    @GetMapping("/searchFriend")
    public Result searchFriend(String phone) {
        FriendDto user = iFriendService.searchUser(phone);
        if(user!=null){
            return Result.ok(user);
        }else{
            return Result.error("账号不存在");
        }
    }

    @PostMapping("/isFriendExit")
    public Result isFriendExit(@Validated @RequestBody SearchFriendDto searchFriendDto) {
        Friend friend = iFriendService.searchFriend(searchFriendDto);
        if(friend!=null){
            return Result.ok(friend);
        }else{
            return Result.error("未添加为好友");
        }
    }

    @PostMapping("/addFriend")
    public Result addFriend(@Validated @RequestBody Friend friend) {
        SearchFriendDto searchFriendDto = new SearchFriendDto();
        searchFriendDto.setUserId(friend.getUserId());
        searchFriendDto.setFriendId(friend.getFriendId());
        Friend isFriend = iFriendService.searchFriend(searchFriendDto);
        if(isFriend!=null){
            iAddFriendService.updateState(friend.getUserId(),friend.getFriendId(),1);
            return Result.ok("已经是好友了");
        }
        Friend friend1 = new Friend();
        friend1.setUserId(friend.getFriendId());
        friend1.setFriendId(friend.getUserId());
        boolean result1 = iFriendService.addFriend(friend1);
        boolean result2 = iFriendService.addFriend(friend);
        iAddFriendService.updateState(friend.getUserId(),friend.getFriendId(),1);
        if(result1&&result2){
            return Result.ok("添加成功");
        }else{
            return Result.error("添加失败");
        }
    }

    @PostMapping("/refuseAddFriend")
    public Result refuseAddFriend(@Validated @RequestBody Friend friend) {
        iAddFriendService.updateState(friend.getUserId(),friend.getFriendId(),2);
        return Result.ok("已拒绝");
    }

}

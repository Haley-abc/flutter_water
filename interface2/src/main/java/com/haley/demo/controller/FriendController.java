package com.haley.demo.controller;

import com.haley.demo.entity.UserEntity;
import com.haley.demo.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/friend")
public class FriendController {

    @Autowired
    private FriendService friendService;

    @GetMapping("/queryFriends")
    public List<UserEntity> queryFriends(int id){
        return friendService.queryFriends(id);
    }
}

package com.robo.robo.controllers;

import com.robo.robo.model.User;
import com.robo.robo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
public class MainContoller {
    @Autowired
    private UserService userService;
    @GetMapping("/")
    public String index(){
        return "index";
    }

    @GetMapping("/main")
    public String about(){
        return "main";
    }
}

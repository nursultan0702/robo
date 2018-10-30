package com.robo.robo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainContoller {
    @GetMapping("/")
    public String index(){
        return "index";
    }

    @GetMapping("/main")
    public String about(){
        return "main";
    }
}

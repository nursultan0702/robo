package com.robo.robo.controllers;

import com.robo.robo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserRepository userRepository;

    @GetMapping
    public String userList(Model model){
        model.addAttribute(userRepository.findAll());
        I am HERE https://www.youtube.com/watch?v=6dteOGWy4uk 1.50 min
        return "userList";
    }
}

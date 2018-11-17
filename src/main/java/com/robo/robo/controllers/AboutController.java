package com.robo.robo.controllers;

import com.robo.robo.model.Role;
import com.robo.robo.model.User;
import com.robo.robo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("about")
public class AboutController {
    @Autowired
    private UserService userService;
    @GetMapping
    public String about(Model model){
    List<User> teachersList =  userService.getByRole(Role.TEACHER);
    model.addAttribute("teachers",teachersList);
        return "about";
    }
}

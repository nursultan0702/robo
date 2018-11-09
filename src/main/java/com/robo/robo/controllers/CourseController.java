package com.robo.robo.controllers;

import com.robo.robo.model.*;
import com.robo.robo.service.CourseService;
import com.robo.robo.service.TaskService;
import com.robo.robo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.util.*;

@Controller
@RequestMapping("/course")
public class CourseController {
    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private TaskService taskService;

    @GetMapping
    public String course(Model model){
            model.addAttribute("courses",courseService.getAllCourses());
        return "course";
    }

    @GetMapping("/my")
    public String myCourses(Principal principal, Model model){
        String username = principal.getName();
        User user = userService.getByUsername(username);
        List<Course> courses = courseService.getStudentCourses(user);
        model.addAttribute("courses",courses);
        return "mycourses";
    }

    @GetMapping("/begin-course/{course}")
    public String addCourse(@PathVariable Course course, Principal principal){
        return "redirect:/course/my";
    }
}

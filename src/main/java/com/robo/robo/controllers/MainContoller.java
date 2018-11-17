package com.robo.robo.controllers;

import com.robo.robo.model.Course;
import com.robo.robo.model.News;
import com.robo.robo.model.User;
import com.robo.robo.service.CourseService;
import com.robo.robo.service.NewsService;
import com.robo.robo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainContoller {
    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private NewsService newsService;
    @GetMapping("/")
    public String index(Model model){
        List<Course> courses = courseService.getAllCourses();
        List<Course> lastCourses = new ArrayList<>();
        lastCourses.add(courses.get(courses.size()-1));
        lastCourses.add(courses.get(courses.size()-2));
        lastCourses.add(courses.get(courses.size()-3));
        lastCourses.add(courses.get(courses.size()-4));

        List<News> news = newsService.getNewsList();
        List<News> lastNews = new ArrayList<>();
        lastNews.add(news.get(news.size()-1));
        lastNews.add(news.get(news.size()-2));
        model.addAttribute("courses",lastCourses);
        model.addAttribute("news",news.get(news.size()-1));
        model.addAttribute("lastNews",lastNews);
        return "index";
    }

    @GetMapping("/main")
    public String about(){
        return "main";
    }
}

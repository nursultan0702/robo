package com.robo.robo.controllers;

import com.robo.robo.model.*;
import com.robo.robo.service.CourseService;
import com.robo.robo.service.TaskService;
import com.robo.robo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
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

    @GetMapping("/teachers/{id}")
    public String teachersCourses(@PathVariable(value = "id",required = false) User teacher, Model model){
       List<Course> courses = courseService.getTeacherCourses(teacher);
        model.addAttribute("courses",courses);
        return "course";
    }

    @GetMapping("/my")
    public String myCourses(@PathVariable(value = "id",required = false) User teacher, Principal principal, Model model){
        String username = principal.getName();
        User user = userService.getByUsername(username);
        List<Course> courses = new ArrayList<>();
        if(user.getRoles().contains(Role.STUDENT)) {
            courses = courseService.getStudentCourses(user);
        }else if(user.getRoles().contains(Role.TEACHER)){
            courses = courseService.getTeacherCourses(user);
        }else  if(user.getRoles().contains(Role.ADMIN)){
            courses = courseService.getAllCourses();
        }
        model.addAttribute("courses",courses);
        return "mycourses";
    }

    @GetMapping("/begin-course/{course}")
    public String addCourse(@PathVariable Course course, Principal principal){
        courseService.addToMy(course,principal);
        return "redirect:/course/my";
    }
    @GetMapping("/add-course")
    public String addCoure(){
        return "editcourse";
    }

    @GetMapping("/edit-course/{course}")
    public String editCourse(@PathVariable Course course, Principal principal,Model model) throws IOException {
        model.addAttribute("course",course);
        return "editcourse";
    }
    @PostMapping("/update-course")
    public String updateCourse(@RequestParam("name") String name,
                             @RequestParam("about") String about,
                             @RequestParam("price") Integer price,
                             @RequestParam("hours") Integer hours,
                             @RequestParam("id") Course course,
                             Principal principal,
                             @RequestParam("img") MultipartFile img) throws IOException {
        course.setName(name);
        course.setAbout(about);
        course.setHours(hours);
        course.setPrice(price);
        courseService.saveCourse(img,principal,course);
        return "redirect:/course";
    }
    @PostMapping("/save-course")
    public String saveCourse(@RequestParam("name") String name,
                             @RequestParam("about") String about,
                             @RequestParam("price") Integer price,
                             @RequestParam("hours") Integer hours,
                             Principal principal,
                             @RequestParam("img") MultipartFile img) throws IOException {
        Course course = new Course();
        course.setName(name);
        course.setAbout(about);
        course.setHours(hours);
        course.setPrice(price);
        courseService.saveCourse(img,principal,course);
        return "redirect:/course";
    }

    @PostMapping("/delete/{course}")
    public String deleteCourse(@PathVariable Course course){
        courseService.deleteCourse(course);
        return "redirect:/course";
    }
}

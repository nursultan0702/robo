package com.robo.robo.controllers;

import com.robo.robo.model.Course;
import com.robo.robo.model.Task;
import com.robo.robo.model.User;
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
import java.util.List;

@Controller
@RequestMapping("/task")
public class TaskController {
    @Autowired
    private TaskService taskService;
    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;

    @GetMapping("{course}")
    public String task(@PathVariable Course course, Principal principal, Model model){
        String name = principal.getName();
        User username = userService.getByUsername(name);
        List<Task> tasks = taskService.getTaskByCourse(course);
        model.addAttribute("course",course);
        model.addAttribute("tasks",tasks);
        return "task";
    }


    @PostMapping("/add-task")
    public String addTask(@RequestParam("id") Course course,
                          @RequestParam("name") String taskName,
                          @RequestParam("video") String video,
                          @RequestParam("about") String about,
                          @RequestParam("file") MultipartFile file,
                          Principal principal

    ) throws IOException {
        taskService.addTask(course,taskName,video,about,file,principal);
        return "redirect:/task/"+course.getId();
    }
}

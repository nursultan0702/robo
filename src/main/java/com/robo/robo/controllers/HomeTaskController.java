package com.robo.robo.controllers;

import com.robo.robo.model.Course;
import com.robo.robo.model.HomeTask;
import com.robo.robo.model.Task;
import com.robo.robo.model.User;
import com.robo.robo.service.HomeTaskService;
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
@RequestMapping("/hometask")
public class HomeTaskController {
    @Autowired
    private UserService userService;
    @Autowired
    private TaskService taskService;
    @Autowired
    private HomeTaskService homeTaskService;

    @GetMapping("/add-hometask/{id}")
    public String addHomeTask(@PathVariable("id") Task task,Model model){
        Course course = task.getCourse();
        model.addAttribute("task",task);
        model.addAttribute("course",course);
        return "hometask";
    }
    @GetMapping("/hometask-check/{id}")
    public String checkHomeTask(@PathVariable("id") Task task, Model model){
        List<HomeTask> homeTasks = homeTaskService.getAllByTask(task);
        model.addAttribute("hometasks",homeTasks);
        model.addAttribute("task",task);
        return "hometaskcheck";
    }

    @PostMapping("/save-hometask")
    public String saveHomeTask(
            @RequestParam("courseid") Course course,
            @RequestParam("taskid") Task task,
            @RequestParam("comment") String comment,
            @RequestParam("file")MultipartFile file,
            Principal principal
            ) throws IOException {
        homeTaskService.addHomeTask(course,task,comment,file,principal);
        return "redirect:/task/open/"+course.getId();
    }

    @PostMapping("/save-hometask-mark")
    public String saveMark(@RequestParam("id") HomeTask homeTask, @RequestParam("mark") String mark){
        homeTaskService.saveMark(homeTask,mark);
        return "redirect:/hometask/hometask-check/"+homeTask.getTask().getId();
    }
}

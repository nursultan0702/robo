package com.robo.robo.controllers;

import com.robo.robo.model.*;
import com.robo.robo.service.CourseService;
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
@RequestMapping("/task")
public class TaskController {
    @Autowired
    private TaskService taskService;
    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private HomeTaskService homeTaskService;

    @GetMapping("/open/{course}")
    public String task(@PathVariable Course course, Principal principal, Model model){
        String name = principal.getName();
        User user = userService.getByUsername(name);
        List<Task> tasks = taskService.getTaskByCourse(course);
        if(user.getRoles().contains(Role.STUDENT))
        {
            List<HomeTask> homeTasks = homeTaskService.getAllByStudent(user);
            model.addAttribute("hometasks",homeTasks);
        }
        model.addAttribute("course",course);
        model.addAttribute("tasks",tasks);
        return "task";
    }
    @GetMapping("/add-task/{course}")
    public String addnewTask(@PathVariable Course course, Principal principal, Model model){
        String name = principal.getName();
        User username = userService.getByUsername(name);
        model.addAttribute("course",course);
        return "addtask";
    }

    @PostMapping("/search-task")
    public String searchTask(@RequestParam("taskName") String  taskName, Model model){
        List<Task> tasks = taskService.getTaskByName(taskName);
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
        return "redirect:/task/open/"+course.getId();
    }
    @PostMapping("/update-task")
    public String updateTask(@RequestParam("id") Course course,
                          @RequestParam("taskid") Task task,
                          @RequestParam("name") String taskName,
                          @RequestParam("video") String video,
                          @RequestParam("about") String about,
                          @RequestParam("file") MultipartFile file,
                          Principal principal

    ) throws IOException {
        taskService.updateTask(course,taskName,video,about,file,principal,task);
        return "redirect:/task/open/"+course.getId();
    }
    @PostMapping("/delete")
    public String deleteTask(@RequestParam("taskId") Task task){
        Course course = task.getCourse();
        taskService.deleteTask(task);
        return "redirect:/task/open/"+course.getId();
    }
}

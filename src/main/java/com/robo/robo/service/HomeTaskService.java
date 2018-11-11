package com.robo.robo.service;

import com.robo.robo.model.Course;
import com.robo.robo.model.HomeTask;
import com.robo.robo.model.Task;
import com.robo.robo.model.User;
import com.robo.robo.repository.HomeTaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

@Service
public class HomeTaskService {
    @Autowired
    private UserService userService;
    @Autowired
    private TaskService taskService;
    @Autowired
    private HomeTaskRepository homeTaskRepository;
    @Value("${upload.path}")
    private String path;

    public void addHomeTask(Course course, Task task, String comment, MultipartFile file, Principal principal) throws IOException {
        HomeTask homeTask = new HomeTask();
        homeTask.setComments(comment);
        homeTask.setStudent(userService.getByUsername(principal.getName()));
        homeTask.setTask(task);
        homeTask.setMark("unmarked");

        if(file != null && !file.getOriginalFilename().isEmpty()){
            File uploadDir = new File(path);
            if(!uploadDir.exists() && !file.getOriginalFilename().isEmpty()) {
                uploadDir.mkdir();
            }
            String  uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(path + "/" + resultFileName));
            homeTask.setFile(resultFileName);

        }
        homeTaskRepository.save(homeTask);
    }

    public List<HomeTask> getAllByTask(Task task) {
        return homeTaskRepository.findByTask(task);
    }

    public void saveMark(HomeTask homeTask, String mark) {
        homeTask.setMark(mark);
        homeTaskRepository.save(homeTask);
    }

    public List<HomeTask> getAllByStudent(User user) {
        return homeTaskRepository.findByStudent(user);
    }
}

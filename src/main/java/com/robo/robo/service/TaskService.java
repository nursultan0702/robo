package com.robo.robo.service;

import com.robo.robo.model.Course;
import com.robo.robo.model.Task;
import com.robo.robo.model.User;
import com.robo.robo.repository.TaskRepository;
import com.robo.robo.repository.UserRepository;
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
public class TaskService {
    @Autowired
    private TaskRepository taskRepository;
    @Autowired
    private UserRepository userRepository;
    @Value("${upload.path}")
    private String path;

    public List<Task> getTaskByCourse(Course course){
        return taskRepository.findByCourse(course);
    }


    public void addTask(Course course, String taskName, String video, String about, MultipartFile file, Principal principal) throws IOException {
        Task task = new Task();
        task.setTaskName(taskName);
        task.setVideo(video);
        task.setAbout(about);
        task.setCourse(course);
        if(file != null){
            File uploadDir = new File(path);
            User user = userRepository.findByUsername(principal.getName());
            if(!uploadDir.exists() && !file.getOriginalFilename().isEmpty()) {
                uploadDir.mkdir();
            }
            String  uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(path + "/" + resultFileName));
            task.setLectureFileName(resultFileName);

        }
        taskRepository.save(task);
    }
}

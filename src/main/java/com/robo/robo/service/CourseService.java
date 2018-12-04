package com.robo.robo.service;

import com.robo.robo.model.Course;
import com.robo.robo.model.Role;
import com.robo.robo.model.Task;
import com.robo.robo.model.User;
import com.robo.robo.repository.CourseRepository;
import com.robo.robo.repository.TaskRepository;
import com.robo.robo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

@Service
public class CourseService {
    @Autowired
    private CourseRepository courseRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private TaskRepository taskRepository;
    @Value("${upload.image.path}")
    private String path;

    public List<Course> getStudentCourses(User user) {
        return courseRepository.findByStudents(Collections.singletonList(user));
    }

    public List<Course> getTeacherCourses(User user) {
        return courseRepository.findByTeacher(user);
    }

    public void saveCourse(MultipartFile file, Principal principal, Course course) throws IOException {
        if (file != null) {
            File uploadDir = new File(path);
            User user = userRepository.findByUsername(principal.getName());
            if (!uploadDir.exists() && !file.getOriginalFilename().isEmpty()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            List<User> students = course.getStudents();
            String resultFileName = uuidFile + file.getOriginalFilename();
            file.transferTo(new File(path + "/" + resultFileName));
            course.setImg("/img/"+resultFileName);
            if(user.getRoles().contains(Role.STUDENT)){
                students.add(user);
                course.setStudents(students);
            }else{
                course.setTeacher(user);
            }
            courseRepository.save(course);
        }
    }

    public  List<Course> getAllCourses(){
        return courseRepository.findAll();
    }

    public void deleteCourse(Course course) {
        List<Task> tasks = taskRepository.findByCourse(course);
        for (Task task : tasks) {
            taskRepository.delete(task);
        }
        courseRepository.delete(course);
    }

    public void addToMy(Course course, Principal principal) {
        User student = userRepository.findByUsername(principal.getName());
        List<User> students = course.getStudents();
        students.add(student);
        course.setStudents(students);
        courseRepository.save(course);
    }
}

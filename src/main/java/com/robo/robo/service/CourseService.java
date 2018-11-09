package com.robo.robo.service;

import com.robo.robo.model.Course;
import com.robo.robo.model.User;
import com.robo.robo.repository.CourseRepository;
import com.robo.robo.repository.TaskRepository;
import com.robo.robo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {
    @Autowired
    private CourseRepository courseRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private TaskRepository taskRepository;

    public List<Course> getStudentCourses(User user) {
        return courseRepository.findByStudent(user);
    }

    public  List<Course> getAllCourses(){
        return courseRepository.findAll();
    }
//    public void TestCourse(User user){
//        Course course = new Course();
//        Task task = new Task();
//        Task task1 = new Task();
//
//        course.setName("C++ course");
//        course.setStudent(user);
//        User teacher = userRepository.findByUsername("admin@mail.ru");
//        course.setTeacher(teacher);
//
//        task.setCourse(course);
//        task.setTaskName("Test task c++ course");
//        task1.setCourse(course);
//        task1.setTaskName("Test task java course");
//
//        courseRepository.save(course);
//        taskRepository.save(task);
//        taskRepository.save(task1);
//
//    }
}
